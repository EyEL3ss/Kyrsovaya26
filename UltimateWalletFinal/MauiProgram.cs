using Microsoft.Extensions.Logging;
using System.Data.Common;
using UltimateWalletFinal.Services.Database;
using UltimateWalletFinal.ViewModels;
using CommunityToolkit.Maui;
using ZXing.Net.Maui.Controls;
namespace UltimateWalletFinal
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
    .UseMauiApp<App>()
    .UseBarcodeReader() // Добавьте эту строку
    .UseMauiCommunityToolkit() // И эту
    .ConfigureFonts(fonts =>
    {
        fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
        fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
    });

#if DEBUG
            builder.Logging.AddDebug();
#endif

            // Регистрация сервисов
            builder.Services.AddSingleton<DataBaseService>();
            builder.Services.AddSingleton<MainPage>();
            builder.Services.AddSingleton<MainViewModel>();

            return builder.Build();
        }
    }
}
