namespace UltimateWalletFinal.Classes
{
    public class UserRole
    {
        public int Id { get; set; }
        public string UserRoleName { get; set; }

        public virtual ICollection<Users> Users { get; set; }
    }
}
