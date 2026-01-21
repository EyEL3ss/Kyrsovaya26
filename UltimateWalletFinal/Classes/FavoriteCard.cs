namespace UltimateWalletFinal.Classes
{
    public class FavoriteCard
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int CardId { get; set; }
        public DateTime AddedDate { get; set; }

        public virtual Users User { get; set; }
        public virtual Card Card { get; set; }
    }
}
