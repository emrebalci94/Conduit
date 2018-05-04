using Conduit.Common.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    public class FollowedUserListModel
    {
        public List<UserDto> Users { get; set; }
        public int TotalCount { get; set; }
    }
}
