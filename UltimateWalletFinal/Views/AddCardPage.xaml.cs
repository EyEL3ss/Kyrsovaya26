using System.Collections.ObjectModel;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;
namespace UltimateWalletFinal.Views;

public partial class AddCardPage : ContentPage
{
    private Users _currentUser;
    private Shop _selectedShop;
    private Category _selectedCategory;

    public AddCardPage(Users user)
    {
        InitializeComponent();
        _currentUser = user;

        // Загружаем списки магазинов и категорий
        LoadShopsAndCategories();
    }

    private async void LoadShopsAndCategories()
    {
        try
        {
            loadingIndicator.IsVisible = true;

            // Загружаем магазины
            var shops = await DataBaseService.Instance.GetAllShopsAsync();
            shopPicker.ItemsSource = shops;

            // Загружаем категории
            var categories = await DataBaseService.Instance.GetAllCategoriesAsync();
            categoryPicker.ItemsSource = categories;

        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось загрузить данные: {ex.Message}", "OK");
        }
        finally
        {
            loadingIndicator.IsVisible = false;
        }
    }

    // Обработчики выбора
    private void OnShopSelected(object sender, EventArgs e)
    {
        if (shopPicker.SelectedItem is Shop shop)
        {
            _selectedShop = shop;
        }
        UpdateSaveButtonState();
    }

    private void OnCategorySelected(object sender, EventArgs e)
    {
        if (categoryPicker.SelectedItem is Category category)
        {
            _selectedCategory = category;
        }
        UpdateSaveButtonState();
    }

    // Валидация в реальном времени
    private void OnCardNameTextChanged(object sender, TextChangedEventArgs e)
    {
        UpdateSaveButtonState();
    }

    private void OnCardNumberTextChanged(object sender, TextChangedEventArgs e)
    {
        try
        {
            // Разрешаем ввод до 23 символов (19 цифр + пробелы)
            const int maxLength = 23;

            string currentText = cardNumberEntry.Text ?? "";

            // Если текст слишком длинный, обрезаем
            if (currentText.Length > maxLength)
            {
                cardNumberEntry.Text = currentText.Substring(0, maxLength);
                return;
            }

            // Просто считаем цифры для валидации
            int digitCount = currentText.Count(char.IsDigit);

            // Минимальная валидация
            bool hasMinimumDigits = digitCount >= 12;
            bool hasMaximumDigits = digitCount <= 19;

            // Можно показать подсказку
            if (!hasMinimumDigits && digitCount > 0)
            {
                // Например, изменить цвет рамки
            }

            UpdateSaveButtonState();
        }
        catch (Exception ex)
        {
            // Логируем ошибку, но не падаем
            Console.WriteLine($"Ошибка обработки номера: {ex.Message}");
        }
    }

    // А форматирование делаем только при сохранении
    private string GetCleanCardNumber()
    {
        if (string.IsNullOrEmpty(cardNumberEntry.Text))
            return "";

        // Удаляем все нецифровые символы
        return new string(cardNumberEntry.Text.Where(char.IsDigit).ToArray());
    }

    private void OnDateTextChanged(object sender, TextChangedEventArgs e)
    {

    }

    // Обновление состояния кнопки сохранения
    private void UpdateSaveButtonState()
    {
        bool isValid =
            !string.IsNullOrWhiteSpace(cardNameEntry.Text) &&
            !string.IsNullOrWhiteSpace(cardNumberEntry.Text) &&
            cardNumberEntry.Text.Replace(" ", "").Length >= 12; // Минимум 12 цифр
    }

    // Загрузка изображения
    private async void OnUploadImageClicked(object sender, EventArgs e)
    {
        try
        {
            var result = await FilePicker.PickAsync(new PickOptions
            {
                PickerTitle = "Выберите изображение карты",
                FileTypes = FilePickerFileType.Images
            });

            if (result != null)
            {
                // Для демо - просто показываем путь
                imageUrlEntry.Text = result.FullPath;

                // Показываем предпросмотр
                imagePreviewFrame.IsVisible = true;
                imagePreview.Source = ImageSource.FromFile(result.FullPath);

                await DisplayAlert("Успех",
                    $"Выбрано изображение: {result.FileName}",
                    "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось выбрать изображение: {ex.Message}", "OK");
        }
    }

    // Основной метод сохранения карты
    private async void OnSaveClicked(object sender, EventArgs e)
    {
        if (!ValidateForm())
            return;

        try
        {
            loadingIndicator.IsVisible = true;
            loadingIndicator.IsRunning = true;

            // 1. Создаем объект Card
            var newCard = new Card
            {
                CardName = cardNameEntry.Text.Trim(),
                CardNumber = cardNumberEntry.Text.Replace(" ", ""), // Убираем пробелы
                CardCW = cardCvEntry.Text?.Trim(),
                CardDescription = cardDescriptionEditor.Text?.Trim(),
                CardUser = _currentUser.Id, // ID текущего пользователя
                CardCreateDate = DateTime.Now,
                LastUse = null // Еще не использовалась
            };

         

            // 3. Устанавливаем магазин и категорию если выбраны
            if (_selectedShop != null)
            {
                newCard.CardShopId = _selectedShop.Id;
                Console.WriteLine($"Магазин ID: {_selectedShop.Id}");
            }

            if (_selectedCategory != null)
            {
                newCard.CardCategoryId = _selectedCategory.Id;
                Console.WriteLine($"Категория ID: {_selectedCategory.Id}");
            }

            // 4. Создаем изображение если есть URL
            CardImage cardImage = null;
            if (!string.IsNullOrWhiteSpace(imageUrlEntry.Text))
            {
                cardImage = new CardImage
                {
                    CardImageUrl = imageUrlEntry.Text.Trim(),
                    CardImageName = $"{newCard.CardName}_image"
                };
                Console.WriteLine($"Изображение: {cardImage.CardImageUrl}");
            }

            // 5. Сохраняем карту в базу
            var success = await CardService.Instance.AddCardAsync(newCard, cardImage);

            if (success)
            {
                await DisplayAlert("Успех",
                    "Карта успешно добавлена!",
                    "OK");

                // Возвращаемся на предыдущую страницу
                await Navigation.PopAsync();
            }
            else
            {
                await DisplayAlert("Ошибка",
                    "Не удалось сохранить карту. Проверьте данные.",
                    "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка",
                $"Произошла ошибка при сохранении: {ex.Message}",
                "OK");
            Console.WriteLine($"Ошибка сохранения: {ex}");
        }
        finally
        {
            saveButton.IsEnabled = true;
            loadingIndicator.IsVisible = false;
            loadingIndicator.IsRunning = false;
        }
    }

    // Валидация формы
    private bool ValidateForm()
    {
        var errors = "";

        // Проверка названия
        if (string.IsNullOrWhiteSpace(cardNameEntry.Text))
            errors += "• Введите название карты\n";
        else if (cardNameEntry.Text.Length > 200)
            errors += "• Название не должно превышать 200 символов\n";

        // Проверка номера карты
        var cardNumber = cardNumberEntry.Text?.Replace(" ", "") ?? "";
        if (string.IsNullOrWhiteSpace(cardNumber))
            errors += "• Введите номер карты\n";
        else if (cardNumber.Length < 12 || cardNumber.Length > 19)
            errors += "• Номер карты должен содержать от 12 до 19 цифр\n";
        else if (!Regex.IsMatch(cardNumber, @"^\d+$"))
            errors += "• Номер карты должен содержать только цифры\n";

        // Проверка CVV
        if (!string.IsNullOrWhiteSpace(cardCvEntry.Text))
        {
            if (!Regex.IsMatch(cardCvEntry.Text, @"^\d{3,4}$"))
                errors += "• CVV/CVC должен содержать 3 или 4 цифры\n";
        }



        if (!string.IsNullOrEmpty(errors))
        {
            DisplayAlert("Ошибки ввода", errors.Trim(), "OK");
            return false;
        }

        return true;
    }

    // Парсинг даты MM/YY
    private bool TryParseCardDate(string input, out DateOnly result)
    {
        result = default;

        try
        {
            input = input.Replace("/", "");
            if (input.Length != 4)
                return false;

            int month = int.Parse(input.Substring(0, 2));
            int year = int.Parse(input.Substring(2, 2)) + 2000;

            if (month < 1 || month > 12)
                return false;

            // Добавляем последний день месяца
            result = new DateOnly(year, month, DateTime.DaysInMonth(year, month));
            return true;
        }
        catch
        {
            return false;
        }
    }

    // Отмена
    private async void OnCancelClicked(object sender, EventArgs e)
    {
        bool confirm = await DisplayAlert("Подтверждение",
            "Отменить добавление карты?",
            "Да", "Нет");

        if (confirm)
        {
            await Navigation.PopAsync();
        }
    }

    // При закрытии страницы
    protected override bool OnBackButtonPressed()
    {
        Task.Run(async () =>
        {
            bool confirm = await DisplayAlert("Подтверждение",
                "Отменить добавление карты?",
                "Да", "Нет");

            if (confirm)
            {
                await Navigation.PopAsync();
            }
        });

        return true; // Отменяем стандартное поведение
    }
}