using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.WebUI.Models.Messages
{
    public class ResultMessage<T> where T : class
    {
        public ErrorMessageObj Errors { get; set; }
        public T Result { get; set; }
    }
}
