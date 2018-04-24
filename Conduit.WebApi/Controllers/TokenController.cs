using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Conduit.Business.Helpers;
using Conduit.Business.Services;
using Conduit.Common.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Token")]
    [EnableCors("AllowAll")]
    [AllowAnonymous()]
    public class TokenController : Controller
    {
        private readonly ITokenServices _tokenServices;
        public IConfiguration Configuration { get; }


        public TokenController(ITokenServices tokenServices, IConfiguration configuration)
        {
            _tokenServices = tokenServices;
            Configuration = configuration;
        }

        [HttpPost("new")]
        public async Task<IActionResult> GetTokenAsync([FromBody]UserDto user)
        {
            //TODO: Burda sadece username ve password gereken bir DTO da yapılabilir ondan şimdilik böyle.
            if (await _tokenServices.IsValidUsernameAndPasswordAsync(user.UserName, user.Password))
            {
                var gelenUser = await _tokenServices.GetUserAsync(user.UserName);
                return new ObjectResult(GenerateToken(gelenUser));
            }
            return Unauthorized();
        }

        //TODO: Tokenin Expires zamanı biterse yeniden refresh edebilileim tokeni diye yaptık.
        [HttpGet("retoken/{username}")]
        public async Task<IActionResult> ReTokenAsync(string username)
        {
            var user = await _tokenServices.GetUserAsync(username);
            return new ObjectResult(new { token = GenerateToken(user) });
        }

        [HttpPost("Login")]
        public async Task<IActionResult> LoginAsync([FromBody]UserDto user)
        {
            //TODO: Burda id ve tokenı dönüyorum ki UI tarfında ID ile api request atıp ona göre bakıcam
            if (await _tokenServices.IsValidUsernameAndPasswordAsync(user.UserName, user.Password))
            {
                var gelenUser = await _tokenServices.GetUserAsync(user.UserName);

                return new ObjectResult(new { userId = gelenUser.Id, userName = gelenUser.UserName, token = GenerateToken(gelenUser) });
            }
            return Unauthorized();
        }


        private string GenerateToken(Domain.User user)
        {

            var parameters = new Claim[]//Tokenin içerissinde neler gitsin firstname ,email gibi bilgiler vt de olsaydı eklenebilirdi.
            {
                new Claim(JwtRegisteredClaimNames.UniqueName,user.UserName),
                new Claim(JwtRegisteredClaimNames.NameId,user.Id.ToString()),
                new Claim(JwtRegisteredClaimNames.Email,user.Email)

            };

            SecurityKey securityKey = new SymmetricSecurityKey(CryptoHelper.GetByte((string)Convert.ChangeType(Configuration["JwtTokenConfig:IssuerSigningKey"], typeof(string)))); // Startupda yazdığımız olması gerek.

            var token = new JwtSecurityToken(
                issuer: (string)Convert.ChangeType(Configuration["JwtTokenConfig:ValidIssuer"], typeof(string)),
                audience: (string)Convert.ChangeType(Configuration["JwtTokenConfig:ValidAudience"], typeof(string)),
                claims: parameters,
                expires: DateTime.Now.AddMinutes((double)Convert.ChangeType(Configuration["JwtTokenConfig:TokenLifeTime"], typeof(double))),//
                signingCredentials: new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256)
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }


    }
}