using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    /// <summary>
    /// UI tarafından List isteği atıldığında gerekli olan parametreler.
    /// </summary>
    public class ArticleQuery
    {
        public ArticleQuery(string tag, int? offset, int? limit,int? userid)
        {
            TagId = tag;
            Limit = limit ?? 10;
            Offset = offset ?? 0;
            UserId = userid ?? -1;
        }
        public ArticleQuery()
        {
            Limit = 10;
            Offset = 0;
        }
        public int Limit { get; set; }
        public int Offset { get; set; }
        public string TagId { get; set; }
        public int  UserId { get; set; }
    }
}
