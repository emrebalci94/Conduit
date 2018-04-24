using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebUI.Models
{
    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Kullanıcı Adı")]
        [RegularExpression("^[a-z0-9_-]{3,25}$", ErrorMessage = "{0} Alanı minimum 3 - maximum 25 karakter olmalı ve özel karakter kullanılmamalıdır.")]
        public string Username { get; set; }
        [Required]
        [Display(Name = "Şifre")]
        public string Password { get; set; }
    }
}
