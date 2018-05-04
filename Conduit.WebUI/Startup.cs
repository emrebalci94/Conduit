using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Conduit.WebUI.Helpers.Managers;
using Conduit.WebUI.Helpers.Services;
using Conduit.WebUI.Middleware;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;


namespace Conduit.WebUI
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAuthentication("CooikeAut").AddCookie("CooikeAut", option =>
            {
                option.AccessDeniedPath = new PathString("/User/AccessDenied");
                option.LoginPath = new PathString("/User/Login");

            });

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IApiRequestService, ApiRequestManager>();
            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseAuthentication();
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseHttpStatusExceptionMiddleware();
            }
            else
            {
                app.UseHttpStatusExceptionMiddleware();
                app.UseExceptionHandler();
            }

            app.UseStaticFiles();// wwwroot altındaki css ve scriptleri görsün diye
            app.UseMvc(routes =>
            {
                routes.MapRoute(name: "articledetail", template: "Article/{slug}", defaults: new { controller = "Article", action = "ArticleDetail" });

                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
                routes.MapRoute("userdetail", "User/{username}", defaults: new { controller = "User", action = "Detail" });
            });
        }
    }
}
