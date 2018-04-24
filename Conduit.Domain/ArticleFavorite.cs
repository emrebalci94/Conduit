namespace Conduit.Domain
{
    public class ArticleFavorite
    {
        public int ArticleId { get; set; }

        public int UserId { get; set; }


        public Article Article { get; set; }

        public User User { get; set; }
    }
}