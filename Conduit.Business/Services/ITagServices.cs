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
    public interface ITagServices
    {
        Task<Tag> Get(Expression<Func<Tag,bool>> expression);
        Task<List<TagViewModel>> GetList();
        Task<ResultMessage<Tag>> InsertAsync(Tag tag);
        Task<ResultMessage<Tag>> DeleteAsync(Tag tag);
        //Task<ResultMessage<Tag>> InsertAllAsync(List<Tag> tags);
        IQueryable<Tag> GetIncludes(params Expression<Func<Tag, object>>[] includes);
        IQueryable<Tag> GetQueryable(Expression<Func<Tag, bool>> expression);

    }
}
