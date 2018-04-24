using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebUI.Models
{
    public class Users
    {
        [Required]
        [Display(Name = "Kullanıcı Adı")]
        [RegularExpression("^[a-z0-9_-]{3,25}$",ErrorMessage ="{0} Alanı minimum 3 - maximum 25 karakter olmalı ve özel karakter kullanılmamalıdır.")]
        public string Username { get; set; }
        [Required]
        [Display(Name = "Şifre")]
        public string Password { get; set; }
        [Required]
        [Compare("Password",ErrorMessage ="{0} ile {1} alanları eşleşmiyor.")]
        [Display(Name = "Şifre(Tekrar)")]
        public string ConfirmPassword { get; set; }
        [Required]
        [Display(Name = "Adı")]
        public string Firstname { get; set; }
        [Required]
        [Display(Name = "Soyadı")]
        public string Surname { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
