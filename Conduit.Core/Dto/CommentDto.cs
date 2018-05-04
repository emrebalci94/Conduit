using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Conduit.Common.Dto
{
    public class CommentDto
    {
        public int Id { get; set; }
        [Required]
        public int ArticleId { get; set; }
        [Required]
        public int AuthorUserId { get; set; }
        [Required]
        public string Body { get; set; }
        public UserDto AuthorUser { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
