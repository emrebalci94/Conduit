using Conduit.Common.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    public class CommentListModel
    {
        public List<CommentDto> Comments { get; set; }
        public int TotalCount { get; set; }
    }
}
