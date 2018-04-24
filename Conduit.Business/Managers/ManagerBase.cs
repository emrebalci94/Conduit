using Conduit.Common.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers
{
    public abstract class ManagerBase<TEntity> where TEntity : class
    {
        private readonly IRepository<TEntity> _repository;
        public ManagerBase(IRepository<TEntity> repository)
        {
            _repository = repository;
        }

        public async Task<List<TEntity>> GetList()
        {
            return await _repository.GetList();
        }

        public async Task<TEntity> Get(Expression<Func<TEntity, bool>> expression)
        {
            return await _repository.Get(expression);
        }

        public async Task<int> Insert(TEntity entity)
        {
            return await _repository.Insert(entity);
        }

        public async Task<int> InsertAll(List<TEntity> entity)
        {
            return await _repository.Insert(entity);
        }

        public async Task<int> Update(TEntity entity)
        {
            return await _repository.Update(entity);
        }

        public async Task<int> Delete(TEntity entity)
        {
            return await _repository.Delete(entity);
        }

        public IQueryable<TEntity> GetQueryable(Expression<Func<TEntity, bool>> expression)
        {
            return _repository.GetQueryable(expression);
        }

        public IQueryable<TEntity> GetIncludes(params Expression<Func<TEntity, object>>[] includes)
        {
            return _repository.GetIncludes(includes);
        }
    }
}
