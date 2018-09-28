using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebApi.Helpers
{
    public interface IUploadHelper
    {
        string Upload(IFormFile file, string folderName, string fileName);
        string GetCdn(string fileName);
    }

    public class UploadHelper : IUploadHelper
    {
        private readonly IHostingEnvironment _hostingEnvironment;

        public UploadHelper(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        public string GetCdn(string fileName)
        {
            return Path.Combine(_hostingEnvironment.WebRootPath, fileName);
        }

        public string Upload(IFormFile file, string folderName, string fileName)
        {
            string baseUrl = Path.Combine(_hostingEnvironment.WebRootPath, folderName);
            if (!Directory.Exists(baseUrl))
            {
                Directory.CreateDirectory(baseUrl);
            }

            if (file.Length > 0)
            {
                fileName = fileName + '.' + file.ContentType.Split('/')[1];
                string url = Path.Combine(baseUrl, fileName);
                using (var stream = new FileStream(url, FileMode.Create))
                {
                    file.CopyTo(stream);
                    return Path.Combine(folderName, fileName);
                }
            }

            return null;
        }
    }
}
