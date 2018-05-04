using AutoMapper;
using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Business.ViewModels;
using Conduit.Common.DataAccess;
using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfFollowedUserManager : ManagerBase<FollowedPeople>, IFollowedUserServices
    {
        private IRepository<FollowedPeople> _repository { get; }
        private IUserServices _userServices { get; }
        private IMapper _mapper { get; }

        public EfFollowedUserManager(IRepository<FollowedPeople> repository, IUserServices userServices, IMapper mapper) : base(repository)
        {
            _repository = repository;
            _userServices = userServices;
            _mapper = mapper;
        }
        public async Task<ResultMessage<FollowedPeople>> FollowUserAsync(int flowId, int userId)
        {
            ResultMessage<FollowedPeople> resultMessage = new ResultMessage<FollowedPeople>();
            if (flowId == userId)
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
                int isDurum = await UnFollow(durum);
                if (isDurum > 0)
                {
                    resultMessage.Result = new FollowedPeople() { };
                    return resultMessage;
                }

                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı zaten takip ediliyor.");
                return resultMessage;
            }
            var sonuc = await Insert(new FollowedPeople() { TargetId = flowId, ObserverId = userId });
            if (sonuc > 0)
            {
                resultMessage.Result = new FollowedPeople() { TargetId = flowId, ObserverId = userId };
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotFollowed, "Kullanıcı takip edilemedi.");
            }
            return resultMessage;
        }

        public async Task<bool> UserIsFollowAsync(int flowId, int userId)
        {
            var model = await _repository.Get(p => p.ObserverId == userId && p.TargetId == flowId);
            return model != null ? true : false;
        }

        async Task<int> UnFollow(FollowedPeople model)
        {
            return await Delete(model);
        }

        public async Task<FollowedUserListModel> GetListModel(int userid, int? limit , int? offset )
        {
            offset = offset ?? 0;
            limit = limit ?? 10;
            FollowedUserListModel listModel = new FollowedUserListModel();
            IQueryable<FollowedPeople> queryable = GetIncludes(p => p.Target); //Article Yapan User ve Taglar Gelsin

            if (userid > 0)
            {
                var isUser = await _userServices.Get(p => p.Id == userid);
                if (isUser != null)
                {
                    queryable = queryable.Where(p => p.ObserverId==userid);
                }
            }


            var users = queryable.OrderByDescending(p => p.TargetId).Skip(offset.Value * limit.Value).Select(p=>p.Target).Take(limit.Value).ToList();


            await Task.Run(() => listModel.Users = _mapper.Map<List<User>, List<UserDto>>(users));

            listModel.TotalCount = queryable.Count();

            return listModel;
        }
    }
}
