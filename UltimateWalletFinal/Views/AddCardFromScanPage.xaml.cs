using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;

namespace UltimateWalletFinal.Views;

public partial class AddCardFromScanPage : ContentPage
{
    private ScanResult _scanResult;
    private Users _currentUser;
    private Shop _selectedShop;
    private Category _selectedCategory;
    public AddCardFromScanPage(ScanResult scanResult, Users user)
    {
        InitializeComponent();
        _scanResult = scanResult;
        _currentUser = user;
        userGreetingLabel.Text = $"{user.UserLogin}!";
        BindingContext = this;
        InitializeForm();
    }

    public string SuggestedCardName =>
        !string.IsNullOrEmpty(_scanResult.ShopName)
            ? $"Карта {_scanResult.ShopName}"
            : "Карта лояльности";

    private async void InitializeForm()
    {
        try
        {
            // Загружаем магазины и категории
            var shops = await DataBaseService.Instance.GetAllShopsAsync();
            shopPicker.ItemsSource = shops;

            var categories = await DataBaseService.Instance.GetAllCategoriesAsync();
            categoryPicker.ItemsSource = categories;

            // Предвыбираем магазин если определили
            if (!string.IsNullOrEmpty(_scanResult.ShopName))
            {
                foreach (var shop in shops)
                {
                    if (shop.ShopName.Contains(_scanResult.ShopName))
                    {
                        shopPicker.SelectedItem = shop;
                        break;
                    }
                }
            }

            // Показываем дополнительные данные если есть
            if (_scanResult.AdditionalData.Any())
            {
                extraDataFrame.IsVisible = true;
                extraDataLabel.Text = string.Join("\n",
                    _scanResult.AdditionalData.Select(kv => $"{kv.Key}: {kv.Value}"));
            }

            // Автозаполняем название
            cardNameEntry.Text = SuggestedCardName;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка инициализации: {ex.Message}");
        }
    }
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
    private void UpdateSaveButtonState()
    {
        bool isValid =
            !string.IsNullOrWhiteSpace(cardNameEntry.Text) &&
            !string.IsNullOrWhiteSpace(cardNumberEntry.Text) &&
            cardNumberEntry.Text.Replace(" ", "").Length >= 12; // Минимум 12 цифр
    }
    private void OnEditNumberClicked(object sender, EventArgs e)
    {
        cardNumberEntry.IsReadOnly = !cardNumberEntry.IsReadOnly;
        cardNumberEntry.BackgroundColor = cardNumberEntry.IsReadOnly
            ? Color.FromArgb("#EEEEEE")
            : Colors.White;

        ((Button)sender).Text = cardNumberEntry.IsReadOnly
            ? "✏️ Редактировать номер"
            : "🔒 Заблокировать";
    }

    private async void OnSaveClicked(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(cardNameEntry.Text) ||
            string.IsNullOrWhiteSpace(cardNumberEntry.Text))
        {
            await DisplayAlert("Ошибка", "Заполните обязательные поля", "OK");
            return;
        }

        try
        {
            var newCard = new Card
            {
                CardName = cardNameEntry.Text.Trim(),
                CardNumber = cardNumberEntry.Text.Replace(" ", ""), // Убираем пробелы
                CardCW = cardCvEntry.Text?.Trim(),
                CardDescription = "Добавлено сканированием",
                CardUser = _currentUser.Id, // ID текущего пользователя
                CardCreateDate = DateTime.Now,
                CardImageUnifId = 1,
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
    }
    private async void OnTakePhotoClicked(object sender, EventArgs e)
    {
        try
        {
            var photo = await MediaPicker.CapturePhotoAsync();

            if (photo != null)
            {
                // Сохраняем фото и добавляем к карте
                var newFilePath = Path.Combine(FileSystem.CacheDirectory, photo.FileName);
                using var stream = await photo.OpenReadAsync();
                using var newStream = File.OpenWrite(newFilePath);
                await stream.CopyToAsync(newStream);

                // Можно добавить обработку фото для извлечения текста (OCR)
                await DisplayAlert("Фото сохранено",
                    $"Фото карты сохранено: {photo.FileName}", "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось сделать фото: {ex.Message}", "OK");
        }
    }
}