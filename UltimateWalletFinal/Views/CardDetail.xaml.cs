using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;
namespace UltimateWalletFinal.Views;

public partial class CardDetail : ContentPage
{
    private Card _cardDetails;
    private Users _currentUser;
    private bool isFavorite;
    private bool _isCardNumberVisible = false;
    private bool _isCvvVisible = false;

    public CardDetail(Card cardDetails, Users user)
    {
        InitializeComponent();
        _cardDetails = cardDetails;
        _currentUser = user;

        BindingContext = _cardDetails;

        // Настраиваем начальное состояние
        InitializePage();
    }

    private void InitializePage()
    {
        try
        {
            // Настраиваем иконку избранного
            UpdateFavoriteButton();

            // Проверяем срок действия карты
            CheckCardExpiry();

            // Проверяем наличие описания
            CheckDescription();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка инициализации: {ex.Message}");
        }
    }

    // Проверка срока действия карты
    private void CheckCardExpiry()
    {
        if (_cardDetails.CardDate == null)
        {
            expiryIndicator.BackgroundColor = Color.FromArgb("#FFECB3");
            expiryStatusLabel.Text = "Без срока";
            expiryStatusLabel.TextColor = Color.FromArgb("#FF8F00");
            return;
        }

        var expiryDate = _cardDetails.CardDate.Value;
        var today = DateOnly.FromDateTime(DateTime.Now);
        var daysUntilExpiry = expiryDate.DayNumber - today.DayNumber;

        if (daysUntilExpiry < 0)
        {
            // Просрочена
            expiryIndicator.BackgroundColor = Color.FromArgb("#FFCDD2");
            expiryStatusLabel.Text = "ПРОСРОЧЕНА";
            expiryStatusLabel.TextColor = Color.FromArgb("#D32F2F");
        }
        else if (daysUntilExpiry <= 30)
        {
            // Скоро истекает (менее 30 дней)
            expiryIndicator.BackgroundColor = Color.FromArgb("#FFF3E0");
            expiryStatusLabel.Text = $"Истекает через {daysUntilExpiry} дн.";
            expiryStatusLabel.TextColor = Color.FromArgb("#FF9800");
        }
        else
        {
            // Действительна
            expiryIndicator.BackgroundColor = Color.FromArgb("#E8F5E9");
            expiryStatusLabel.Text = "Действительна";
            expiryStatusLabel.TextColor = Color.FromArgb("#388E3C");
        }
    }

    // Проверка наличия описания
    private void CheckDescription()
    {
        bool hasDescription = !string.IsNullOrWhiteSpace(_cardDetails.CardDescription);
    }
    private string FormatCardNumber(string cardNumber)
    {
        if (string.IsNullOrEmpty(cardNumber))
            return "Нет номера";

        // Убираем все нецифровые символы
        string digitsOnly = new string(cardNumber.Where(char.IsDigit).ToArray());

        // Форматируем: XXXX XXXX XXXX XXXX
        if (digitsOnly.Length <= 4)
            return digitsOnly;

        string formatted = "";
        for (int i = 0; i < digitsOnly.Length; i++)
        {
            if (i > 0 && i % 4 == 0)
                formatted += " ";
            formatted += digitsOnly[i];
        }

        return formatted;
    }

    // Показать/скрыть CVV
    private void OnShowCvvClicked(object sender, EventArgs e)
    {
        try
        {
            _isCvvVisible = !_isCvvVisible;

            if (_isCvvVisible)
            {
                if (!string.IsNullOrEmpty(_cardDetails.CardCW))
                {
                    cvvLabel.Text = _cardDetails.CardCW;
                    ((Button)sender).Text = "🙈 Скрыть";
                    Console.WriteLine($"Показан CVV: {_cardDetails.CardCW}");
                }
                else
                {
                    cvvLabel.Text = "Не указан";
                    DisplayAlert("Информация", "CVV/CVC код не указан для этой карты", "OK");
                }
            }
            else
            {
                cvvLabel.Text = "•••";
                ((Button)sender).Text = "👁️ Показать";
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка показа CVV: {ex.Message}");
        }
    }



    // Переключение избранного
    private async void OnToggleFavoriteClicked(object sender, EventArgs e)
    {
        if (_cardDetails == null) return;

        if (isFavorite)
        {
            await FavoriteService.Instance.RemoveFavoriteAsync(_currentUser.Id, _cardDetails.Id);
            isFavorite = false;
            await DisplayAlert("Избранное", "Удалено из избранного", "OK");
        }
        else
        {
            await FavoriteService.Instance.AddFavoriteAsync(_currentUser.Id, _cardDetails.Id);
            isFavorite = true;
            await DisplayAlert("Избранное", "Добавлено в избранное", "OK");
        }
        UpdateFavoriteButton();
    }

    private void UpdateFavoriteButton()
    {
      
    }

    // Удаление карты
    private async void OnDeleteClicked(object sender, EventArgs e)
    {
        try
        {
            bool confirm = await DisplayAlert("Удаление карты",
                $"Вы уверены, что хотите удалить карту '{_cardDetails.CardName}'?\n" +
                "Это действие нельзя отменить.", "Удалить", "Отмена");

            if (!confirm) return;

            // Показываем индикатор загрузки
            var loadingTask = ShowLoading("Удаление карты...");

            bool success = await CardService.Instance.DeleteCardAsync(_cardDetails.Id);

            await loadingTask;

            if (success)
            {
                await DisplayAlert("Успех", "Карта удалена", "OK");

                // Отправляем сообщение об обновлении списка

                // Возвращаемся на предыдущую страницу
                await Navigation.PopAsync();
            }
            else
            {
                await DisplayAlert("Ошибка",
                    "Не удалось удалить карту. Возможно, она уже была удалена.",
                    "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка",
                $"Произошла ошибка при удалении: {ex.Message}",
                "OK");
        }
    }
    private async Task ShowLoading(string message)
    {
        await MainThread.InvokeOnMainThreadAsync(async () =>
        {
            await DisplayAlert("Пожалуйста подождите", message, "OK");
        });
    }

    // Копирование данных карты в буфер обмена
    private async void OnCopyDataClicked(object sender, EventArgs e)
    {
        try
        {
            string cardData = $"💳 {_cardDetails.CardName}\n" +
                             $"🔢 Номер: {FormatCardNumber(_cardDetails.CardNumber)}\n" +
                             $"🔐 CVV: {_cardDetails.CardCW ?? "Не указан"}\n" +
                             $"📅 Срок: {_cardDetails.CardDate}\n" +
                             $"🏪 Магазин: {_cardDetails.Shop?.ShopName ?? "Не указан"}";

            await Clipboard.Default.SetTextAsync(cardData);

            await DisplayAlert("Скопировано",
                "Данные карты скопированы в буфер обмена", "OK");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось скопировать: {ex.Message}", "OK");
        }
    }

    // Просмотр информации о магазине
    private async void OnShopInfoClicked(object sender, EventArgs e)
    {
        if (_cardDetails.Shop != null)
        {
            string shopInfo = $"🏪 {_cardDetails.Shop.ShopName}\n\n";

            if (!string.IsNullOrEmpty(_cardDetails.Shop.ShopDescription))
            {
                shopInfo += $"Описание:\n{_cardDetails.Shop.ShopDescription}\n\n";
            }

            shopInfo += $"Категория: {_cardDetails.Category?.CategoryName ?? "Не указана"}";

            await DisplayAlert("Информация о магазине", shopInfo, "OK");
        }
        else
        {
            await DisplayAlert("Информация", "Магазин не указан для этой карты", "OK");
        }
    }

    // Просмотр изображения в полном размере
    private async void OnImageTapped(object sender, EventArgs e)
    {
        
    }

    // Защита от случайного возврата с показанными данными
    protected override bool OnBackButtonPressed()
    {
        // Скрываем чувствительные данные перед выходом
        if (_isCardNumberVisible)
        {
            _isCardNumberVisible = false;
        }

        if (_isCvvVisible)
        {
            _isCvvVisible = false;
            cvvLabel.Text = "•••";
            // Находим кнопку CVV и обновляем её текст
            // (В реальном приложении нужно сохранить ссылку на кнопку)
        }

        return base.OnBackButtonPressed();
    }

    protected override void OnDisappearing()
    {
        base.OnDisappearing();

        // Гарантируем скрытие чувствительных данных
        _isCardNumberVisible = false;
        _isCvvVisible = false;
    }
}