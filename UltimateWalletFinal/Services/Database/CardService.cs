using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using UltimateWalletFinal.Classes;

namespace UltimateWalletFinal.Services.Database
{
    public class CardService : IDisposable
    {
        private DbConnection _context;
        private static CardService _instance;
        private bool _isInitialized = false;
        public static CardService Instance => _instance ??= new CardService();
        public CardService()
        {
            // Конструктор приватный для синглтона
        }

        // Инициализация базы данных
        public async Task InitializeDatabase()
        {
            try
            {
                _context = new DbConnection();

                // Проверка подключения
                var canConnect = await _context.Database.CanConnectAsync();

                if (!canConnect)
                {
                    throw new Exception("Не удалось подключиться к базе данных");
                }

                // Создание таблиц, если их нет (для SQLite)
                await _context.Database.EnsureCreatedAsync();

                Console.WriteLine("База данных инициализирована успешно");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка инициализации базы данных: {ex.Message}");
                throw;
            }
        }
        public async Task<bool> AddCardSimpleAsync(Card card)
        {
            try
            {
                if (await IsCardNumberExistsAsync(card.CardNumber))
                    return false;
                card.CardCreateDate = DateTime.Now;

                _context.Card.Add(card);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка добавления карты: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> AddCardAsync(Card card, CardImage cardImage = null)
        {
            try
            {
                Console.WriteLine($"Добавление карты: {card.CardName}");

                if (!_isInitialized)
                    await InitializeDatabase();

                using var transaction = await _context.Database.BeginTransactionAsync();

                try
                {
                    // 1. Сначала добавляем изображение если есть
                    if (cardImage != null)
                    {
                        Console.WriteLine($"Добавление изображения: {cardImage.CardImageUrl}");
                        _context.CardImage.Add(cardImage);
                        await _context.SaveChangesAsync();

                        // Устанавливаем связь
                        card.CardImageUnifId = cardImage.Id;
                        Console.WriteLine($"Изображение добавлено с ID: {cardImage.Id}");
                    }

                    // 2. Добавляем карту
                    Console.WriteLine($"Добавление карты в БД...");
                    _context.Card.Add(card);
                    int rowsAffected = await _context.SaveChangesAsync();

                    // 3. Если было изображение, обновляем ссылку на карту
                    if (cardImage != null && card.Id > 0)
                    {
                        cardImage.CardId = card.Id;
                        await _context.SaveChangesAsync();
                        Console.WriteLine($"Обновлена ссылка на карту для изображения: CardId={card.Id}");
                    }

                    await transaction.CommitAsync();

                    Console.WriteLine($"✅ Карта добавлена успешно! ID: {card.Id}, Затронуто строк: {rowsAffected}");
                    return rowsAffected > 0;
                }
                catch (Exception ex)
                {
                    await transaction.RollbackAsync();
                    Console.WriteLine($"❌ Ошибка при добавлении карты: {ex.Message}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Общая ошибка при добавлении карты: {ex.Message}");
                return false;
            }
        }


        public async Task<List<Card>> GetUserCardsWithDetailsAsync(int userId)
        {
            try
            {
                if (!_isInitialized)
                    await InitializeDatabase();

                // Получаем карты пользователя с включением связанных данных
                var cards = await _context.Card
                    .Where(c => c.CardUser == userId)
                    .Include(c => c.Category)      // Категория
                    .Include(c => c.Shop)          // Магазин
                    .Include(c => c.CardImage)     // Изображение
                    .Include(c => c.User)          // Владелец (пользователь)
                    .ToListAsync();

                Console.WriteLine($"Найдено карт: {cards.Count}");

                // Преобразуем в CardWithDetails
                var result = new List<Card>();

                foreach (var card in cards)
                {
                    var cardWithDetails = new Card
                    {
                        Id = card.Id,
                        CardName = card.CardName,
                        CardDescription = card.CardDescription,
                        CardNumber = card.CardNumber,
                        CardCW = card.CardCW,
                        Category = card.Category,
                        Shop = card.Shop,
                        CardImage = card.CardImage,
                        User = card.User,
                    };

                    result.Add(cardWithDetails);
                }

                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения карт пользователя: {ex.Message}");
                return new List<Card>();
            }
        }

        // Получение всех карт (для всех пользователей)
        public async Task<List<Card>> GetAllCardsWithDetailsAsync()
        {
            try
            {
                Console.WriteLine("Получение всех карт с деталями");

                if (!_isInitialized)
                    await InitializeDatabase();

                var cards = await _context.Card
                    .Include(c => c.Category)
                    .Include(c => c.Shop)
                    .Include(c => c.CardImage)
                    .Include(c => c.User)
                    .ToListAsync();

                var result = new List<Card>();

                foreach (var card in cards)
                {
                    var cardWithDetails = new Card
                    {
                        Id = card.Id,
                        CardName = card.CardName,
                        CardDescription = card.CardDescription,
                        CardNumber = card.CardNumber,
                        CardCW = card.CardCW,
                        Category = card.Category,
                        Shop = card.Shop,
                        CardImage = card.CardImage,
                        User = card.User,
                    };

                    result.Add(cardWithDetails);
                }

                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения всех карт: {ex.Message}");
                return new List<Card>();
            }
        }

        // Получение карты по ID с деталями
        public async Task<Card> GetCardWithDetailsAsync(int cardId, int? userId = null)
        {
            try
            {
                Console.WriteLine($"Получение карты ID={cardId}");

                if (!_isInitialized)
                    await InitializeDatabase();

                var card = await _context.Card
                    .Include(c => c.Category)
                    .Include(c => c.Shop)
                    .Include(c => c.CardImage)
                    .Include(c => c.User)
                    .FirstOrDefaultAsync(c => c.Id == cardId);

                if (card == null)
                {
                    Console.WriteLine($"Карта ID={cardId} не найдена");
                    return null;
                }

                var cardWithDetails = new Card
                {
                    Id = card.Id,
                    CardName = card.CardName,
                    CardDescription = card.CardDescription,
                    CardNumber = card.CardNumber,
                    CardCW = card.CardCW,
                    Category = card.Category,
                    Shop = card.Shop,
                    CardImage = card.CardImage,
                    User = card.User,
                };

                return cardWithDetails;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения карты: {ex.Message}");
                return null;
            }
        }

        // Проверка, добавлена ли карта в избранное
        
        public async Task<bool> UpdateCardAsync(Card card)
        {
            try
            {
                Console.WriteLine($"Обновление карты ID={card.Id}");

                if (!_isInitialized)
                    await InitializeDatabase();

                _context.Card.Update(card);
                int result = await _context.SaveChangesAsync();

                Console.WriteLine($"Карта обновлена. Затронуто строк: {result}");
                return result > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка обновления карты: {ex.Message}");
                return false;
            }
        }

        // Удаление карты
        public async Task<bool> DeleteCardAsync(int cardId)
        {
            try
            {
                Console.WriteLine($"Попытка удалить карту ID={cardId}");

                // Простой способ - без транзакций
                var card = await _context.Card.FindAsync(cardId);

                if (card == null)
                {
                    Console.WriteLine("Карта не найдена");
                    return false;
                }

                Console.WriteLine($"Найдена карта: {card.CardName}");

                // Удаляем из FavoriteCards
                var favorites = _context.FavoriteCard.Where(f => f.CardId == cardId);
                _context.FavoriteCard.RemoveRange(favorites);

                // Удаляем саму карту
                _context.Card.Remove(card);

                // Сохраняем
                int result = await _context.SaveChangesAsync();

                Console.WriteLine($"Удалено. Результат: {result > 0}");
                return result > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ОШИБКА УДАЛЕНИЯ: {ex.Message}");
                Console.WriteLine($"Stack: {ex.StackTrace}");
                return false;
            }
        }
        // Метод для проверки существования карты с таким номером
        private async Task<bool> IsCardNumberExistsAsync(string cardNumber)
        {
            return await _context.Card.AnyAsync(c => c.CardNumber == cardNumber);
        }
        public void Dispose()
        {
            _context?.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
