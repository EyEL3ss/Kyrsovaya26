using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;

namespace UltimateWalletFinal.Views;

public partial class FavoriteCardsList : ContentPage
{
    private Users _currentUser;
    private List<Card> favorites;
    public FavoriteCardsList(Users user)
	{
		InitializeComponent();
        _currentUser = user;
        Title = "Избранные компании";
        LoadFavorites();
    }
    private async void LoadFavorites()
    {
        favorites = await FavoriteService.Instance.GetFavoriteCardsWithDetailsAsync(_currentUser.Id);
        favoritesCollectionView.ItemsSource = favorites;
        countLabel.Text = $"Избранных организаций: {favorites.Count}";
    }
    private async void OnRemoveFavoriteTapped(object sender, EventArgs e)
    {
        var imageButton = sender as ImageButton;
        if (imageButton?.BindingContext is Card cardfav)
        {
            var result = await DisplayAlert("Удаление",
                $"Удалить {cardfav.CardName} из избранного?",
                "Да", "Нет");

            if (result)
            {
                await FavoriteService.Instance.RemoveFavoriteAsync(_currentUser.Id, cardfav.Id);
                await DisplayAlert("Успешно", "Удалено из избранного", "OK");
                LoadFavorites(); // Обновляем список
            }
        }
    }
    protected override void OnAppearing()
    {
        base.OnAppearing();
        LoadFavorites(); // Обновляем при возвращении на страницу
    }
}