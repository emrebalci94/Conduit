using Conduit.Business.Services;
using Conduit.Common.DataAccess;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Linq.Expressions;
using Conduit.Business.Messages;
using Conduit.Business.ViewModels;
using AutoMapper;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfTagManager : ManagerBase<Tag>, ITagServices
    {
        private readonly IRepository<Tag> _repository;
        private readonly IMapper _mapper;
        public EfTagManager(IRepository<Tag> repository, IMapper mapper) : base(repository)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public new async Task<ResultMessage<Tag>> DeleteAsync(Tag tag)
        {
            ResultMessage<Tag> resultMessage = new ResultMessage<Tag>();
            var durum = await Get(p => p.TagId == tag.TagId);
            if (durum != null)
            {
                int sonuc = await base.Delete(durum);
                if (sonuc > 0)
                {
                    resultMessage.Result = null;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.TagCouldNotDeleted, "Konu başlığı silinemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.TagNotFound, "Konu başlığı bulunamadı.");
            }
            return resultMessage;
        }

        public new async Task<ResultMessage<Tag>> InsertAsync(Tag tag)
        {
            ResultMessage<Tag> resultMessage = new ResultMessage<Tag>();
            var durum = await Get(p => p.TagId == tag.TagId);
            if (durum == null)
            {
                int sonuc = await base.Insert(tag);
                if (sonuc > 0)
                {
                    resultMessage.Result = tag;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.TagCouldNotInserted, "Konu başlığı eklenemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.TagAlreadyExists, "Konu başlığı zaten var.");
            }
            return resultMessage;
        }

        public new async Task<List<TagViewModel>> GetList()
        {
            var tagList = await base.GetList();
            var list = new List<TagViewModel>();
            await Task.Run(() => list = _mapper.Map<List<Tag>, List<TagViewModel>>(tagList));
            return list;
        }

        //public Task<ResultMessage<Tag>> InsertAllAsync(List<Tag> tags)
        //{
        //    ResultMessage<Tag> resultMessage = new ResultMessage<Tag>();
        //    var sonuc = _repository.Insert(tags);
        //    sonuc.Wait();
        //    if (sonuc.Result > 0)
        //    {
        //        //Insert Yapılsı
        //    }
        //    throw new NotImplementedException();
        //}
    }
}
