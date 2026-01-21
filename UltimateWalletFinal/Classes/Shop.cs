using System;
using System.Collections.Generic;
using System.Text;

namespace UltimateWalletFinal.Classes
{
    public class Shop
    {
        public int Id { get; set; }
        public string ShopName { get; set; }
        public int? ShopCategory { get; set; }
        public string ShopDescription { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<Card> Cards { get; set; }
    }
}
