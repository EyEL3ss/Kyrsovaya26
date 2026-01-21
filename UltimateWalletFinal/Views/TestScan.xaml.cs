using UltimateWalletFinal.Classes;

namespace UltimateWalletFinal.Views;

public partial class TestScan : ContentPage
{
    private Users _currentUser;
    public TestScan(Users user)
	{
		InitializeComponent();
	}

    private async void QRCodePerexod(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new ScanQRXashPage(_currentUser));
    }
}