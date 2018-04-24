using Conduit.Business.Messages;
using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface ICommentSercices
    {
        Task<List<CommentDto>> GetListAsync();
        Task<ResultMessage<CommentDto>> InsertAsync(CommentDto commentDto);
        Task<ResultMessage<CommentDto>> UpdateAsync(CommentDto commentDto);
        Task<ResultMessage<CommentDto>> DeleteAsync(int id);
        Task<Comment> Get(Expression<Func<Comment, bool>> expression);
        IQueryable<Comment> GetIncludes(params Expression<Func<Comment, object>>[] includes);
    }
}
