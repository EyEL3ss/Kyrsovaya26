using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using UltimateWalletFinal.Classes;

namespace UltimateWalletFinal.Services.Database
{
    public class FavoriteService
    {
        private DbConnection _context;
        private static FavoriteService _instance;
        private bool _isInitialized = false;
        public static FavoriteService Instance => _instance ??= new FavoriteService();
        public FavoriteService()
        {
            // Конструктор приватный для синглтона
        }
        public async Task InitializeDatabase()
        {
            try
            {
                _context = new DbConnection();
                var canConnect = await _context.Database.CanConnectAsync();

                if (!canConnect)
                {
                    throw new Exception("Не удалось подключиться к базе данных");
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public async Task<bool> IsFavoriteAsync(int userId, int cardId)
        {
            try
            {
                return await _context.FavoriteCard.AnyAsync(f => f.UserId == userId && f.CardId == cardId);
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Получение избранных карт пользователя
        public async Task<List<Card>> GetFavoriteCardsWithDetailsAsync(int userId)
        {
            try
            {
                if (!_isInitialized)
                    await InitializeDatabase();

                var favoriteCards = await _context.FavoriteCard
                    .Where(f => f.UserId == userId)
                    .Include(f => f.Card)
                        .ThenInclude(c => c.Category)
                    .Include(f => f.Card)
                        .ThenInclude(c => c.Shop)
                    .Include(f => f.Card)
                        .ThenInclude(c => c.CardImage)
                    .Include(f => f.Card)
                        .ThenInclude(c => c.User)
                    .ToListAsync();

                var result = new List<Card>();

                foreach (var favorite in favoriteCards)
                {
                    var cardWithDetails = new Card
                    {
                        Id = favorite.Card.Id,
                        CardName = favorite.Card.CardName,
                        CardDescription = favorite.Card.CardDescription,
                        CardNumber = favorite.Card.CardNumber,
                        CardCW = favorite.Card.CardCW,
                        Category = favorite.Card.Category,
                        Shop = favorite.Card.Shop,
                        CardImage = favorite.Card.CardImage,
                        User = favorite.Card.User,
                    };

                    result.Add(cardWithDetails);
                }
                return result;
            }
            catch (Exception ex)
            {
                return new List<Card>();
            }
        }

        public async Task<int> RemoveFavoriteAsync(int userId, int organisationId)
        {
            return await _context.FavoriteCard
                .Where(f => f.UserId == userId && f.CardId == organisationId)
                .ExecuteDeleteAsync();
        }
        public async Task<bool> AddFavoriteAsync(int userId, int cardId)
        {
            try
            {

                if (!_isInitialized)
                    await InitializeDatabase();

                var existing = await _context.FavoriteCard
                    .FirstOrDefaultAsync(f => f.UserId == userId && f.CardId == cardId);

                if (existing == null)
                {
                    // Добавляем в избранное
                    var favorite = new FavoriteCard
                    {
                        UserId = userId,
                        CardId = cardId,
                        AddedDate = DateTime.Now
                    };

                    _context.FavoriteCard.Add(favorite);
                }
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
