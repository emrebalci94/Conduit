using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Conduit.WebUI.Helpers.Services;
using Conduit.WebUI.Models.Dto;
using Conduit.WebUI.Models.Messages;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebUI.Controllers
{
    [Authorize]
    public class ArticleController : Controller
    {
        private readonly IApiRequestService _apiRequestService;
        public ArticleController(IApiRequestService apiRequestService)
        {
            _apiRequestService = apiRequestService;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost] //TODO:Insert
        public IActionResult Index(ArticleDto model, string tagler)
        {
            if (ModelState.IsValid)
            {
                var slug = model.Title;
                slug = slug.TrimStart().TrimEnd().Replace(" ", "_");
                model.Slug = slug;
                if (tagler != null)
                {

                    var tags = tagler.Split(',');
                    //Baş harfi büyük olsun diye
                    for (int i = 0; i < tags.Length; i++)
                    {
                        tags[i] = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(tags[i].ToLower());
                    }
                    model.Tags.AddRange(tags);
                }

                model.AuthorUserId = Convert.ToInt32(User.Claims.FirstOrDefault(p => p.Type == System.Security.Claims.ClaimTypes.PrimarySid).Value);

                var gelen = _apiRequestService.Post<ResultMessage<ArticleDto>>($"http://localhost:58160/api/Article", model, true);
                if (gelen.Errors == null)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    model.Tags.Clear();
                }
            }
            return View(model);
        }

        public IActionResult Edit(string id)//slug veriyoruz
        {
            var gelen = _apiRequestService.Get<ArticleDto>($"http://localhost:58160/api/Article/{id}");
            if (gelen == null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View(gelen);
        }

        [HttpPost]
        public IActionResult Edit(ArticleDto model, string tagler)
        {
            if (ModelState.IsValid)
            {
                var slug = model.Title;
                slug = slug.TrimStart().TrimEnd().Replace(" ", "_");
                model.Slug = slug;
                if (tagler != null)
                {

                    var tags = tagler.Split(',');
                    //Baş harfi buyuk gerisi kucuk olsun diye
                    for (int i = 0; i < tags.Length; i++)
                    {
                        tags[i] = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(tags[i].ToLower());
                    }
                  
                    model.Tags.AddRange(tags);
                }

                model.AuthorUserId = Convert.ToInt32(User.Claims.FirstOrDefault(p => p.Type == System.Security.Claims.ClaimTypes.PrimarySid).Value);

                var gelen = _apiRequestService.Put<ResultMessage<ArticleDto>>($"http://localhost:58160/api/Article/{model.Id}", model, true);
                if (gelen.Errors == null)
                {
                    return RedirectToAction("Index", "Home");
                }
                //else
                //{
                //    model.Tags.Clear();
                //}
                ViewBag.Error = gelen.Errors.Message;
            }
            return View(model);
        }
    }
}