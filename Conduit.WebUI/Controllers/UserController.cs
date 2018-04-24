using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Conduit.WebUI.Helpers.Services;
using Conduit.WebUI.Models;
using Conduit.WebUI.Models.ApiResponseModels;
using Conduit.WebUI.Models.Dto;
using Conduit.WebUI.Models.Messages;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Conduit.WebUI.Controllers
{
    public class UserController : Controller
    {

        private readonly IApiRequestService _apiRequestService;
        private readonly IHostingEnvironment _hostingEnvironment;
        public UserController(IApiRequestService apiRequestService, IHostingEnvironment hostingEnvironment)
        {
            _apiRequestService = apiRequestService;
            _hostingEnvironment = hostingEnvironment;
        }

        public IActionResult Index()
        {

            return RedirectToAction("Login");
        }

        public IActionResult Register()
        {
            return View();
        }

        public IActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var result = _apiRequestService.Post<LoginModel>("http://localhost:58160/api/Token/Login", model);
                    if (result != null)
                    {
                        List<Claim> claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.PrimarySid,result.UserId.ToString()),
                        new Claim(ClaimTypes.Upn,result.UserName),
                        new Claim(ClaimTypes.Hash,result.Token)  };

                        ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "cooike");
                        ClaimsPrincipal principal = new ClaimsPrincipal(claimsIdentity);

                        HttpContext.SignInAsync(principal).Wait();
                        return RedirectToAction("Index", "Home");
                    }
                }
                catch (Exception)
                {
                    //TODO: _apiRequestService hata patlattığı için sadece bu kısımda middleware in devreye girmesini istemiyorum. Ondan catch ile yakaladım.
                    ViewBag.Fail = true;
                }
            }
            return View(model);
        }

        [Authorize]
        public IActionResult SingOut()
        {
            HttpContext.SignOutAsync().Wait();
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        public IActionResult Profile()
        {
            var model = _apiRequestService.Get<UserDto>($"http://localhost:58160/api/User/{ User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.PrimarySid).Value }", true);
            return View(model);

        }

        [Authorize]
        [HttpPost]
        public IActionResult Profile(UserDto model, string profileImg)
        {
            if (ModelState.IsValid)
            {
                if (HttpContext.Request.Form.Files.Count > 0)
                {
                    var files = HttpContext.Request.Form.Files;
                    foreach (var item in files)
                    {
                        if (item.Length > 0)
                        {
                            var filename = ContentDispositionHeaderValue.Parse(item.ContentDisposition).FileName.Trim('"');
                            var fileExtension = Path.GetExtension(filename);
                            var newfile = model.UserName + fileExtension;
                            filename = Path.Combine(_hostingEnvironment.WebRootPath, "profileImages") + $@"\{newfile}";
                            model.Image = $"profileImages/{newfile}";
                            if (System.IO.File.Exists(filename))
                            {
                                System.IO.File.Delete(filename);
                            }
                            using (FileStream fs = System.IO.File.Create(filename))
                            {
                                item.CopyTo(fs);
                                fs.Flush();
                            }
                        }
                    }
                }
                model.Image = profileImg;
                var gelen = _apiRequestService.Put<ResultMessage<UserDto>>("http://localhost:58160/api/User", model, true);
                ViewBag.Update = true;
                return RedirectToAction("Profile");
            }
            return View(model);
        }


        [Authorize]
        public IActionResult NewToken()
        {
            var id = HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.PrimarySid).Value;
            var username = HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.Upn).Value;
            var token = _apiRequestService.Get<LoginModel>($"http://localhost:58160/api/Token/retoken/{ username }");

            List<Claim> claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.PrimarySid,id),
                        new Claim(ClaimTypes.Upn,username),
                        new Claim(ClaimTypes.Hash,token.Token)  };

            ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "cooike");
            ClaimsPrincipal principal = new ClaimsPrincipal(claimsIdentity);
            HttpContext.SignOutAsync().Wait();
            HttpContext.SignInAsync(principal).Wait();

            return new ObjectResult(new { Status = true, Message = "Token Alındı.." });
        }

        [Authorize]
        public IActionResult LikeArticle(int id)
        {
            var userId = HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.PrimarySid).Value;
            var gelen = _apiRequestService.Post<ResultMessage<ArticleFavorite>>($"http://localhost:58160/api/User/favoritearticle/{userId}?articleId={id}", true);

            if (gelen.Errors == null)
            {
                if (gelen.Result.ArticleId == 0)
                {
                    //Unlike işlemi
                    return new ObjectResult(new { Unlike = true, Message = "İlgili makale beğenilerden çıkarıldı." });

                }

                return new ObjectResult(new { Status = true, Message = "İlgili makale beğenildi." });
            }


            return new ObjectResult(new { Status = false, Message = gelen.Errors.Message });


        }



    }
}