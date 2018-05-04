using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    /// <summary>
    /// UI tarafından alınan parametrelere göre filtreleme yapmayı sağlayan model.
    /// </summary>
    public class CommentQuery
    {
        public CommentQuery()
        {
            Limit = 10;
            Offset = 0;
        }
        public CommentQuery(string slug, int? limit, int? offset)
        {
            Slug = slug;
            Limit = limit ?? 10;
            Offset = offset ?? 0;
        }
        public string Slug { get; set; } // TODO: Article linki. ID ide alabilirdik ama böyle daha user interface.
        public int Limit { get; set; }
        public int Offset { get; set; }
        //public int UserId { get; set; }
    }
}
