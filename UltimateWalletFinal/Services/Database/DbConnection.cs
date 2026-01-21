using Microsoft.EntityFrameworkCore;
using UltimateWalletFinal.Classes;

namespace UltimateWalletFinal.Services.Database
{
    public class DbConnection : DbContext
    {
        public DbSet<Card> Card { get; set; }
        public DbSet<CardImage> CardImage { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<FavoriteCard> FavoriteCard { get; set; }
        public DbSet<Shop> Shop { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<UserRole> UserRole { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySql(
                "Server=141.8.192.186;Database=a1215492_UltimateWallet;UID=a1215492_UltimateWallet;Pwd=2281337992CFA547",
                new MySqlServerVersion(new Version(8, 0, 21))
            );
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Конфигурация связей и индексов

            // Card
            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardName)
                .HasDatabaseName("idx_card_name");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardNumber)
                .HasDatabaseName("idx_card_number");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardShopId)
                .HasDatabaseName("idx_card_shop");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardCategoryId)
                .HasDatabaseName("idx_card_category");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardUser)
                .HasDatabaseName("idx_card_user");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardImageUnifId)
                .HasDatabaseName("idx_card_image");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.LastUse)
                .HasDatabaseName("idx_card_lastuse");

            modelBuilder.Entity<Card>()
                .HasIndex(c => c.CardCreateDate)
                .HasDatabaseName("idx_card_createdate");

            // CardImage
            modelBuilder.Entity<CardImage>()
                .HasIndex(ci => ci.CardImageUrl)
                .HasDatabaseName("idx_cardimage_url");

            modelBuilder.Entity<CardImage>()
                .HasIndex(ci => ci.CardId)
                .HasDatabaseName("idx_cardimage_cardid");

            modelBuilder.Entity<CardImage>()
                .HasIndex(ci => ci.CardImageName)
                .HasDatabaseName("idx_cardimage_name");

            // Category
            modelBuilder.Entity<Category>()
                .HasIndex(c => c.CategoryName)
                .IsUnique()
                .HasDatabaseName("CategoryName");

            modelBuilder.Entity<Category>()
                .HasIndex(c => c.CategoryName)
                .HasDatabaseName("idx_category_name");

            // FavoriteCard
            modelBuilder.Entity<FavoriteCard>()
                .HasIndex(fc => new { fc.UserId, fc.CardId })
                .IsUnique()
                .HasDatabaseName("idx_favorite_unique");

            modelBuilder.Entity<FavoriteCard>()
                .HasIndex(fc => fc.UserId)
                .HasDatabaseName("idx_favorite_user");

            modelBuilder.Entity<FavoriteCard>()
                .HasIndex(fc => fc.CardId)
                .HasDatabaseName("idx_favorite_card");

            modelBuilder.Entity<FavoriteCard>()
                .HasIndex(fc => fc.AddedDate)
                .HasDatabaseName("idx_favorite_date");

            // Shop
            modelBuilder.Entity<Shop>()
                .HasIndex(s => s.ShopName)
                .HasDatabaseName("idx_shop_name");

            modelBuilder.Entity<Shop>()
                .HasIndex(s => s.ShopCategory)
                .HasDatabaseName("idx_shop_category");

            // User
            modelBuilder.Entity<Users>()
                .HasIndex(u => u.UserLogin)
                .IsUnique()
                .HasDatabaseName("UserLogin");

            modelBuilder.Entity<Users>()
                .HasIndex(u => u.UserLogin)
                .HasDatabaseName("idx_user_login");

            modelBuilder.Entity<Users>()
                .HasIndex(u => u.UserRole)
                .HasDatabaseName("idx_user_role");

            // UserRole
            modelBuilder.Entity<UserRole>()
                .HasIndex(ur => ur.UserRoleName)
                .IsUnique()
                .HasDatabaseName("UserRoleName");

            modelBuilder.Entity<UserRole>()
                .HasIndex(ur => ur.UserRoleName)
                .HasDatabaseName("idx_userrole_name");

            // Настройка связей
            modelBuilder.Entity<Card>()
                .HasOne(c => c.Shop)
                .WithMany(s => s.Cards)
                .HasForeignKey(c => c.CardShopId);

            modelBuilder.Entity<Card>()
                .HasOne(c => c.Category)
                .WithMany(c => c.Cards)
                .HasForeignKey(c => c.CardCategoryId);

            modelBuilder.Entity<Card>()
                .HasOne(c => c.User)
                .WithMany(u => u.Cards)
                .HasForeignKey(c => c.CardUser);

            modelBuilder.Entity<Shop>()
                .HasOne(s => s.Category)
                .WithMany(c => c.Shops)
                .HasForeignKey(s => s.ShopCategory);

            modelBuilder.Entity<Users>()
                .HasOne(u => u.Role)
                .WithMany(r => r.Users)
                .HasForeignKey(u => u.UserRole);

            modelBuilder.Entity<FavoriteCard>()
                .HasOne(fc => fc.User)
                .WithMany(u => u.FavoriteCards)
                .HasForeignKey(fc => fc.UserId);

            modelBuilder.Entity<FavoriteCard>()
                .HasOne(fc => fc.Card)
                .WithMany(c => c.FavoriteCards)
                .HasForeignKey(fc => fc.CardId);
        }
    }
}
