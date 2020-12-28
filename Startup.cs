// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.
//#define V4 //identityserver >=4.0 新版本 默认 使用 这个 版本  其他 版本 的出错 内容 不一致 https://www.cnblogs.com/zhanghm1/p/13366458.html git 样例没变
//#define V3 //identityserver <4.0 新版本

using IdentityServer.Data;
using IdentityServer.Models;
using IdentityServer.Validation;
using IdentityServer4;
using IdentityServer4.AspNetIdentity;
using IdentityServer4.Configuration;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Interfaces;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServerHost.Quickstart.UI;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Reflection;
using Utility.Json;

namespace IdentityServer
{
    public class Startup
    {
        public static readonly JsonSerializerSettings JsonSerializerSettings = new JsonSerializerSettings()
        {
            //忽略循环引用
            ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
            //使用 ab_c AbC  实际 AbC  ab_c 
            ContractResolver = //JsonContractResolver.ObjectResolverJson,
            JsonContractResolver.JsonResolverObject,
            //设置时间格式
            DateFormatString = "yyyy-MM-dd HH:mm:ss"
        };
        public static Func<DbContextOptionsBuilder, DbContextOptionsBuilder> GetFunc(string connectionString,string migrationsAssembly)
        {
            Func<DbContextOptionsBuilder, DbContextOptionsBuilder> func = options =>
            {
                // services.AddSingleton<DbContextOptions>(options.Options);
#if Sqlite
               return options.UseSqlite
#elif MySql
                return options.UseMySql
#elif Oracle
                return options.UseOracle
#elif Postgre
                return options.UseNpgsql
#elif SqlServer
                return options.UseSqlServer
#endif
#if MySql || SqlServer || Postgre || Sqlite || Oracle
                (connectionString, sqlOptions =>
                {
                    sqlOptions.MigrationsAssembly(migrationsAssembly);
#if !(Sqlite || Oracle)
                    //Configuring Connection Resiliency: https://docs.microsoft.com/en-us/ef/core/miscellaneous/connection-resiliency 
                    sqlOptions.EnableRetryOnFailure(15, TimeSpan.FromSeconds(30), null);
#endif
                }
                );
#else
                return null;
#endif
                };
            return func;
        }

        public Startup(IConfiguration configuration)
        {
            
               Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        public void ConfigureServices(IServiceCollection services)
        {          
            // JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Clear();//InvalidOperationException: sub claim is missing
            //注册Cookie认证服务
            //services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie();
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });
            services.AddSession();
            services.AddApiVersioning((Action<ApiVersioningOptions>)delegate (ApiVersioningOptions options)
            {
                options.ReportApiVersions = true;
                options.DefaultApiVersion = new ApiVersion(1, 0);
                options.AssumeDefaultVersionWhenUnspecified = true;
            });
            services.Configure<IISOptions>(iis =>
            {
                iis.AuthenticationDisplayName = "Windows";
                iis.AutomaticAuthentication = false;
            });

            // ..or configures IIS in-proc settings
            services.Configure<IISServerOptions>(iis =>
            {
                iis.AuthenticationDisplayName = "Windows";
                iis.AutomaticAuthentication = false;
                iis.AllowSynchronousIO = true;
            });
            //services.Configure<RazorViewEngineOptions>(options =>
            //{
            //    //options.AreaViewLocationFormats.Clear();
            //    options.AreaViewLocationFormats.Add("/Admin/{2}/Views/{1}/{0}.cshtml");
            //    options.AreaViewLocationFormats.Add("/Admin/{2}/Views/Shared/{0}.cshtml");
            //    options.AreaViewLocationFormats.Add("/Admin/Views/Shared/{0}.cshtml");
            //    options.AreaViewLocationFormats.Add("/Admin/Views/_ViewStart.cshtml");
            //});
            //services.AddApiVersioning(options =>
            //{
            //    options.ReportApiVersions = true;//return versions in a response header
            //    options.DefaultApiVersion = new ApiVersion(1, 0);//default version select 
            //    options.AssumeDefaultVersionWhenUnspecified = true;//if not specifying an api version,show the default version
            //});
            services.AddMvc(options =>
            {
                
               // options.ModelBinderProviders.Insert(0, new JsonBinderProvider());
                // options.ModelBinderProviders.Insert(0, new CustomModelBinderProvider());
                //options.InputFormatters.Insert(0, new XDocumentInputFormatter());

            })
            //全局配置Json序列化处理 方案1
            .AddNewtonsoftJson(options =>
            {
                // options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                //忽略循环引用
                options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                //使用 AbC ab_c
                options.SerializerSettings.ContractResolver = JsonContractResolver.ObjectResolverJson;
                //设置时间格式
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            }
          )
          .AddXmlSerializerFormatters()
          .SetCompatibilityVersion(CompatibilityVersion.Latest);

            // uncomment, if you want to add an MVC-based UI
            services.AddControllersWithViews();
            services.AddRazorPages();
            //services.AddRazorPages(it=> {
            //    it.Conventions.AddAreaFolderApplicationModelConvention("admin", "/Areas/Admin/Views", page=> { 
                
            //    });
            //});
            //services.AddControllers();
            services.AddSwaggerGen(it => {
                it.SwaggerDoc("V1", new Microsoft.OpenApi.Models.OpenApiInfo() { Title = "IdentityServer", Version = "V1" });
            });
  

            string name = string.Empty;
            //https://www.cnblogs.com/jellydong/p/13542474.html 不然 http 登录不成功 
            // 配置cookie策略
            services.Configure<CookiePolicyOptions>(options =>
            {
                //https://docs.microsoft.com/zh-cn/aspnet/core/security/samesite?view=aspnetcore-3.1&viewFallbackFrom=aspnetcore-3
                options.MinimumSameSitePolicy = Microsoft.AspNetCore.Http.SameSiteMode.Lax;
            });

            services.AddDataProtection();
            string connectionString = string.Empty;
            //services.AddSingleton<IPersonalDataProtector, DefaultPersonalDataProtector>();
            //services.AddDbContext<TestDbContext>(it=> { 
            //    it.UseMySql("Database=IdentityServer;Data Source=localhost;User Id=root;Password=wjp930514.;Old Guids=True;charset=utf8;");
            //});//迁移 数据库 测试 
#if Db //无法创建表 语法错误 mysql sqlserver 基于 数据库 操作
#if Sqlite
            name = "SqliteConnectionString";
#elif MySql
            name = "MySqlConnectionString";
#elif SqlServer
            name = "SqlServerConnectionString";
#elif Oracle
            name = "OracleConnectionString";
#elif Postgre
            name = "PostgreConnectionString";
#endif
            connectionString = Configuration.GetConnectionString(name);
            
            var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;
            //var bulder = new DbContextOptionsBuilder<TestDbContext>();
            //bulder.UseOracle("DATA SOURCE=192.168.99.101:1521/orcl;USER ID=myuser;PASSWORD=123456;", it=>it.UseOracleSQLCompatibility("12"));
            //var test = new TestDbContext(bulder.Options);//error ORA-00972: 标识符过长 

            //try
            //{
            //    var oracleConnection = new Oracle.ManagedDataAccess.Client.OracleConnection("DATA SOURCE=192.168.99.101:1521/orcl;USER ID=myuser;PASSWORD=123456;");
            //    oracleConnection.Open();//pass
            //}
            //catch (Exception e)
            //{

            //}

            Func<DbContextOptionsBuilder, DbContextOptionsBuilder> func = GetFunc(connectionString,migrationsAssembly);
            // Add framework services.
            services.AddDbContext<ApplicationDbContext>(options => func(options));

            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            // < PackageReference Include = "AspNetCore.HealthChecks.MySql" Version = "3.1.1" />
            //< PackageReference Include = "AspNetCore.HealthChecks.SqlServer" Version = "3.1.1" />
            //services.AddHealthChecks()
            //.AddCheck("self", () => HealthCheckResult.Healthy())
            //.AddMySql(connectionString,
            //    name: "IdentityDB-check",
            //    tags: new string[] { "IdentityDB" });

            // Adds IdentityServer
            var builder = services.AddIdentityServer(options =>
            {
#if Sqlite
                options.Events.RaiseErrorEvents = true;
                options.Events.RaiseInformationEvents = true;
                options.Events.RaiseFailureEvents = true;
                options.Events.RaiseSuccessEvents = true;
                //options.EmitLegacyResourceAudienceClaim = "native.code";
                //options.ClientSecret = "secret";
                //options.ResponseType = "code";
                //admin
                options.UserInteraction = new UserInteractionOptions
                {
                    LogoutUrl = "/Account/Logout",
                    LoginUrl = "/Account/Login",
                    LoginReturnUrlParameter = "returnUrl"
                };
#endif
                options.IssuerUri = "null";
                options.Authentication.CookieLifetime = TimeSpan.FromHours(2);
            })
               .AddResourceOwnerValidator<ResourceOwnerPasswordValidator<ApplicationUser>>() 
              //.AddResourceOwnerValidator<ResourceOwnerPasswordValidator>()//test
            //.AddTestUsers(TestUsers.Users)//测试 接口 用他的模板 不然需要改变接口
            // .AddSigningCredential(Certificate.Get())
            .AddAspNetIdentity<ApplicationUser>()
            //oracle 列过长 需要用到
            .AddConfigurationStore<ConfigurationDbContextWrapper>(options =>
            {

                //services.AddSingleton<ConfigurationStoreOptions>(options);
                options.ConfigureDbContext = builder => func(builder);
            })
            .AddOperationalStore(options =>
            {
                //services.AddSingleton<OperationalStoreOptions>(options);
                options.ConfigureDbContext = builder => func(builder);
            });
            //services.AddSingleton<ConfigurationDbContextWrapper, ConfigurationDbContextWrapper>();
            //services.AddSingleton<PersistedGrantDbContextWrapper, PersistedGrantDbContextWrapper>();
#elif LocalInMemory //基于 内存 操作  
            var builder = services.AddIdentityServer();
#if V4
            builder.AddInMemoryApiScopes(Config.Scopes)//新版本 才有 必须存在
#endif
    //#elif V3 
                    .AddInMemoryApiResources(Config.Apis)//connect/introspect 此接口 才 可以 调通 必须存在
     //#endif
                .AddInMemoryIdentityResources(Config.Ids)
                .AddInMemoryClients(Config.Clients)
                .AddTestUsers(TestUsers.Users);

            services.AddAuthentication()
                  .AddCookie(options =>
                  {
                      options.Cookie.IsEssential = true;
                      options.Cookie.SameSite = SameSiteMode.None;
                  })
               .AddGoogle("Google", options =>
               {
                   options.SignInScheme = IdentityServerConstants.ExternalCookieAuthenticationScheme;

                   options.ClientId = "<insert here>";
                   options.ClientSecret = "<insert here>";
               })
               .AddOpenIdConnect("oidc", "Demo IdentityServer", options =>
               {
                   options.SignInScheme = IdentityServerConstants.ExternalCookieAuthenticationScheme;
                   options.SignOutScheme = IdentityServerConstants.SignoutScheme;
                   options.SaveTokens = true;

                   options.Authority = "https://demo.identityserver.io/";
                   options.ClientId = "native.code";
                   options.ClientSecret = "secret";
                   options.ResponseType = "code";

                   options.TokenValidationParameters = new TokenValidationParameters
                   {
                       NameClaimType = "name",
                       RoleClaimType = "role"
                   };
               });
#endif

            builder.AddDeveloperSigningCredential();

        }

        public void Configure(IApplicationBuilder app)
        {
            // this will do the initial DB population
#if !LocalInMemory
            SeedData.EnsureSeedData(app);
#endif
            app.UseDeveloperExceptionPage();

            // uncomment if you want to add MVC
            app.UseStaticFiles();
            app.UseRouting();
            app.UseCookiePolicy();
            //app.UseCors(it=> {
            //    it.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin();
            //});
            app.UseSession();
            app.UseApiVersioning();
            app.UseIdentityServer();
            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();
            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            //要在应用的根 (http://localhost:<port>/) 处提供 Swagger UI，请将 RoutePrefix 属性设置为空字符串
            app.UseSwaggerUI(c =>
            {
                ////要统一 SwaggerVersion
                c.SwaggerEndpoint("/swagger/V1/swagger.json", "IdentityServer");
                c.RoutePrefix = string.Empty;
            });
            // uncomment, if you want to add MVC-based
            app.UseAuthorization();
            //app.UseMvc(routes =>
            //{
            //    routes.MapRoute(
            //      name: "areas",
            //      template: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
            //    );
            //});
            // app.UseMvcWithDefaultRoute();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                   name: "mvc",
                   pattern: "{controller=Home}/{action=Index}/{id?}"
                 );
                endpoints.MapAreaControllerRoute(
                    name: "areas",
                    areaName: "admin",
                    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
                  );
             
                endpoints.MapDefaultControllerRoute();
            });
        }
    }
}