using Conduit.Business.Messages;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface IArticleTagsServices
    {
        Task<List<ArticleTag>> GetList();
        Task<ResultMessage<ArticleTag>> Insert(ArticleTag articleTag);
        Task<int> Update(ArticleTag articleTag);
        Task<int> Delete(ArticleTag articleTag);
        Task<int> DeleteAll(List<ArticleTag> articleTags);

        Task<int> InsertAll(List<ArticleTag> articleTag);

        Task<ArticleTag> Get(Expression<Func<ArticleTag, bool>> expression);
        IQueryable<ArticleTag> GetIncludes(params Expression<Func<ArticleTag, object>>[] includes);
        IQueryable<ArticleTag> GetQueryable(Expression<Func<ArticleTag, bool>> expression);

    }
}
