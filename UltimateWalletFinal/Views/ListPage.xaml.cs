using System.Collections.ObjectModel;
using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;
using UltimateWalletFinal.ViewModels;
namespace UltimateWalletFinal.Views;

public partial class ListPage : ContentPage
{
    private Users _currentUser;
    private ObservableCollection<Card> _allCards = new ObservableCollection<Card>();
    private ObservableCollection<Card> _displayedCards = new ObservableCollection<Card>();
    private SortOption _currentSort = SortOption.DateAddedDesc;
    private bool _isSortAscending = false;
    private bool _isLoading = false;
    public enum SortOption
    {
        NameAsc,
        NameDesc,
        DateAddedAsc,
        DateAddedDesc,
        ExpiryDateAsc,
        ExpiryDateDesc,
        LastUsedAsc,
        LastUsedDesc,
        ShopNameAsc,
        ShopNameDesc,
        CategoryNameAsc,
        CategoryNameDesc,
        FavoritesFirst
    }

    public ListPage(Users user)
    {
        InitializeComponent();
        _currentUser = user;
        userGreetingLabel.Text = $"{user.UserLogin}!";
        LoadUserCards();
    }

    private async void LoadUserCards()
    {
        if (_isLoading) return;

        _isLoading = true;
        loadingIndicator.IsVisible = true;
        loadingIndicator.IsRunning = true;

        try
        {
            _allCards.Clear();
            _displayedCards.Clear();
            var userCards = await CardService.Instance.GetUserCardsWithDetailsAsync(_currentUser.Id);
            Console.WriteLine($"Получено карт: {userCards.Count}");

            foreach (var card in userCards)
            {
                _allCards.Add(card);
                _displayedCards.Add(card);
            }
            cardsCollectionView.ItemsSource = _displayedCards;
            UpdateCardsCount();
            emptyStateFrame.IsVisible = !_allCards.Any();
            cardsCollectionView.IsVisible = _allCards.Any();
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", "Не удалось загрузить карты", "OK");
        }
        finally
        {
            _isLoading = false;
            loadingIndicator.IsVisible = false;
            loadingIndicator.IsRunning = false;
            refreshView.IsRefreshing = false;
        }
    }
    private void OnSortClicked(object sender, EventArgs e)
    {
        // Просто чередуем две сортировки
        if (_currentSort == SortOption.NameAsc)
        {
            // Сортируем по дате
            var sorted = _allCards
                .OrderByDescending(c => c.CardCreateDate ?? DateTime.MinValue)
                .ToList();

            _displayedCards.Clear();
            foreach (var card in sorted)
                _displayedCards.Add(card);

            _currentSort = SortOption.DateAddedDesc;
            ((Button)sender).Text = "📅 По дате";
        }
        else
        {
            // Сортируем по имени
            var sorted = _allCards
                .OrderBy(c => c.CardName)
                .ToList();

            _displayedCards.Clear();
            foreach (var card in sorted)
                _displayedCards.Add(card);

            _currentSort = SortOption.NameAsc;
            ((Button)sender).Text = "🔤 По имени";
        }
    }
    private async void OnDetailsClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Card card)
        {
            await OpenCardDetails(card);
        }
    }
    private async Task OpenCardDetails(Card card)
    {
        try
        {
            // Получаем полные данные карты
            var fullCardDetails = await CardService.Instance.GetCardWithDetailsAsync(
                card.Id, _currentUser.Id);

            if (fullCardDetails != null)
            {
                await Navigation.PushAsync(new CardDetail(fullCardDetails, _currentUser));
            }
            else
            {
                // Если не удалось получить полные данные, используем имеющиеся
                await Navigation.PushAsync(new CardDetail(card, _currentUser));
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Не удалось открыть детали: {ex.Message}", "OK");
        }
    }
    private void UpdateCardsCount()
    {
        int total = _allCards.Count;

        cardsCountLabel.Text = $"Карт: {total}";
    }

    private async void OnRefreshing(object sender, EventArgs e)
    {
        await Task.Delay(500); 
        LoadUserCards();
    }

    // Поиск карт
    private void OnSearchTextChanged(object sender, TextChangedEventArgs e)
    {
        FilterCards(e.NewTextValue);
    }

    private void FilterCards(string searchText)
    {
        _displayedCards.Clear();

        if (string.IsNullOrWhiteSpace(searchText))
        {
            // Показываем все карты
            foreach (var card in _allCards)
            {
                _displayedCards.Add(card);
            }
        }
        else
        {
            var filtered = _allCards.Where(c =>
                c.CardName.Contains(searchText, StringComparison.OrdinalIgnoreCase) ||
                (c.Shop?.ShopName?.Contains(searchText, StringComparison.OrdinalIgnoreCase) ?? false) ||
                (c.Category?.CategoryName?.Contains(searchText, StringComparison.OrdinalIgnoreCase) ?? false) ||
                (c.CardNumber?.Contains(searchText, StringComparison.OrdinalIgnoreCase) ?? false)
            ).ToList();

            foreach (var card in filtered)
            {
                _displayedCards.Add(card);
            }
        }
    }
    private async void OnDeleteCardClicked(object sender, EventArgs e)
    {
        try
        {
            if (sender is Button button && button.BindingContext is Card card)
            {
                // Подтверждение удаления
                bool confirm = await DisplayAlert(
                    "Удаление карты",
                    $"Удалить карту '{card.CardName}'?\n" +
                    "Номер: " + card.CardNumber + "\n" +
                    "Это действие нельзя отменить.",
                    "Удалить",
                    "Отмена"
                );

                if (!confirm) return;

                // Показываем индикатор загрузки
                var originalText = button.Text;
                button.Text = "⌛";
                button.IsEnabled = false;

                // Удаляем карту
                bool success = await CardService.Instance.DeleteCardAsync(card.Id);

                if (success)
                {
                    // Удаляем из коллекций
                    _allCards.Remove(card);
                    _displayedCards.Remove(card);

                    // Обновляем счетчик
                    UpdateCardsCount();

                    // Показываем сообщение
                    await DisplayAlert("Успех", "Карта удалена", "OK");

                    // Если карт не осталось, показываем пустое состояние
                }
                else
                {
                    await DisplayAlert("Ошибка", "Не удалось удалить карту", "OK");
                }

                // Восстанавливаем кнопку
                button.Text = originalText;
                button.IsEnabled = true;
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Ошибка при удалении: {ex.Message}", "OK");
        }
    }

    // Кнопка "Все карты"
    private void OnAllCardsClicked(object sender, EventArgs e)
    {
        FilterCards("");
        searchBar.Text = "";
    }

    // Кнопка "Избранные"
    private async void OnFavoritesClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new FavoriteCardsList(_currentUser));
    }
    // Нажатие на карточку
    private async void OnCardTapped(object sender, EventArgs e)
    {
        if (sender is Frame frame && frame.BindingContext is Card card)
        {
            //await Navigation.PushAsync(new CardDetail(card, _currentUser));
        }
    }
    

    // Кнопка "Показать код"
    private async void OnShowCodeClicked(object sender, EventArgs e)
    {

    }

    // Кнопка "Добавить карту"
    private async void OnAddCardClicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new AddCardPage(_currentUser));
    }

    // При возвращении на страницу обновляем данные
    protected override async void OnAppearing()
    {
        base.OnAppearing();

        // Обновляем данные если нужно
        if (_allCards.Count == 0)
        {
            LoadUserCards();
        }
    }

    private async void testpagenavi(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new TestScan(_currentUser));
    }
}