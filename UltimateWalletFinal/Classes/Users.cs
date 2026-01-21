using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace UltimateWalletFinal.Classes
{
   //  [Table("Users")] // Явно укажите имя таблицы
    public class Users
    {
    //    [Key]
    //    [Column("Id")] // Явно укажите имя столбца
        public int Id { get; set; }

     //   [Column("Userlogin")]
        public string UserLogin { get; set; }
        public string UserPassword { get; set; }
        public int UserRole { get; set; }

        public int IsActive { get; set; } = 1;

        public virtual UserRole Role { get; set; }
        public virtual ICollection<Card> Cards { get; set; }
        public virtual ICollection<FavoriteCard> FavoriteCards { get; set; }
    }
}
