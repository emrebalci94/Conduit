using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Conduit.Business.Helpers;
using Conduit.Business.Services;
using Conduit.Common.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [EnableCors("AllowAll")]
    [Route("api/User")]
    public class UserController : Controller
    {
        private readonly IUserServices _userServices;
        private readonly IFollowedUserServices _flowedUserServices;
        private readonly IArticleFavoriteServices _articleFavoriteServices;

        public UserController(IUserServices userServices, IFollowedUserServices flowedUserServices, IArticleFavoriteServices articleFavoriteServices)
        {
            _userServices = userServices;
            _flowedUserServices = flowedUserServices;
            _articleFavoriteServices = articleFavoriteServices;
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync()
        {
            var list = await _userServices.GetList();
            return new ObjectResult(list.Select(p => new { p.UserName, p.Email, p.FirstName, p.LastName }).ToList());
        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<IActionResult> GetUserAsync(int id)
        {
            var result = await _userServices.GetUserAsync(id);
            if (result.Errors == null)
            {
               return Ok(result.Result);
            }
            return BadRequest(result.Errors.Message);
        }

        [HttpGet("detail/{username}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetUserAsync(string username)
        {
            var result = await _userServices.GetUserModel(username); 
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody]UserDto userDto)
        {
            //Model is valid mi yapılıcak...
            if (ModelState.IsValid)
            {
                var durum =await _userServices.InsertAsync(userDto);
                if (durum.Errors == null)
                {
                    return Ok(durum);
                }
                return Ok(durum);
            }
            return BadRequest(ModelState);
        }

        [HttpPut]
        [Authorize]
        public async Task<IActionResult> PutAsync([FromBody]UserDto userDto)
        {
            //Model is valid mi yapılıcak...
            if (ModelState.IsValid)
            {
                var durum = await _userServices.UpdateAsync(userDto);
                if (durum.Errors == null)
                {
                    return Ok(durum);
                }
                return Ok(durum);
            }
            return BadRequest(ModelState);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAsync(int id)
        {

            var durum =await _userServices.DeleteAsync(id);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return BadRequest(durum);
        }

        [Authorize()]
        [HttpPost("followuser/{id}")]
        public async Task<IActionResult> FollowUserAsync(int id)
        {
            var userId = Convert.ToInt32(User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier).Value);
            var durum =await _flowedUserServices.FollowUserAsync(id, userId);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return Ok(durum);

        }

        [HttpGet("isfollow")]
        public async Task<IActionResult> UserIsFollowAsync(int followid, int userid)
        {
            return Ok(new { status = await _flowedUserServices.UserIsFollowAsync(followid, userid) });

        }

        [HttpPost("favoritearticle/{id}")]
        [Authorize]
        public async Task<IActionResult> FavoriteArticleAsync(int id, int articleId)
        {
            var durum =await _articleFavoriteServices.AddFavoriteArticle(id, articleId);
            if (durum.Errors != null)
            {
                return Ok(durum);
            }
            return Ok(durum);
        }

        [HttpGet("followuserlist/{userid}")]
        public async Task<IActionResult> FollowUserList([FromQuery] int? offset, [FromQuery] int? limit,  int userid)
        {  
            var model = await _flowedUserServices.GetListModel(userid, limit, offset);
            return Ok(model);
        }
    }
}