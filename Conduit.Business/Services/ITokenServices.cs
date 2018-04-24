using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface ITokenServices
    {
        Task<bool> IsValidUsernameAndPasswordAsync(string username,string password);
        Task<User> GetUserAsync (string username);

    }
}
