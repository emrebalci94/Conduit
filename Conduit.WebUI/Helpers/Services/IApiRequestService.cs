using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Conduit.WebUI.Helpers.Services
{
    public interface IApiRequestService
    {
        /// <summary>
        /// Belirtilen apiye istek atar ve istediğin tipe çevirir.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="requestUrl"></param>
        /// <param name="authorize"> Token gerekliyse kullanmak gerekiyor. </param>
        /// <returns></returns>
        T Get<T>(string requestUrl, bool authorize = false) where T : class, new();
        /// <summary>
        /// Belirtilen apiye istek gönderilir ve dönüş tipi istenilen tipe çevirilir.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="requestUrl"></param>
        /// <param name="authorize"> Token gerekliyse kullanmak gerekiyor. </param>
        /// <returns></returns>
        T Post<T>(string requestUrl, object requestData, bool authorize = false) where T : class, new();
        /// <summary>
        /// Datayı urle vererek yada sadece belirtilen apiye istek gönderilir ve dönüş tipi istenilen tipe çevirilir.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="requestUrl"></param>
        /// <param name="authorize"></param>
        /// <returns></returns>
        T Post<T>(string requestUrl, bool authorize = false) where T : class, new();

        /// <summary>
        ///  Belirtilen urldeki apiye gidip ilgili datayı güncelleme işlemi yapar.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="requestUrl"></param>
        /// <param name="requestData"></param>
        /// <param name="authorize"> Token gerekliyse kullanmak gerekiyor. </param>
        /// <returns></returns>
        T Put<T>(string requestUrl, object requestData,bool authorize=false) where T : class, new();
     
  

    }
}
