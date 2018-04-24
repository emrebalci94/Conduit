using AutoMapper;
using Conduit.Business.Helpers;
using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Common.DataAccess;
using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfUserManager : ManagerBase<User>, IUserServices, ITokenServices
    {
        private readonly IRepository<User> _repository;
        private readonly IMapper _mapper;
        private IArticleFavoriteServices _articleFavoriteServices { get; }
        public EfUserManager(IRepository<User> repository, IMapper mapper) : base(repository)
        {
            _mapper = mapper;
            _repository = repository;
        }

        public async Task<User> GetUserAsync(string username)
        {
            var user = await Get(p => p.UserName == username);
            return user;
        }

        public async Task<ResultMessage<User>> InsertAsync(UserDto user)
        {

            ResultMessage<User> resultMessage = new ResultMessage<User>();
            var durum = await Get(p => p.UserName == user.UserName);
            if (durum == null)
            {

                user.Salt = CryptoHelper.Salt(user.UserName);
                user.Hash = CryptoHelper.Encrypt(user.UserName, user.Password);
                var userDoa = _mapper.Map<User>(user);
                var sonuc = await base.Insert(userDoa);
                if (sonuc > 0)
                {
                    resultMessage.Result = userDoa;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotInserted, "Kullanıcı eklenemedi.");
                }

            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj { Code = ErrorMessageCode.UsernameAlreadyExists, Message = "Kullanıcı adı zaten kullanılıyor." };
            }
            return resultMessage;
        }

        public async Task<ResultMessage<UserDto>> UpdateAsync(UserDto userDto)
        {
            ResultMessage<UserDto> resultMessage = new ResultMessage<UserDto>();
            //TODO: Try/Catch performansı etkliyo
            //try
            //{
            var durum = await Get(p => p.Id != userDto.Id && p.UserName.ToLower().Equals(userDto.UserName.ToLower()));
            if (durum != null)
            {
                //Böyle bir kullanıcı adı kullanılıyor.
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UsernameAlreadyExists, "Kullanıcı adı başka bir kullanıcı tarafından kullanılıyor.");
                return resultMessage;
            }

            var user = await Get(p => p.Id == userDto.Id);
            if (user == null)
            {
                //Güncellencek kullanıcı bulunamadı.
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı bulunamadı.");
                return resultMessage;
            }
            userDto.Salt = CryptoHelper.Salt(userDto.UserName);
            if (userDto.Password != null)
            {
                userDto.Hash = CryptoHelper.Encrypt(userDto.UserName, userDto.Password);
            }
            var userDoa = _mapper.Map<User>(userDto);
            user.Id = userDoa.Id;
            if (userDto.Password != null)
            {
                user.Hash = userDoa.Hash;
            }
            user.FirstName = userDoa.FirstName;
            user.LastName = userDoa.LastName;
            user.Image = userDoa.Image;
            user.UserName = userDoa.UserName;
            user.Salt = userDoa.Salt;
            user.Email = userDoa.Email;
            user.Bio = userDoa.Bio;
            var sonuc = await base.Update(user);
            if (sonuc > 0)
            {
                resultMessage.Result = _mapper.Map<UserDto>(user);
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotUpdated, "Kullanıcı güncelenemedi.");

            }
            return resultMessage;
            //}
            //catch (Exception ex)
            //{
            //    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CriticalError, ex.Message);
            //    return resultMessage;
            //}

        }

        public async Task<bool> IsValidUsernameAndPasswordAsync(string username, string password)
        {
            var user = await Get(p => p.UserName == username);
            if (user == null)
            {
                return false;
            }
            return CryptoHelper.IsPasswordMatch(user.Hash, password, user.UserName);
        }

        public async Task<ResultMessage<User>> DeleteAsync(int id)
        {
            ResultMessage<User> resultMessage = new ResultMessage<User>();
            var user = await Get(p => p.Id == id);
            if (user == null)
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı bulunamadı.");
                return resultMessage;
            }
            var sonuc = await base.Delete(user);
            if (sonuc > 0)
            {
                resultMessage.Result = null;
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserCouldNotDeleted, "Kullanıcı silinemedi.");
            }
            return resultMessage;
        }

        public async Task<ResultMessage<UserDto>> GetUserAsync(int id)
        {
            ResultMessage<UserDto> resultMessage = new ResultMessage<UserDto>();
            var user = await Get(p => p.Id == id);
            if (user != null)
            {
                resultMessage.Result = _mapper.Map<UserDto>(user);
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "Kullanıcı bulunamadı.");
            }
            return resultMessage;
        }
    }
}
