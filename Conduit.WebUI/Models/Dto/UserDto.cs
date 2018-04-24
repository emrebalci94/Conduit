using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Conduit.WebUI.Models.Dto
{
    public class UserDto
    {
        //Burda DataAnonutions olmalı Requird felan...ConfirmPassword Felan eklenecek.
        public int Id { get; set; }
       
        public string UserName { get; set; }
        
        public string Password { get; set; }

        public string Email { get; set; }
       
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Image { get; set; }

        public string Bio { get; set; }
        /// <summary>
        /// Username'in kriptolanmış hali.
        /// </summary>
        public string Salt { get; set; }
        /// <summary>
        /// UserDto dan gelen password ile username'in kriptolanmış hali.
        /// </summary>
        public string Hash { get; set; }

    }
}
