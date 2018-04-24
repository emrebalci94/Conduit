using AutoMapper;
using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Common.DataAccess;
using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.Business.Managers.EntityFramework
{
    public class EfCommentManager : ManagerBase<Comment>, ICommentSercices
    {
        private readonly IRepository<Comment> _repository;
        private readonly IMapper _mapper;
        private readonly IArticleServices _articleServices;
        private readonly IUserServices _userServices;
        public EfCommentManager(IRepository<Comment> repository, IMapper mapper, IArticleServices articleServices, IUserServices userServices) : base(repository)
        {
            _repository = repository;
            _mapper = mapper;
            _articleServices = articleServices;
            _userServices = userServices;
        }

        public async Task<ResultMessage<CommentDto>> DeleteAsync(int id)
        {
            ResultMessage<CommentDto> resultMessage = new ResultMessage<CommentDto>();
            var comment = await Get(p => p.Id == id);
            if (comment != null)
            {
                var sonuc =await base.Delete(comment);
                if (sonuc > 0)
                {
                    resultMessage.Result = null;
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CommentCouldNotDeleted, "Yorum silinemedi.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CommentNotFound, "Yorum bulunamadı.");
            }
            return resultMessage;
        }

        public async Task<ResultMessage<CommentDto>> InsertAsync(CommentDto commentDto)
        {
            ResultMessage<CommentDto> resultMessage = new ResultMessage<CommentDto>();
            var user = _userServices.Get(p => p.Id == commentDto.AuthorUserId);
            if (user != null)
            {
                var article = await _articleServices.Get(p => p.Id == commentDto.ArticleId);
                if (article != null)
                {
                    commentDto.CreatedAt = DateTime.Now;
                    commentDto.UpdatedAt = DateTime.Now;
                    Comment comment = _mapper.Map<Comment>(commentDto);
                    int sonuc =await base.Insert(comment);
                    if (sonuc > 0)
                    {
                        resultMessage.Result = _mapper.Map<CommentDto>(comment);
                    }
                    else
                    {
                        resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CommentCouldNotInserted, "Yorum eklenemedi.");
                    }
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "Makale bulunamadı.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "Kullanıcı bulunamadı.");
            }

            return resultMessage;
        }

        public async Task<ResultMessage<CommentDto>> UpdateAsync(CommentDto commentDto)
        {
            ResultMessage<CommentDto> resultMessage = new ResultMessage<CommentDto>();
            var user = _userServices.Get(p => p.Id == commentDto.AuthorUserId);
            if (user != null)
            {
                var article = _articleServices.Get(p => p.Id == commentDto.ArticleId);
                if (article != null)
                {
                    Comment comment =await Get(p => p.Id == commentDto.Id);
                    if (comment == null)
                    {
                        resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CommentNotFound, "Yorum bulunamadı.");
                    }
                    else
                    {
                        //Eğer Comment varsa 
                        comment.UpdatedAt = DateTime.Now;
                        comment.AuthorUserId = commentDto.AuthorUserId;
                        comment.ArticleId = commentDto.ArticleId;
                        comment.Body = commentDto.Body;
                        int sonuc = await base.Update(comment);
                        if (sonuc > 0)
                        {
                            resultMessage.Result = _mapper.Map<CommentDto>(comment);
                        }
                        else
                        {
                            resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.CommentCouldNotUpdated, "Yorum güncellenemedi.");
                        }
                    }
                }
                else
                {
                    resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.ArticleNotFound, "Makale bulunamadı.");
                }
            }
            else
            {
                resultMessage.Errors = new ErrorMessageObj(ErrorMessageCode.UserNotFound, "Kullanıcı bulunamadı.");
            }

            return resultMessage;
        }

        public new async Task<List<CommentDto>> GetListAsync()
        {
            var commentList =await base.GetList();
            return _mapper.Map<List<CommentDto>>(commentList);
        }
    }
}
