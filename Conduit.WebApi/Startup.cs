using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Conduit.Business.AutoMapping;
using Conduit.Business.Helpers;
using Conduit.Business.Managers.EntityFramework;
using Conduit.Business.Services;
using Conduit.Common.DataAccess;
using Conduit.Data;
using Conduit.Data.EntityFramework;
using Conduit.WebApi.Helpers;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Conduit.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Allow-Origin ve diğer ayarlar için
            services.AddCors(options =>
            {
                options.AddPolicy("AllowAll",
                    builder =>
                    {
                        builder
                        .AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader()
                        .AllowCredentials();
                    });
            });

            services.AddDbContext<ConduitContext>(option =>
            {
                option.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
                //option.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking); //Track etmemesini sağlıyo. Ama performans kaybı.
            });

            //AutoMapping Mevzusu
            var mapConfig = new AutoMapper.MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new AutoMappingProfileConfiguration());
            });
            var mapper = mapConfig.CreateMapper();

            services.AddScoped(typeof(IRepository<>), typeof(EfRepositoryBase<>));
            services.AddScoped<ITagServices, EfTagManager>();
            services.AddScoped<IArticleServices, EfArticleManager>();
            services.AddScoped<IUserServices, EfUserManager>();
            services.AddScoped<ITokenServices, EfUserManager>();
            services.AddScoped<IFollowedUserServices, EfFollowedUserManager>();
            services.AddScoped<IArticleTagsServices, EfArticleTagManager>();
            services.AddScoped<IArticleFavoriteServices, EfArticleFavoriteManager>();
            services.AddScoped<ICommentSercices, EfCommentManager>();
            services.AddScoped<IUploadHelper, UploadHelper>();
            services.AddSingleton<IConfiguration>(Configuration);
            services.AddSingleton(mapper); //Mapping Dependency
            services.AddMvc()
                .AddJsonOptions(option => option.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);//Include 'un çalışması için gerekli

            //Swashbuckle.AspNetCore
            //Otomatik Api Dokumantasyonunu sağlıyo --> localhost:{port}/swagger şeklinde yazdığında görüyorsun
            services.AddSwaggerGen(option =>
            {
                option.SwaggerDoc("ConduitApi", new Swashbuckle.AspNetCore.Swagger.Info { Title = "Conduit API", Version = "v1" });

            });

            //Internal Server Error /swagger/v1/swagger.json  --> Hatası aldıysan: [HttpGet] gibi tagler eksiktir. Her methodun tagi olmak zorunda




            #region - JWT TOKEN -
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
                {
                    //Appsetting.json dosyasından alıyoruz...
                    ValidateAudience = (bool)Convert.ChangeType(Configuration["JwtTokenConfig:ValidateAudience"], typeof(bool)),
                    ValidAudience = (string)Convert.ChangeType(Configuration["JwtTokenConfig:ValidAudience"], typeof(string)),
                    ValidateIssuer = (bool)Convert.ChangeType(Configuration["JwtTokenConfig:ValidateIssuer"], typeof(bool)),
                    ValidIssuer = (string)Convert.ChangeType(Configuration["JwtTokenConfig:ValidIssuer"], typeof(string)),
                    ValidateLifetime = (bool)Convert.ChangeType(Configuration["JwtTokenConfig:ValidateLifetime"], typeof(bool)),
                    ValidateIssuerSigningKey = (bool)Convert.ChangeType(Configuration["JwtTokenConfig:ValidateIssuerSigningKey"], typeof(bool)),
                    IssuerSigningKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes((string)Convert.ChangeType(Configuration["JwtTokenConfig:IssuerSigningKey"], typeof(string))))
                };
             
                options.Events = new JwtBearerEvents
                {
                    OnTokenValidated = ctx =>
                    {
                        //Token ile giriş yapıldıığında ne yapılmak isteniyorsa.
                        return Task.CompletedTask;
                    },
                    OnAuthenticationFailed = ctx =>
                    {
                        //Hatalı durumda ne yapılmak istenirse.
                        ctx.Response.StatusCode = 401;
                        return Task.CompletedTask;
                    }
                };
            });
            #endregion


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors("AllowAll");

            app.UseAuthentication();//Token için gerekli.

            //Swagger için gerekli
            app.UseSwagger();
            app.UseSwaggerUI(option =>
            {
                option.SwaggerEndpoint("/swagger/ConduitApi/swagger.json", "Conduit API");

            });

            app.UseMvc();

        }
    }
}
