using Conduit.Business.Messages;
using Conduit.Business.ViewModels;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface IArticleServices
    {
        Task<List<Article>> GetList();
        Task<ArticleListModel> GetListModel(ArticleQuery query);
        Task<ResultMessage<ArticleViewModel>> Insert(ArticleViewModel article);
        Task<ResultMessage<ArticleViewModel>> Update(ArticleViewModel article);
        Task<ResultMessage<Article>> Delete(int id);
        Task<Article> Get(Expression<Func<Article, bool>> expression);
        Task<ArticleViewModel> GetViewModel(Expression<Func<Article, bool>> expression);

        IQueryable<Article> GetQueryable(Expression<Func<Article, bool>> expression);

        /// <summary>
        /// İnclude yapmayı sağlayan method.
        /// </summary>
        /// <param name="includes"></param>
        /// <returns></returns>
        IQueryable<Article> GetIncludes(params Expression<Func<Article, object>>[] includes);
    }
}
