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
    public class EfArticleFavoriteManager : ManagerBase<ArticleFavorite>, IArticleFavoriteServices
    {
        private readonly IRepository<ArticleFavorite> _repository;
        private IArticleServices _articleServices { get; }
        private IUserServices _userServices { get; }

        public EfArticleFavoriteManager(IRepository<ArticleFavorite> repository, IArticleServices articleServices, IUserServices userServices) : base(repository)
        {
            _repository = repository;
            _articleServices = articleServices;
            _userServices = userServices;
        }

        public async Task<ResultMessage<ArticleFavorite>> AddFavoriteArticle(int userId, int articleId)
        {
            ResultMessage<ArticleFavorite> resultMessage = new ResultMessage<ArticleFavorite>();
            var isArticleExist = await _articleServices.Get(p => p.Id == articleId);
            if (isArticleExist == null)
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "İlgili makale bulunmaadı.");
                return resultMessage;
            }
            var user = await _userServices.Get(p => p.Id == userId);
            if (_userServices == null)
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "İlgili kullanıcı bulunmaadı.");
                return resultMessage;
            }
            var articleFavorite = await Get(p => p.UserId == userId && p.ArticleId == articleId);
            if (articleFavorite != null)
            {
                //resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleFavoriteAlreadyExists, "İlgili makaleyi zaten takip ediyorsunuz.");
                var durum = await Delete(articleFavorite);
                if (durum > 0)
                {
                    resultMessage.Result = new ArticleFavorite();
                }
                else
                {

                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleFavoriteCouldNotDeleted, "İlgili makale favorilerden silinemedi");
                }

                return resultMessage;

            }

            try
            {
                var durum = await Insert(new ArticleFavorite() { ArticleId = articleId, UserId = userId });
                if (durum < 1)
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleFavoriteCouldNotInserted, "İlgili makale favorilere eklenemedi.");
                    return resultMessage;
                }

                resultMessage.Result = new ArticleFavorite() { ArticleId = articleId, UserId = userId };

                return resultMessage;
            }
            catch (Exception ex)
            {

                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CriticalError, ex.Message);
                return resultMessage;
            }

        }

    }
}
