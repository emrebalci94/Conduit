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
    public interface IUserServices
    {
        Task<List<User>> GetList();
        /// <summary>
        /// Verilen User bilgisini veri tabanından bakar yoksa yazar.
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        Task<ResultMessage<User>> InsertAsync(UserDto user);
        Task<ResultMessage<UserDto>> UpdateAsync(UserDto user);
        Task<ResultMessage<User>> DeleteAsync(int id);
        Task<ResultMessage<UserDto>> GetUserAsync(int id);

        Task<User> Get(Expression<Func<User, bool>> expression);
        IQueryable<User> GetIncludes(params Expression<Func<User, object>>[] includes);


    }
}
