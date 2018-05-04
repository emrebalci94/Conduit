using Conduit.Business.Messages;
using Conduit.Business.ViewModels;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Services
{
    public interface IFollowedUserServices
    {
        /// <summary>
        /// Üye takip edilmemişse edilir, edilmiş ise takipi kaldırır.
        /// </summary>
        /// <param name="flowId"> Takip edilecek üyenin id'si.</param>
        /// <param name="userId"> Takip edecek üyenin id'si.</param>
        /// <returns></returns>
        Task<ResultMessage<FollowedPeople>> FollowUserAsync(int flowId, int userId);
        Task<bool> UserIsFollowAsync(int flowId, int userId);
        Task<FollowedUserListModel> GetListModel(int userid, int? limit, int? offset );

    }
}
