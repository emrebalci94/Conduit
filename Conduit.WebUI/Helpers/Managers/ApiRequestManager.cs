using Conduit.WebUI.Helpers.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Conduit.WebUI.Helpers.Managers
{
    public class ApiRequestManager : IApiRequestService
    {
        private readonly IHttpContextAccessor _contextAccessor;
        public ApiRequestManager(IHttpContextAccessor contextAccessor)
        {
            _contextAccessor = contextAccessor;
        }

        public T Get<T>(string requestUrl, bool authorize = false) where T : class, new()
        {
            HttpRequestMessage requestMessage = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri(requestUrl)
            };

            if (authorize)
            {
                var token = _contextAccessor.HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.Hash).Value;

                requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            }

            HttpClient client = new HttpClient();
            var result = client.SendAsync(requestMessage);
            result.Wait();
            if (result.Result.StatusCode == System.Net.HttpStatusCode.OK)
            {

                var data = result.Result.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<T>(data);
            }
            else if (result.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new UnauthorizedAccessException();//TODO: Middleware yakalıcak.
            }
            return null;
        }

        public T Post<T>(string requestUrl, object requestData, bool authorize = false) where T : class, new()
        {
            HttpRequestMessage requestMessage = new HttpRequestMessage
            {
                Method = HttpMethod.Post,
                RequestUri = new Uri(requestUrl),
                Content = new StringContent(JsonConvert.SerializeObject(requestData), Encoding.UTF8, "application/json")
            };

            if (authorize)
            {
                var token = _contextAccessor.HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.Hash).Value;

                requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            }


            HttpClient client = new HttpClient();
            var result = client.SendAsync(requestMessage);
            result.Wait();
            if (result.Result.StatusCode == System.Net.HttpStatusCode.OK)
            {

                var data = result.Result.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<T>(data);
            }
            else if (result.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new UnauthorizedAccessException();//TODO: Middleware yakalıcak.


            }
            return null;
        }

        public T Post<T>(string requestUrl, bool authorize = false) where T : class, new()
        {
            HttpRequestMessage requestMessage = new HttpRequestMessage
            {
                Method = HttpMethod.Post,
                RequestUri = new Uri(requestUrl)
            };

            if (authorize)
            {
                var token = _contextAccessor.HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.Hash).Value;

                requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            }


            HttpClient client = new HttpClient();
            var result = client.SendAsync(requestMessage);
            result.Wait();
            if (result.Result.StatusCode == System.Net.HttpStatusCode.OK)
            {

                var data = result.Result.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<T>(data);
            }
            else if (result.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new UnauthorizedAccessException();//TODO: Middleware yakalıcak.
            }
            return null;
        }

        public T Put<T>(string requestUrl, object requestData, bool authorize = false) where T : class, new()
        {
            HttpRequestMessage requestMessage = new HttpRequestMessage
            {
                Method = HttpMethod.Put,
                RequestUri = new Uri(requestUrl),
                Content = new StringContent(JsonConvert.SerializeObject(requestData), Encoding.UTF8, "application/json")
            };

            if (authorize)
            {
                var token = _contextAccessor.HttpContext.User.Claims.First(p => p.Type == System.Security.Claims.ClaimTypes.Hash).Value;

                requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            }

            HttpClient client = new HttpClient();
            var result = client.SendAsync(requestMessage);
            result.Wait();
            if (result.Result.StatusCode == System.Net.HttpStatusCode.OK)
            {

                var data = result.Result.Content.ReadAsStringAsync().Result;
                return JsonConvert.DeserializeObject<T>(data);
            }
            else if (result.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new UnauthorizedAccessException();

            }
            throw result.Exception;
        }
    }
}
