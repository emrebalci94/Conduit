using AutoMapper;
using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Business.ViewModels;
using Conduit.Common.DataAccess;
using Conduit.Data.EntityFramework;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfArticleManager : ManagerBase<Article>, IArticleServices
    {
        private readonly IRepository<Article> _repository;
        private readonly IMapper _mapper;
        private readonly ITagServices _tagServices;
        private readonly IUserServices _userServices;
        private readonly IArticleTagsServices _articleTagsServices;

        public EfArticleManager(IRepository<Article> repository, ITagServices tagServices, IUserServices userServices, IArticleTagsServices articleTagsServices, IMapper mapper) : base(repository)
        {
            _repository = repository;
            _tagServices = tagServices;
            _userServices = userServices;
            _articleTagsServices = articleTagsServices;
            _mapper = mapper;
        }

        public async Task<ResultMessage<Article>> Delete(int id)
        {
            ResultMessage<Article> resultMessage = new ResultMessage<Article>();
            var article = await Get(p => p.Id == id);
            if (article != null)
            {
                var sonuc = await base.Delete(article);
                if (sonuc > 0)
                {
                    resultMessage.Result = null;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleCouldNotDeleted, "Makale silinemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "İlgili makale bulunamadı.");
            }
            return resultMessage;
        }

        public async Task<ArticleListModel> GetListModel(ArticleQuery query)
        {
            ArticleListModel listModel = new ArticleListModel();
            IQueryable<Article> queryable = GetIncludes(p => p.AuthorUser, x => x.ArticleTags, p => p.ArticleFavorites); //Article Yapan User ve Taglar Gelsin

            if (!string.IsNullOrWhiteSpace(query.TagId))
            {
                var isTag = await _tagServices.Get(p => p.TagId == query.TagId);
                if (isTag != null)
                {
                    queryable = queryable.Where(p => p.ArticleTags.Select(x => x.TagId).Contains(isTag.TagId));
                }
            }

            if (query.UserId > 0)
            {
                var isUser = await _userServices.Get(p => p.Id == query.UserId);
                if (isUser != null)
                {
                    //Eğer Like yaptıklarını istiyorsak...
                    if (query.OnlyLiked)
                    {
                        queryable = queryable.Where(p => p.ArticleFavorites.Any(x => x.UserId == isUser.Id));
                    }
                    else
                    {
                        queryable = queryable.Where(p => p.AuthorUserId == isUser.Id);
                    }

                }

            }


            //.Select(p => new ArticleViewModel {Id=p.Id, AuthorUser = p.AuthorUser, AuthorUserId = p.AuthorUserId, Body = p.Body, CreatedAt = p.CreatedAt, Description = p.Description, Slug = p.Slug, Title = p.Title, UpdatedAt = p.UpdatedAt, Tags = p.ArticleTags.Select(x => x.TagId).ToList() })
            var articleList = queryable.OrderByDescending(p => p.UpdatedAt).Skip(query.Offset * query.Limit).Take(query.Limit).ToList();


            await Task.Run(() => listModel.Articles = _mapper.Map<List<Article>, List<ArticleViewModel>>(articleList));
            //listModel.Articles.ForEach(p =>
            //{
            //    p.Tags = articleList.FirstOrDefault(x => x.Id == p.Id).ArticleTags.Select(x => x.TagId).ToList();
            //});
            listModel.TotalCount = queryable.Count();

            return listModel;
        }

        public async Task<ArticleViewModel> GetViewModel(Expression<Func<Article, bool>> expression)
        {
            var article = GetIncludes(p => p.ArticleTags, p => p.AuthorUser, p => p.ArticleFavorites).FirstOrDefault(expression);
            return _mapper.Map<ArticleViewModel>(article);
        }

        public new async Task<ResultMessage<ArticleViewModel>> Insert(ArticleViewModel article)//Method Hidding
        {
            //TODO: Normalde DTO dan gelmesi gerekiyor verinin...(Dto Refactoring yapılması gerek.)
            ResultMessage<ArticleViewModel> resultMessage = new ResultMessage<ArticleViewModel>();
            var durum = await Get(p => p.Slug == article.Slug);
            if (durum == null)
            {
                article.CreatedAt = DateTime.Now;
                article.UpdatedAt = DateTime.Now;
                var articleDoa = _mapper.Map<Article>(article);
                var insertedTags = _tagServices.GetQueryable(p => article.Tags.Contains(p.TagId)).Select(p => p.TagId).ToList(); // Eklenmiş taglar olunca direk hataya düşüyor. Ondan eklenmiş tagları buluyoruz. Onları ArticleFavorites tablosuna ekleticez.
                var notInsertedTags = article.Tags.Where(p => !insertedTags.Contains(p)).ToList();
                if (notInsertedTags.Count > 0)
                {
                    foreach (var item in notInsertedTags)
                    {
                        articleDoa.ArticleTags.Add(new ArticleTag { Tag = new Tag { TagId = item }, Article = articleDoa });
                    }
                }

                var sonuc = await base.Insert(articleDoa);

                if (sonuc > 0)
                {
                    List<ArticleTag> articleTags = new List<ArticleTag>();
                    insertedTags.ForEach(p => { articleTags.Add(new ArticleTag { TagId = p, ArticleId = articleDoa.Id }); });
                    await _articleTagsServices.InsertAll(articleTags);
                    resultMessage.Result = article;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleCouldNotInserted, "Makale eklenemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleSlugAlreadyExists, "İlgili makalenin kısa url(slug) başka makale tarafından kullanılmakta.");
            }
            return resultMessage;
        }

        public async Task<ResultMessage<ArticleViewModel>> Update(ArticleViewModel article)
        {
            ResultMessage<ArticleViewModel> resultMessage = new ResultMessage<ArticleViewModel>();
            if (await Get(p => p.Slug == article.Slug && p.Id != article.Id) != null)
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleSlugAlreadyExists, "İlgili makalenin kısa url(slug) başka makale tarafından kullanılmakta.");
                return resultMessage;
            }

            var obj = await Get(p => p.Id == article.Id);
            if (obj != null)
            {

                var insertedTags = _tagServices.GetQueryable(p => article.Tags.Contains(p.TagId)).Select(p => p.TagId).ToList(); // Eklenmiş taglar olunca direk hataya düşüyor. Ondan eklenmiş tagları buluyoruz. Onları ArticleFavorites tablosuna ekleticez.
                var notInsertedTags = article.Tags.Where(p => !insertedTags.Contains(p)).ToList();
                if (notInsertedTags.Count > 0)
                {
                    foreach (var item in notInsertedTags)
                    {
                        obj.ArticleTags.Add(new ArticleTag { Tag = new Tag { TagId = item }, Article = obj });
                    }
                }

                obj.UpdatedAt = DateTime.Now;
                obj.Body = article.Body;
                obj.AuthorUserId = article.AuthorUserId;
                obj.Description = article.Description;
                obj.Title = article.Title;
                obj.Slug = article.Slug;

                var sonuc = await base.Update(obj);

                if (sonuc > 0)
                {
                    var deletedArticleTags = _articleTagsServices.GetQueryable(p => !notInsertedTags.Contains(p.TagId) && p.ArticleId == obj.Id).ToList();
                    var durum = await _articleTagsServices.DeleteAll(deletedArticleTags);

                    if (durum > 0 || deletedArticleTags.Count == 0)
                    {
                        List<ArticleTag> articleTags = new List<ArticleTag>();
                        insertedTags.ForEach(p => { articleTags.Add(new ArticleTag { TagId = p, ArticleId = obj.Id }); });
                        await _articleTagsServices.InsertAll(articleTags);

                    }
                    resultMessage.Result = _mapper.Map<ArticleViewModel>(obj);
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleCouldNotUpdated, "Makale güncellenemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "İlgili makale bulunamadı.");
            }
            return resultMessage;
        }
    }
}
