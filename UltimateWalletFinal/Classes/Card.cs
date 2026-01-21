using System;
using System.Collections.Generic;
using System.Text;

namespace UltimateWalletFinal.Classes
{
    public class Card
    {
        public int Id { get; set; }
        public string CardName { get; set; }
        public string CardDescription { get; set; }
        public int? CardShopId { get; set; }
        public int? CardCategoryId { get; set; }
        public int? CardImageUnifId { get; set; }
        public string CardNumber { get; set; }
        public string CardCW { get; set; }
        public DateOnly? CardDate { get; set; }
        public DateTime? LastUse { get; set; }
        public DateTime? CardCreateDate { get; set; }


      // public bool IsFavorite { get; set; }
        public int CardUser { get; set; }
        // Навигационные свойства
        public virtual Shop Shop { get; set; }
        public virtual Category Category { get; set; }
        public virtual CardImage CardImage { get; set; }
        public virtual Users User { get; set; }
        public virtual ICollection<FavoriteCard> FavoriteCards { get; set; }
    }
}
