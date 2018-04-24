using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Conduit.Business.Helpers
{
    public class CryptoHelper
    {
        // Bu class Username passwordunu criptolamak için kullanılır.
        /// <summary>
        /// Verilen username,parolayı SHA256 göre kriptolanmış halini döner.(Daha güvenli olması için usernamemide alıyoruz.)
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        public static string Encrypt(string username, string password)
        {
            var provider = new SHA256Managed();
            var passwordByte = GetByte(password + username);
            var passwordHash = provider.ComputeHash(passwordByte);
            return BitConverter.ToString(passwordHash);
        }

        // Bu class Username passwordunu criptolamak için kullanılır.
        /// <summary>
        /// Verilen username SHA256 göre kriptolanmış halini döner.(Veri Tabanında Salt alanına yazmak için kullanıyoruz.)
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public static string Salt(string username)
        {
            var provider = new SHA256Managed();
            var usernameByte = GetByte(username);
            var salt = provider.ComputeHash(usernameByte);
            return BitConverter.ToString(salt);
        }

        /// <summary>
        /// Encrypt() edilmiş bir şifreyi yeni girilen şifreyle uyuşup uyuşmadığına bakar.
        /// </summary>
        /// <param name="hash"></param>
        /// <param name="password"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        public static bool IsPasswordMatch(string hash, string password,string username)//Decrypt işlemi yok çünkü SHA256 da öyle bişi yok.Tek yöntem yeni girilen şifreyi de kriptolarsın sonra bakarsın 2side uyuşuryormu
        {
            var passwordHash = Encrypt(username,password);
            return hash.Equals(passwordHash);
        }

        /// <summary>
        /// Verilen herhangi bir veriyi byte dizisi haline çevirip geri verir.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static byte[] GetByte(string value)
        {
            return Encoding.UTF8.GetBytes(value);
        }
    }
}
