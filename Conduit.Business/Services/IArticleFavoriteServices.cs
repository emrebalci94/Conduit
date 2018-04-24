using Conduit.Business.Messages;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface IArticleFavoriteServices
    {
        Task<ResultMessage<ArticleFavorite>> AddFavoriteArticle(int userId, int articleId);
      
    }
}
