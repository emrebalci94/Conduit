using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Common.DataAccess
{
    public interface IRepository<T> where T:class
    {
        Task<int> Insert(T entity);
        Task<int> Insert(List<T> entity);
        Task<int> Update(T entity);
        Task<int> Delete(T entity);
        Task<int> Delete(List<T> entity);

        Task<List<T>> GetList();
        Task<List<T>> GetList(Expression<Func<T, bool>> expression);

        Task<T> Get(Expression<Func<T, bool>> expression);


        IQueryable<T> GetQueryable();
        /// <summary>
        /// Queryable getirirken ayrıca gelmesini istediğiniz (birbiriyle ilişkili) tabloyu getirir.
        /// </summary>
        /// <param name="includes"></param>
        /// <returns></returns>
        IQueryable<T> GetIncludes(params Expression<Func<T, object>>[] includes);
        IQueryable<T> GetQueryable(Expression<Func<T, bool>> where);
    }
}
