using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebUI.Models.ApiResponseModels
{
    public class LoginModel
    {
        public int UserId { get; set; }
        public string Token { get; set; }
        public string UserName { get; set; }
    }
}
