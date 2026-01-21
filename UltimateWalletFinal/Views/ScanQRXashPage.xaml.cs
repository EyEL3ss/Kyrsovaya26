namespace UltimateWalletFinal.Views;
using Microsoft.Maui.Controls;
using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using UltimateWalletFinal.Classes;
using ZXing.Net.Maui;

public partial class ScanQRXashPage : ContentPage
{
    private Users _currentUser;
    private bool _isProcessing = false;
    private string _lastScannedCode = "";
    private DateTime _lastScanTime = DateTime.MinValue;
    private bool _isPaused = false;

    public ScanQRXashPage(Users user)
	{
		InitializeComponent();
        _currentUser = user;
    //    formatPicker.SelectedIndex = 0; 
        SetupCamera();
    }
    private void SetupCamera()
    {
        cameraBarcodeReaderView.Options = new BarcodeReaderOptions
        {
            Formats = BarcodeFormats.All,
            AutoRotate = true,
            TryHarder = true,
            Multiple = false,
            TryInverted = true
        };
        CheckCameraAvailability();
    }

    private async void CheckCameraAvailability()
    {
        try
        {
            var status = await Permissions.CheckStatusAsync<Permissions.Camera>();

            if (status != PermissionStatus.Granted)
            {
                status = await Permissions.RequestAsync<Permissions.Camera>();

                if (status != PermissionStatus.Granted)
                {
                    await DisplayAlert("Ошибка",
                        "Для работы сканера требуется разрешение на использование камеры",
                        "OK");
                }
            }
        }

        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось получить доступ к камере: {ex.Message}", "OK");
        }
    }

    private async void OnBarcodeDetected(object sender, BarcodeDetectionEventArgs e)
    {
        try
        {
            if (_isProcessing || e.Results == null || !e.Results.Any())
                return;

            var result = e.Results.First();
            var scannedValue = result.Value;

            // Защита от повторного сканирования того же кода
            if (scannedValue == _lastScannedCode &&
                (DateTime.Now - _lastScanTime).TotalSeconds < 2)
                return;

            _lastScannedCode = scannedValue;
            _lastScanTime = DateTime.Now;

            Console.WriteLine($"Сканировано: {scannedValue}");
            Console.WriteLine($"Формат: {result.Format}");

            // Обрабатываем в главном потоке
            await MainThread.InvokeOnMainThreadAsync(async () =>
            {
                await ProcessScannedCode(scannedValue, result.Format);
            });
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка обработки кода: {ex.Message}");
        }
    }

    private async Task ProcessScannedCode(string code, BarcodeFormat format)
    {
        try
        {
            _isProcessing = true;
            loadingIndicator.IsVisible = true;

            // Определяем тип кода и парсим
            var scanResult = await ParseScannedCode(code, format);

            await MainThread.InvokeOnMainThreadAsync(() =>
            {
                resultFrame.IsVisible = true;

                if (scanResult.IsValid)
                {
                    resultLabel.Text = $"Найдена карта: {scanResult.CardName}\n" +
                                      $"Номер: {scanResult.CardNumber}\n" +
                                      $"Тип: {scanResult.CodeType}";
                    resultFrame.BackgroundColor = Color.FromArgb("#E8F5E9");
                    resultLabel.TextColor = Color.FromArgb("#388E3C");
                }
                else
                {
                    resultLabel.Text = $"Не удалось распознать карту\n" +
                                      $"Код: {code.Substring(0, Math.Min(code.Length, 30))}...";
                    resultFrame.BackgroundColor = Color.FromArgb("#FFEBEE");
                    resultLabel.TextColor = Color.FromArgb("#D32F2F");
                }

                // Сохраняем результат для дальнейшей обработки
                processButton.CommandParameter = scanResult;
            });
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось обработать код: {ex.Message}", "OK");
        }
        finally
        {
            _isProcessing = false;
            loadingIndicator.IsVisible = false;
        }
    }
    private async Task<ScanResult> ParseScannedCode(string code, BarcodeFormat format)
    {
        var result = new ScanResult
        {
            RawCode = code,
            Format = format.ToString(),
            ScanTime = DateTime.Now
        };

        Console.WriteLine($"Парсинг кода: {code}, формат: {format}");

        // 1. Проверяем стандартные форматы штрих-кодов карт
        result = await ParseStandardBarcode(code, format, result);

        // 2. Проверяем QR-коды со структурированными данными
        if (!result.IsValid)
            result = await ParseQRCodeData(code, result);

        // 3. Пробуем извлечь номер карты из любого текста
        if (!result.IsValid)
            result = await ExtractCardNumberFromText(code, result);

        // 4. Если ничего не нашли, используем как есть
        if (!result.IsValid)
        {
            result.CardNumber = code;
            result.CardName = $"Карта из {format}";
            result.IsValid = true;
            result.CodeType = "Неизвестный формат";
        }

        return result;
    }
    private async Task<ScanResult> ParseStandardBarcode(string code, BarcodeFormat format, ScanResult result)
    {
        try
        {
            switch (format)
            {
                case BarcodeFormat.Ean13:
                case BarcodeFormat.UpcA:
                    // Обычно это штрих-коды продуктов, но могут быть и карты
                    if (code.Length == 13 || code.Length == 12)
                    {
                        result.CardNumber = code;
                        result.CardName = $"Карта {format}";
                        result.IsValid = true;
                        result.CodeType = "Штрих-код товара";
                    }
                    break;

                case BarcodeFormat.Code128:
                case BarcodeFormat.Code39:
                    // Code 128/39 часто используется для карт лояльности
                    result = await ParseCode128Card(code, result);
                    break;

                case BarcodeFormat.Pdf417:
                    // PDF417 используется в некоторых картах
                    result.CardNumber = code;
                    result.CardName = "PDF417 Карта";
                    result.IsValid = true;
                    result.CodeType = "PDF417 код";
                    break;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка парсинга {format}: {ex.Message}");
        }

        return result;
    }
    // Парсинг Code 128 (распространен для карт)
    private async Task<ScanResult> ParseCode128Card(string code, ScanResult result)
    {
        // Примеры форматов карт в Code 128:
        // "6291001503" - номер карты
        // "CARD=1234567890" - с префиксом
        // "6291001503|John Doe" - с разделителем

        if (code.Length >= 8 && code.Length <= 20)
        {
            // Проверяем, похож ли на номер карты
            if (Regex.IsMatch(code, @"^\d+$"))
            {
                result.CardNumber = code;
                result.CardName = "Карта лояльности";
                result.IsValid = true;
                result.CodeType = "Code 128 карта";
            }
            else if (code.Contains("="))
            {
                // Формат "KEY=VALUE"
                var parts = code.Split('=');
                if (parts.Length == 2 && parts[0].ToUpper().Contains("CARD"))
                {
                    result.CardNumber = parts[1];
                    result.CardName = "Карта с префиксом";
                    result.IsValid = true;
                    result.CodeType = "Code 128 с данными";
                }
            }
            else if (code.Contains("|"))
            {
                // Формат с разделителем
                var parts = code.Split('|');
                result.CardNumber = parts[0];
                if (parts.Length > 1)
                    result.CardName = $"Карта {parts[1]}";
                else
                    result.CardName = "Карта";
                result.IsValid = true;
                result.CodeType = "Code 128 составной";
            }
        }

        return result;
    }

    // Парсинг QR-кодов с структурированными данными
    private async Task<ScanResult> ParseQRCodeData(string code, ScanResult result)
    {
        try
        {
            // 1. Проверяем JSON данные
            if (code.Trim().StartsWith("{") && code.Trim().EndsWith("}"))
            {
         //      result = await ParseJsonCardData(code, result);
              if (result.IsValid) return result;
            }

            // 2. Проверяем URL с параметрами
            if (code.StartsWith("http") && code.Contains("?"))
            {
        //      result = await ParseUrlCardData(code, result);
                if (result.IsValid) return result;
            }

            // 3. Проверяем vCard (контактные данные)
            if (code.StartsWith("BEGIN:VCARD"))
            {
       //        result = ParseVCardData(code, result);
               if (result.IsValid) return result;
            }

            // 4. Проверяем простой текст с номером карты
            result = await ExtractCardNumberFromText(code, result);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка парсинга QR: {ex.Message}");
        }

        return result;
    }

    // Извлечение номера карты из произвольного текста
    private async Task<ScanResult> ExtractCardNumberFromText(string text, ScanResult result)
    {
        try
        {
            // Ищем последовательности цифр похожие на номера карт
            var matches = Regex.Matches(text, @"\d{8,20}");

            foreach (Match match in matches)
            {
                var number = match.Value;

                // Проверяем, похож ли на номер карты
                if (IsLikelyCardNumber(number))
                {
                    result.CardNumber = number;
                    result.CardName = "Распознанная карта";
                    result.IsValid = true;
                    result.CodeType = "Текстовый номер";

                    // Пробуем определить магазин по номеру (если есть база)
                    var shop = await GuessShopByCardNumber(number);
                    if (shop != null)
                    {
                        result.ShopName = shop;
                        result.CardName = $"Карта {shop}";
                    }

                    break;
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка извлечения номера: {ex.Message}");
        }

        return result;
    }

    // Эвристическая проверка: похож ли на номер карты
    private bool IsLikelyCardNumber(string number)
    {
        if (string.IsNullOrEmpty(number) || number.Length < 8)
            return false;

        // Не все цифры одинаковые (исключаем "00000000")
        if (number.Distinct().Count() == 1)
            return false;

        // Проверяем контрольную сумму Луна (для некоторых карт)
        if (number.Length >= 12 && number.Length <= 19)
        {
            if (PassesLuhnCheck(number))
                return true;
        }

        // Дополнительные эвристики
        return number.Length >= 8 && number.Length <= 20;
    }

    // Алгоритм Луна для проверки номеров карт
    private bool PassesLuhnCheck(string number)
    {
        try
        {
            int sum = 0;
            bool alternate = false;

            for (int i = number.Length - 1; i >= 0; i--)
            {
                if (!char.IsDigit(number[i]))
                    return false;

                int n = int.Parse(number[i].ToString());

                if (alternate)
                {
                    n *= 2;
                    if (n > 9)
                        n = (n % 10) + 1;
                }

                sum += n;
                alternate = !alternate;
            }

            return (sum % 10 == 0);
        }
        catch
        {
            return false;
        }
    }

    // Угадываем магазин по номеру карты (можно расширить)
    private async Task<string> GuessShopByCardNumber(string number)
    {
        // Простая база префиксов (можно вынести в БД)
        var prefixDatabase = new Dictionary<string, string>
            {
                { "6291", "СберСпасибо" },
                { "4600", "Пятерочка" },
                { "2200", "Магнит" },
                { "5100", "Лента" },
                { "4100", "Ашан" },
                { "5555", "МВидео" },
                { "4444", "Эльдорадо" },
                { "7777", "Спортмастер" },
                // Добавьте свои префиксы
            };

        foreach (var prefix in prefixDatabase)
        {
            if (number.StartsWith(prefix.Key))
                return prefix.Value;
        }

        // Можно сделать запрос к API или локальной БД
        return null;
    }

    // Обработка результата сканирования
    private async void OnProcessResultClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.CommandParameter is ScanResult scanResult)
        {
            await Navigation.PushAsync(new AddCardFromScanPage(scanResult, _currentUser));
        }
    }

    // Ручное сканирование (кнопка)
    private void OnManualScanTapped(object sender, EventArgs e)
    {
        // Можно добавить вибрацию
        Vibration.Default.Vibrate(100);
    }

    // Переключение камеры
    private void OnSwitchCameraClicked(object sender, EventArgs e)
    {
        cameraBarcodeReaderView.CameraLocation = cameraBarcodeReaderView.CameraLocation == CameraLocation.Rear
            ? CameraLocation.Front
            : CameraLocation.Rear;
    }

    // Ручной ввод
    private async void OnManualInputClicked(object sender, EventArgs e)
    {
        var manualCode = await DisplayPromptAsync(
            "Ручной ввод кода",
            "Введите номер карты или отсканированный код:",
            "Добавить",
            "Отмена",
            "Код карты",
            -1,
            Keyboard.Numeric);

        if (!string.IsNullOrEmpty(manualCode))
        {
        //    var scanResult = await ParseScannedCode(manualCode, BarcodeFormat.Unknown);
       //    await Navigation.PushAsync(new AddCardFromScanPage(scanResult, _currentUser));
        }
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        cameraBarcodeReaderView.IsDetecting = true;
    }

    protected override void OnDisappearing()
    {
        base.OnDisappearing();
        cameraBarcodeReaderView.IsDetecting = false;
    }
}
public class ScanResult
    {
        public string RawCode { get; set; }
        public string Format { get; set; }
        public string CardNumber { get; set; }
        public string CardName { get; set; }
        public string ShopName { get; set; }
        public string CodeType { get; set; }
        public bool IsValid { get; set; }
        public DateTime ScanTime { get; set; }
        public Dictionary<string, string> AdditionalData { get; set; } = new();
    }