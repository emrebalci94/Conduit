using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Common.DataAccess;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfFollowedUserManager : ManagerBase<FollowedPeople>, IFollowedUserServices
    {
       private IRepository<FollowedPeople> _repository { get; }
       private IUserServices _userServices { get; }

        public EfFollowedUserManager(IRepository<FollowedPeople> repository, IUserServices userServices) : base(repository)
        {
            _repository = repository;
            _userServices = userServices;
        }
        public async Task<ResultMessage<FollowedPeople>> FollowUserAsync(int flowId, int userId)
        {
            ResultMessage<FollowedPeople> resultMessage = new ResultMessage<FollowedPeople>();
            if (flowId==userId)
            {
                //Kişi kendisini takip etmeye çalışıyo gibi bişi çıkıyo saçma oda.
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotFollewedHimself, "Kullanıcı kendisini takip edemez.");
                return resultMessage;
            }
            if (await _userServices.Get(p => p.Id == flowId) == null)
            {
                //ilgili Kullanıcı Yok
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı bulunamadı.");
                return resultMessage;
            }
            var durum = await Get(p => p.ObserverId == userId && p.TargetId == flowId);
            if (durum != null)
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı zaten takip ediliyor.");
                return resultMessage;
            }
            var sonuc=await Insert(new FollowedPeople() { TargetId = flowId, ObserverId = userId });
            if (sonuc>0)
            {
                resultMessage.Result = new FollowedPeople() { TargetId = flowId, ObserverId = userId };
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotFollowed, "Kullanıcı takip edilemedi.");
            }
            return resultMessage;
        }
    }
}
