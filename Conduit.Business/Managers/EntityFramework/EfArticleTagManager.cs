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
    public class EfArticleTagManager : ManagerBase<ArticleTag>, IArticleTagsServices
    {
        private readonly IRepository<ArticleTag> _repository;
        //private IArticleServices _articleServices { get; } //TODO: ArticleServicesde IArticleTagServicesi çağırıyoruz o yüzden çakışıyolar.
        private ITagServices _tagServices { get; }
        public EfArticleTagManager(IRepository<ArticleTag> repository, ITagServices tagServices) : base(repository)// IArticleServices articleServices
        {
            _repository = repository;
            //_articleServices = articleServices;
            _tagServices = tagServices;
        }

        public new async Task<ResultMessage<ArticleTag>> Insert(ArticleTag articleTag)
        {
            ResultMessage<ArticleTag> resultMessage = new ResultMessage<ArticleTag>();
            var isExists = await Get(p => p.TagId == articleTag.TagId && p.ArticleId == articleTag.ArticleId);
            if (isExists == null)
            {
                var tag = _tagServices.Get(p => p.TagId == articleTag.TagId);
                if (tag != null)
                {
                    //var article = await _articleServices.Get(p => p.Id == articleTag.ArticleId);
                    //if (article != null)
                    //{
                        var sonuc =await base.Insert(articleTag);
                        if (sonuc > 0)
                        {
                            resultMessage.Result = articleTag;
                        }
                        else
                        {
                            resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleTagCouldNotInserted, "Makaleye konu başlığı eklenemedi.");
                        }
                    //}
                    //else
                    //{
                    //    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "Makale bulunamadı.");
                    //}
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.TagNotFound, "Konu başlığı bulunamadı.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleTagAlreadyExists, "İlgili makaleye konu başlığı zaten verimiş.");
            }
            return resultMessage;
        }

        public Task<int> DeleteAll(List<ArticleTag> articleTags)
        {
            //TODO: Var mı diye kontrol yapılabilir.
            return _repository.Delete(articleTags);
        }
    }
}
