using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using UltimateWalletFinal.Classes;
using UltimateWalletFinal.Services.Database;
namespace UltimateWalletFinal.Services.Database
{
    public class DataBaseService : IDisposable
    {
        private DbConnection _context;
        private static DataBaseService _instance;
        private bool _isInitialized = false;
        public static DataBaseService Instance => _instance ??= new DataBaseService();     
        public DataBaseService()
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

        // Получение пользователя по логину (с проверкой пароля)
       
        

        public async Task<List<Shop>> GetAllShopsAsync()
        {
            try
            {
                if (!_isInitialized)
                    await InitializeDatabase();

                return await _context.Shop
                    .OrderBy(s => s.ShopName)
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения магазинов: {ex.Message}");
                return new List<Shop>();
            }
        }

        // Получение всех категорий
        public async Task<List<Category>> GetAllCategoriesAsync()
        {
            try
            {
                if (!_isInitialized)
                    await InitializeDatabase();

                return await _context.Category
                    .OrderBy(c => c.CategoryName)
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения категорий: {ex.Message}");
                return new List<Category>();
            }
        }       
        public void Dispose()
        {
            _context?.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
