using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Conduit.WebUI.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index(string url,string type,string message="")
        {
            ViewBag.Url = url;
            ViewBag.Type = type;
            ViewBag.Message = message;
            return View();
        }
    }
}