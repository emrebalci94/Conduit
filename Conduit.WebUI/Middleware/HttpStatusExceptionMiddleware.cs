using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace Conduit.WebUI.Middleware
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class HttpStatusExceptionMiddleware
    {
        private readonly RequestDelegate _next;

        public HttpStatusExceptionMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (UnauthorizedAccessException ex)
            {

                httpContext.Response.Clear();
                httpContext.Response.Redirect($"/Error/Index?url={httpContext.Request.Path}&type=401");
            }
            catch (Exception ex)
            {
                httpContext.Response.Clear();
                httpContext.Response.Redirect($"/Error/Index?url={httpContext.Request.Path}&type={ex.HResult}&message={ex.Message}");

            }

            return;
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class HttpStatusExceptionMiddlewareExtensions
    {
        public static IApplicationBuilder UseHttpStatusExceptionMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<HttpStatusExceptionMiddleware>();
        }
    }
}
