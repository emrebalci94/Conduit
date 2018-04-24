using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.WebUI.Models.Messages
{
    public class ErrorMessageObj
    {
        public ErrorMessageObj()
        {

        }
        public ErrorMessageObj(ErrorMessageCode code,string message)
        {
            Code = code;
            Message = message;
        }
        public ErrorMessageCode Code { get; set; }
        public string Message { get; set; }
    }
}
