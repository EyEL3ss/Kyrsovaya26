using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace UltimateWalletFinal.Converters
{
    public class FavoriteConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is bool isFavorite)
            {
                return isFavorite ? "star_filled.png" : "star_outline.png";
            }
            return "star_outline.png";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
