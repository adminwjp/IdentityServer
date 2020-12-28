using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using IdentityServer.Data;
using IdentityServer4.EntityFramework.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Writers;
using Utility.Extensions;
using Utility.Reflect;
using Utility.Utils;
using Z.EntityFramework.Plus;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ScopeController : Controller
    {
        private ConfigurationDbContextWrapper configurationDbContext;

        public ScopeController(ConfigurationDbContextWrapper configurationDbContext)
        {
            this.configurationDbContext = configurationDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            var data = this.configurationDbContext.ApiScopes.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }


        public IActionResult Scope()
        {
            var data = this.configurationDbContext.ApiScopes.AsNoTracking().Select(it=>new { it.Id,it.Name}).ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Claim()
        {
            var data = this.configurationDbContext.Set<ApiScopeClaim>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Property()
        {
            var data = this.configurationDbContext.Set<ApiScopeProperty>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        [HttpPost]
        public IActionResult Add(ApiScope scope)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scope, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}
            var data = this.configurationDbContext.ApiScopes.Add(scope);
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }


        [HttpPost]
        public IActionResult Update(ApiScope scope)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scope, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}

            var entry = this.configurationDbContext.Entry(scope);
            //entry.CurrentValues.SetValues(entity);
            //更新时可能出现异常 bug 
            entry.State = EntityState.Modified;
            //如果数据没有发生变化
            if (this.configurationDbContext.ChangeTracker.HasChanges())
            {
                this.configurationDbContext.SaveChanges();
                return new JsonResult(new { note = "success", status = true, code = 200 });
            }
            return new JsonResult(new { note = "fail", status = false, code = 400 });
        }


        [HttpPost]
        //form  not support  body
        public IActionResult Delete(int[] ids)
        {
            Expression<Func<ApiScope, bool>> where = null;
            foreach (var item in ids)
            {
                if (where == null)
                {
                    where = it => it.Id == item;
                }
                else
                {
                    where = where.Or(it => it.Id == item);
                }
            }
            var entry = this.configurationDbContext.ApiScopes.Where(where).Delete();
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }

        [HttpPost]
        public IActionResult AddClaim(ApiScopeClaim scopeClaim)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scopeClaim, key, item.Value[0], true);
                    }
                }
            }
            var data = this.configurationDbContext.Set<ApiScopeClaim>().Add(scopeClaim);
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }


        [HttpPost]
        public IActionResult UpdateClaim(ApiScopeClaim scopeClaim)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scopeClaim, key, item.Value[0], true);
                    }
                }
            }
            var entry = this.configurationDbContext.Entry(scopeClaim);
            //entry.CurrentValues.SetValues(entity);
            //更新时可能出现异常 bug 
            entry.State = EntityState.Modified;
            //如果数据没有发生变化
            if (this.configurationDbContext.ChangeTracker.HasChanges())
            {
                this.configurationDbContext.SaveChanges();
                return new JsonResult(new { note = "success", status = true, code = 200 });
            }
            return new JsonResult(new { note = "fail", status = false, code = 400 });
        }


        [HttpPost]
        //form  not support  body
        public IActionResult DeleteClaim(int[] ids)
        {
            Expression<Func<ApiScopeClaim, bool>> where = null;
            foreach (var item in ids)
            {
                if (where == null)
                {
                    where = it => it.Id == item;
                }
                else
                {
                    where = where.Or(it => it.Id == item);
                }
            }
            var entry = this.configurationDbContext.Set<ApiScopeClaim>().Where(where).Delete();
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }

        [HttpPost]
        public IActionResult AddProperty(ApiScopeProperty scopeProperty)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scopeProperty, key, item.Value[0], true);
                    }
                }
            }
            var data = this.configurationDbContext.Set<ApiScopeProperty>().Add(scopeProperty);
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }


        [HttpPost]
        public IActionResult UpdateProperty(ApiScopeProperty scopeProperty)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(scopeProperty, key, item.Value[0], true);
                    }
                }
            }
            var entry = this.configurationDbContext.Entry(scopeProperty);
            //entry.CurrentValues.SetValues(entity);
            //更新时可能出现异常 bug 
            entry.State = EntityState.Modified;
            //如果数据没有发生变化
            if (this.configurationDbContext.ChangeTracker.HasChanges())
            {
                this.configurationDbContext.SaveChanges();
                return new JsonResult(new { note = "success", status = true, code = 200 });
            }
            return new JsonResult(new { note = "fail", status = false, code = 400 });
        }


        [HttpPost]
        //form  not support  body
        public IActionResult DeleteProperty(int[] ids)
        {
            Expression<Func<ApiScopeProperty, bool>> where = null;
            foreach (var item in ids)
            {
                if (where == null)
                {
                    where = it => it.Id == item;
                }
                else
                {
                    where = where.Or(it => it.Id == item);
                }
            }
            var entry = this.configurationDbContext.Set<ApiScopeProperty>().Where(where).Delete();
            this.configurationDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }

    }
}
