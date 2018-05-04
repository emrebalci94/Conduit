using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Conduit.Business.Messages;
using Conduit.Business.Services;
using Conduit.Business.ViewModels;
using Conduit.Common.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Comment")]
    [EnableCors("AllowAll")]
    public class CommentController : Controller
    {
        private readonly ICommentSercices _commentSercices;
        public CommentController(ICommentSercices commentSercices)
        {
            _commentSercices = commentSercices;

        }

        [HttpGet("List")]
        public async Task<List<CommentDto>> GetAsync()
        {

            return await _commentSercices.GetListAsync();
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] CommentDto commentDto)
        {
            var message = await _commentSercices.InsertAsync(commentDto);
            if (message.Errors != null)
            {
                return Ok(message);
            }
            return Ok(message);
        }

        [HttpPut]
        public async Task<IActionResult> PutAsync([FromBody] CommentDto commentDto)
        {
            //TODO: Comment id si Urlden de alınabilir.
            var message = await _commentSercices.UpdateAsync(commentDto);
            if (message.Errors != null)
            {
                return Ok(message);
            }
            return Ok(message);
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAsync(int id)
        {
            var message = await _commentSercices.DeleteAsync(id);
            if (message.Errors != null)
            {
                return Ok(message);
            }
            return Ok(message);
        }

        [HttpGet]
        public async Task<IActionResult> GetArticleListModel([FromQuery] string slug, [FromQuery] int? offset, [FromQuery] int? limit)
        {
            var model = await _commentSercices.GetListModelAsync(new CommentQuery(slug, limit, offset));
            if (model == null)
            {
                return Ok(new { error = true, message = "Comment bulunumadı." });
            }

            return Ok((new { error = false, obj = model }));
        }
    }
}