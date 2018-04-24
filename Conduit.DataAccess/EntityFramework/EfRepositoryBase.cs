using Conduit.Common.DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Data.EntityFramework
{
    public class EfRepositoryBase<T> : IRepository<T> where T : class
    {
        public DbSet<T> Table { get; }
        private readonly ConduitContext _dbContext;
        public EfRepositoryBase(ConduitContext dbContext)
        {
            _dbContext = dbContext;
            Table = _dbContext.Set<T>();
        }

        public async Task<int> Delete(T entity)
        {
            Table.Remove(entity);
            return await Save();
        }

        public async Task<int> Delete(List<T> entity)
        {
            Table.RemoveRange(entity);
            return await Save();
        }

        public async Task<T> Get(Expression<Func<T, bool>> expression)
        {
            return await Table.SingleOrDefaultAsync(expression);
        }

        public async Task<List<T>> GetList()
        {
            return await Table.ToListAsync();
        }

        public async Task<List<T>> GetList(Expression<Func<T, bool>> expression)
        {
            return await Table.Where(expression).ToListAsync();
        }

        public IQueryable<T> GetQueryable()
        {
            return Table;
        }

        public IQueryable<T> GetIncludes(params Expression<Func<T, object>>[] includes)
        {

            var query = (IQueryable<T>)Table;
            return includes != null ?
                 includes.Aggregate(query, (current, include) => current.Include(include)) : query; //Aggregate methodu ilgili Queryable a parametreden gelen includeları otomatik basıyo.
        }

        public IQueryable<T> GetQueryable(Expression<Func<T, bool>> where)
        {
            return Table.Where(where);
        }

        public async Task<int> Insert(T entity)
        {
            Table.Add(entity);
            return await Save();
        }

        public async Task<int> Insert(List<T> entity)
        {
            Table.AddRange(entity);
            return await Save();
        }

        public async Task<int> Update(T entity)
        {
            Table.Update(entity);
            return await Save();
        }

        private async Task<int> Save()
        {
            return await _dbContext.SaveChangesAsync();
        }

      
    }
}
