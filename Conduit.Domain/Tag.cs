using Conduit.Common.Entity;
using System.Collections.Generic;

namespace Conduit.Domain
{
    public class Tag 
    {
        public Tag()
        {
            ArticleTags = new HashSet<ArticleTag>();
        }

        public string TagId { get; set; }

        public ICollection<ArticleTag> ArticleTags { get; set; }
    }
}