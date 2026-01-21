using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace UltimateWalletFinal.Converters
{
    public class FavoriteColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool isFavorite)
            {
                return isFavorite ? Colors.Gold : Colors.LightGray;
            }
            return Colors.LightGray;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
