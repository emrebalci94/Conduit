using Conduit.Common.Entity;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace Conduit.Domain
{
    public class User:BaseEntity
    {
        public User()
        {
            ArticleFavorites = new HashSet<ArticleFavorite>();
            Articles = new HashSet<Article>();
            Comments = new HashSet<Comment>();
            FollowedPeoples = new HashSet<FollowedPeople>();
        }

        public string UserName { get; set; }

        public string Email { get; set; }
        /// <summary>
        /// Username'in kriptolanmış hali.
        /// </summary>
        public string Salt { get; set; }
        /// <summary>
        /// UserDto dan gelen password ile username'in kriptolanmış hali.
        /// </summary>
        public string Hash { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Image { get; set; }

        public string Bio { get; set; }

        public ICollection<ArticleFavorite> ArticleFavorites { get; set; }
        public ICollection<Article> Articles { get; set; }
        public ICollection<Comment> Comments { get; set; }
        public ICollection<FollowedPeople> FollowedPeoples { get; set; }
    }
}