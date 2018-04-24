using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Conduit.Business.Services;
using Conduit.Business.ViewModels;
using Conduit.Domain;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Tag")]
    [EnableCors("AllowAll")]
    public class TagController : Controller
    {
        private readonly ITagServices _tagServices;
        public TagController(ITagServices tagServices)
        {
            _tagServices = tagServices;
        }

        [HttpGet]
        public async Task<List<TagViewModel>> Get()
        {
            return await _tagServices.GetList();
        }

        [HttpGet("GetList")]
        public List<Tag> GetList()
        {
            return _tagServices.GetIncludes(p => p.ArticleTags).ToList();
        }
        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody]Tag tag)
        {
            var durum = await _tagServices.InsertAsync(tag);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return BadRequest(durum);

        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAsync([FromBody]Tag tag)
        {
            var durum = await _tagServices.DeleteAsync(tag);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return BadRequest(durum);
        }
    }
}