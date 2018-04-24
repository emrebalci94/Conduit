using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    public class ArticleListModel
    {
        public List<ArticleViewModel> Articles { get; set; }
        public int TotalCount { get; set; }
    }
}
