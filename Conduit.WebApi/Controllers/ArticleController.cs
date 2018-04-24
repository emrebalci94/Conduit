using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Conduit.Business.Services;
using Conduit.Business.ViewModels;
using Conduit.Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Article")]
    [EnableCors("AllowAll")]
    public class ArticleController : Controller
    {
        private readonly IArticleServices _articleServices;
        //private readonly IArticleTagsServices _articleTagServices;

        public ArticleController(IArticleServices articleServices)
        {
            _articleServices = articleServices;
            //_articleTagServices = articleTagsServices;
        }
        [HttpGet("GetAll")]
        public async Task<List<Article>> Get()
        {
            return await Task.Run(() => _articleServices.GetList());
        }

        [HttpGet("{slug}")]
        public async Task<ArticleViewModel> Get(string slug)
        {
            return await _articleServices.GetViewModel(p => p.Slug == slug);
        }

        [HttpGet]
        public async Task<ArticleListModel> GetArticleListModel([FromQuery] string tag, [FromQuery] int? offset, [FromQuery] int? limit,[FromQuery] int? userid)
        {
            return await _articleServices.GetListModel(new ArticleQuery(tag, offset, limit,userid));
        }

        [HttpGet]
        [Route("GetListWithComments")]
        public List<Article> GetListWithComments()
        {
           
            return _articleServices.GetIncludes(p => p.Comments).ToList();//Inlude'un çalışması için JsonSerilaze ayarından ignore yapmamız gerekiyor.
        }

        [HttpPut("{id}")]//Şöyle Yaparak id'miz Urlin yanınana "/1" şeklinde gelecek diyoruz
        [Authorize]
        public async Task<IActionResult> Put(int id, [FromBody]ArticleViewModel article)//Body kısmından gelcek id ise Linkin yanndan gelcek demek.
        {
            //TODO: Urlden hemde bodyden almayı denemek için.
            article.Id = id;
            var durum = await _articleServices.Update(article);
            if (durum.Errors == null)
            {
                return Ok(durum);
            }
            return Ok(durum);
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Post([FromBody]ArticleViewModel article)
        {
            var durum = await _articleServices.Insert(article);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return Ok(durum);
        }

        [HttpDelete("{id}")]
        [Authorize]
        public async Task<IActionResult> Delete(int id)
        {
            var durum = await _articleServices.Delete(id);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return BadRequest(durum);
        }

        //[HttpPost("AddTags")]
        //public async Task<IActionResult> ArticleTagsAsync([FromBody] ArticleTag tag)
        //{
        //    var durum = await _articleTagServices.Insert(tag);
        //    if (durum.Errors == null)
        //    {
        //        return Ok(durum);
        //    }
        //    return Ok(durum);
        //}
    }
}