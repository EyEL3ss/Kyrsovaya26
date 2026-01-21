using System;
using System.Collections.Generic;
using System.Text;

namespace UltimateWalletFinal.Classes
{
    public class Category
    {
        public int Id { get; set; }
        public string CategoryName { get; set; }

        public virtual ICollection<Card> Cards { get; set; }
        public virtual ICollection<Shop> Shops
        {
            get; set;
        }
    }
}
