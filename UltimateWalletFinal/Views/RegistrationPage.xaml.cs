using Microsoft.Extensions.Logging.Abstractions;
using System.Text.RegularExpressions;
using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;

namespace UltimateWalletFinal.Views;

public partial class RegistrationPage : ContentPage
{
    public RegistrationPage()
    {
        InitializeComponent();

        // Инициализация
        InitializeForm();
    }

    private void InitializeForm()
    {
        // Устанавливаем начальные состояния
        registerButton.IsEnabled = false;
    }

    // Валидация в реальном времени

    private void OnLoginTextChanged(object sender, TextChangedEventArgs e)
    {
        var login = loginEntry.Text?.Trim() ?? "";

        if (string.IsNullOrWhiteSpace(login))
        {
            ShowError(loginErrorLabel, "Логин не может быть пустым");
            return;
        }

        if (login.Length < 3)
        {
            ShowError(loginErrorLabel, "Логин должен быть не менее 3 символов");
            return;
        }

        if (login.Length > 50)
        {
            ShowError(loginErrorLabel, "Логин не должен превышать 50 символов");
            return;
        }

        // Проверка на допустимые символы
        if (!Regex.IsMatch(login, @"^[a-zA-Z0-9_]+$"))
        {
            ShowError(loginErrorLabel, "Логин может содержать только буквы, цифры и подчеркивание");
            return;
        }

        HideError(loginErrorLabel);
        UpdateRegisterButtonState();
    }

    private void OnPasswordTextChanged(object sender, TextChangedEventArgs e)
    {
        var password = passwordEntry.Text ?? "";

        if (string.IsNullOrWhiteSpace(password))
        {
            ShowError(passwordErrorLabel, "Пароль не может быть пустым");
            return;
        }

        if (password.Length < 6)
        {
            ShowError(passwordErrorLabel, "Пароль должен быть не менее 6 символов");
            return;
        }

        HideError(passwordErrorLabel);
        ValidateConfirmPassword();
        UpdateRegisterButtonState();
    }

    private void OnConfirmPasswordTextChanged(object sender, TextChangedEventArgs e)
    {
        ValidateConfirmPassword();
        UpdateRegisterButtonState();
    }

    private void ValidateConfirmPassword()
    {
        var password = passwordEntry.Text ?? "";
        var confirmPassword = confirmPasswordEntry.Text ?? "";

        if (string.IsNullOrWhiteSpace(confirmPassword))
        {
            ShowError(confirmPasswordErrorLabel, "Подтвердите пароль");
            return;
        }

        if (password != confirmPassword)
        {
            ShowError(confirmPasswordErrorLabel, "Пароли не совпадают");
            return;
        }

        HideError(confirmPasswordErrorLabel);
    }

    private async void OnRegisterClicked(object sender, EventArgs e)
    {
        if (!ValidateForm())
            return;

        try
        {
            registerButton.IsEnabled = false;
            loadingIndicator.IsVisible = true;
            loadingIndicator.IsRunning = true;

            // Проверяем, существует ли уже такой логин
            var existingUser = await UserService.Instance.GetUserByLoginAsync(loginEntry.Text.Trim());
            if (existingUser != null)
            {
                await DisplayAlert("Ошибка", "Пользователь с таким логином уже существует", "OK");
                ShowError(loginErrorLabel, "Этот логин уже занят");
                return;
            }

            var newUser = new Users
            {
                UserLogin = loginEntry.Text.Trim(),
                UserPassword = passwordEntry.Text, 
                UserRole = 2, 
                IsActive = 1  
            };

            // Добавляем пользователя в базу
            var success = await UserService.Instance.AddUserAsync(newUser);

            if (success)
            {
                await DisplayAlert("Успешно",
                    "Регистрация завершена! Теперь вы можете войти в систему.",
                    "OK");

                // Возвращаемся на страницу входа
                await Navigation.PopAsync();
            }
            else
            {
                await DisplayAlert("Ошибка",
                    "Не удалось зарегистрировать пользователя. Попробуйте позже.",
                    "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка",
                $"Произошла ошибка при регистрации: {ex.Message}",
                "OK");
        }
        finally
        {
            // Восстанавливаем кнопку
            registerButton.IsEnabled = true;
            loadingIndicator.IsVisible = false;
            loadingIndicator.IsRunning = false;
        }
    }

    // Вспомогательные методы

    private bool ValidateForm()
    {
        var errors = "";

        if (string.IsNullOrWhiteSpace(loginEntry.Text))
            errors += "• Введите логин\n";

        if (string.IsNullOrWhiteSpace(passwordEntry.Text))
            errors += "• Введите пароль\n";
        else if (passwordEntry.Text.Length < 6)
            errors += "• Пароль должен быть не менее 6 символов\n";

        if (string.IsNullOrWhiteSpace(confirmPasswordEntry.Text))
            errors += "• Подтвердите пароль\n";
        else if (passwordEntry.Text != confirmPasswordEntry.Text)
            errors += "• Пароли не совпадают\n";

        if (!string.IsNullOrEmpty(errors))
        {
            DisplayAlert("Ошибка валидации", errors.Trim(), "OK");
            return false;
        }

        return true;
    }

    private void UpdateRegisterButtonState()
    {
        var loginValid = !string.IsNullOrWhiteSpace(loginEntry.Text) &&
                       loginEntry.Text.Length >= 3 &&
                       string.IsNullOrEmpty(loginErrorLabel.Text);

        var passwordValid = !string.IsNullOrWhiteSpace(passwordEntry.Text) &&
                          passwordEntry.Text.Length >= 6 &&
                          string.IsNullOrEmpty(passwordErrorLabel.Text);

        var confirmValid = !string.IsNullOrWhiteSpace(confirmPasswordEntry.Text) &&
                         passwordEntry.Text == confirmPasswordEntry.Text &&
                         string.IsNullOrEmpty(confirmPasswordErrorLabel.Text);

        registerButton.IsEnabled = loginValid && passwordValid && confirmValid;
    }

    private void ShowError(Label errorLabel, string message)
    {
        errorLabel.Text = message;
        errorLabel.IsVisible = true;
    }

    private void HideError(Label errorLabel)
    {
        errorLabel.Text = "";
        errorLabel.IsVisible = false;
    }

    // Возврат на страницу входа
    private async void OnBackToLoginClicked(object sender, EventArgs e)
    {
        await Navigation.PopAsync();
    }

    // Обработка нажатия Enter
    private void OnConfirmPasswordCompleted(object sender, EventArgs e)
    {
        if (registerButton.IsEnabled)
            OnRegisterClicked(sender, e);
    }
}