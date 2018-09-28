using Conduit.WebApi.Helpers;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Upload")]
    [EnableCors("AllowAll")]
    public class UploadController : Controller
    {
        private readonly IUploadHelper _uploadHelper;

        public UploadController(IUploadHelper uploadHelper)
        {
            _uploadHelper = uploadHelper;
        }

        [HttpPost, DisableRequestSizeLimit]
        public IActionResult Upload()
        {
            var file = Request.Form.Files[0];

            return Ok(_uploadHelper.Upload(file, "test", "yeni"));
        }

        [HttpGet]
        public IActionResult GetCdn()
        {
            return Ok(_uploadHelper.GetCdn("test\\yeni.jpeg"));
        }
    }
}
