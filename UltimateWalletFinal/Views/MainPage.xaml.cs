using Microsoft.Extensions.Logging.Abstractions;
using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;
using UltimateWalletFinal.Views;
using System.Runtime.Versioning;
namespace UltimateWalletFinal
{
    public partial class MainPage : ContentPage
    {
        private Users currentUser;
        int count = 0;

        public MainPage()
        {
            InitializeComponent();
            loginButton.IsEnabled = false;
        }
        private void OnLoginTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateLoginButtonState();
        }

        private void OnPasswordTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateLoginButtonState();
        }

        private void UpdateLoginButtonState()
        {
            bool isLoginNotEmpty = !string.IsNullOrWhiteSpace(loginEntry?.Text);
            bool isPasswordNotEmpty = !string.IsNullOrWhiteSpace(passwordEntry?.Text);
            loginButton.IsEnabled = isLoginNotEmpty && isPasswordNotEmpty;
        }
        private async void OnLoginClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(loginEntry?.Text) ||
                string.IsNullOrWhiteSpace(passwordEntry?.Text))
            {
                await DisplayAlert("Ошибка", "Пожалуйста, заполните все поля", "OK");
                return;
            }
            try
            {
                loginButton.IsEnabled = false;
                loginButton.Text = "Вход...";
                loadingIndicator.IsVisible = true;
                loadingIndicator.IsRunning = true;
                var user = await UserService.Instance.AuthenticateUserAsync(
                    loginEntry.Text.Trim(),
                    passwordEntry.Text.Trim()
                );
                if (user == null)
                {
                    await DisplayAlert("Ошибка",
                        "Неверный логин или пароль",
                        "OK");
                    return;
                }
                await DisplayAlert("Успешно",
                    $"Добро пожаловать!",
                    "OK");
                await Navigation.PushAsync(new ListPage(user));
                passwordEntry.Text = string.Empty;
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ошибка входа", ex.Message, "OK");
            }
            finally
            {
                loginButton.IsEnabled = true;
                loginButton.Text = "Войти";
                loadingIndicator.IsVisible = false;
                loadingIndicator.IsRunning = false;
            }
        }

        // Кнопка регистрации
        private async void OnRegistrationClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new RegistrationPage());
        }

        // Восстановление пароля
        private async void OnForgotPasswordClicked(object sender, EventArgs e)
        {
            await DisplayAlert("Информация",
                "Функция восстановления пароля в разработке",
                "OK");
        }
        // Обработка нажатия Enter в поле пароля
        private void OnPasswordCompleted(object sender, EventArgs e)
        {
            if (loginButton.IsEnabled)
                OnLoginClicked(sender, e);
        }
    }
}
