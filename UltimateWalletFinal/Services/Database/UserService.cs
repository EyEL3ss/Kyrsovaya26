using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using UltimateWalletFinal.Classes;

namespace UltimateWalletFinal.Services.Database
{
   public class UserService : IDisposable
    {
        private DbConnection _context;
        private static UserService _instance;
        private bool _isInitialized = false;
        public static UserService Instance => _instance ??= new UserService();
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
        public async Task<Users> GetUserByLoginAsync(string login)
        {
            try
            {
                Console.WriteLine($"Поиск пользователя: '{login}'");

                if (_context == null)
                {
                    Console.WriteLine("Контекст БД не инициализирован, инициализирую...");
                    await InitializeDatabase();
                }

                // Проверяем подключение
                var canConnect = await _context.Database.CanConnectAsync();
                Console.WriteLine($"Подключение к БД: {canConnect}");

                // Ищем пользователя
                var user = await _context.Users
                    .FirstOrDefaultAsync(u => u.UserLogin == login);

                if (user == null)
                    Console.WriteLine($"Пользователь '{login}' не найден в БД");
                else
                    Console.WriteLine($"Найден пользователь: ID={user.Id}, Login={user.UserLogin}");

                return user;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка поиска пользователя: {ex.Message}");
                return null;
            }
        }

        // Проверка существования логина
        public async Task<bool> IsLoginExistsAsync(string login)
        {
            return await _context.Users.AnyAsync(u => u.UserLogin == login);
        }

        // Добавление нового пользователя
        public async Task<bool> AddUserAsync(Users user)
        {
            try
            {
                if (await IsLoginExistsAsync(user.UserLogin))
                    return false;

                // Устанавливаем роль по умолчанию (2 = обычный пользователь)
                user.UserRole = user.UserRole == 0 ? 2 : user.UserRole;
                user.IsActive = 1;

                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка добавления пользователя: {ex.Message}");
                return false;
            }
        }
        public async Task<Users> AuthenticateUserAsync(string login, string password)
        {
            try
            {
                Console.WriteLine($"=== АУТЕНТИФИКАЦИЯ ===");
                Console.WriteLine($"Логин: '{login}'");
                Console.WriteLine($"Пароль: '{password}'");

                // Получаем пользователя
                var user = await GetUserByLoginAsync(login);

                if (user == null)
                {
                    Console.WriteLine("❌ Пользователь не найден");
                    return null;
                }
                // Проверяем пароль
                if (user.UserPassword != password)
                {
                    Console.WriteLine("❌ Неверный пароль");
                    return null;
                }

                // Проверяем активен ли пользователь
                if (user.IsActive == 0)
                {
                    Console.WriteLine("❌ Пользователь неактивен");
                    throw new Exception("Пользователь неактивен");
                }

                Console.WriteLine($"✅ Аутентификация успешна!");
                return user;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"🔥 Ошибка аутентификации: {ex.Message}");
                return null;
            }
        }

        // Регистрация пользователя (удобный метод)
        public async Task<Users> RegisterUserAsync(string login, string password, int role = 2)
        {
            try
            {
                // Проверяем, не существует ли уже такой логин
                if (await IsLoginExistsAsync(login))
                    return null;

                var newUser = new Users
                {
                    UserLogin = login,
                    UserPassword = password,
                    UserRole = role,
                    IsActive = 1
                };

                _context.Users.Add(newUser);
                await _context.SaveChangesAsync();

                return newUser;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка регистрации: {ex.Message}");
                return null;
            }
        }

        // Дополнительные методы для работы с пользователями

        // Получение всех пользователей (для админки)
        public async Task<List<Users>> GetAllUsersAsync()
        {
            return await _context.Users
                .Include(u => u.Role)
                .ToListAsync();
        }

        // Активация/деактивация пользователя
        public async Task<bool> ToggleUserActiveAsync(int userId)
        {
            try
            {
                var user = await _context.Users.FindAsync(userId);
                if (user == null)
                    return false;

                user.IsActive = user.IsActive == 1 ? 0 : 1;
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка изменения статуса пользователя: {ex.Message}");
                return false;
            }
        }
            public void Dispose()
        {
            _context?.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}

