using System;
using System.Collections.Generic;
using System.Text;

namespace UltimateWalletFinal.Classes
{
    public class CardImage
    {
        public int Id { get; set; }
        public string CardImageUrl { get; set; }
        public int? CardId { get; set; }
        public string CardImageName { get; set; }

        public virtual Card Card { get; set; }
    }
}
