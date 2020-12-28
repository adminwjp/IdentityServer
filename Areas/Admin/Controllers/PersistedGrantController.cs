using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Utility.Extensions;
using Utility.IO;
using Utility.Json;
using Utility.Reflect;
using Utility.Utils;
using Z.EntityFramework.Plus;

namespace IdentityServer.Areas.Admin.Controllers
{
    /// <summary>
    /// 注意 IdentityServer 密码授权模式 登录 ,每次 登录 成功 会 生成 对应 的信息  
    /// 增 删 改 测试 用的
    /// </summary>
    [Area("Admin")]
    public class PersistedGrantController : Controller
    {
        private PersistedGrantDbContext persistedGrantDbContext;

        public PersistedGrantController(PersistedGrantDbContext persistedGrantDbContext)
        {
            this.persistedGrantDbContext = persistedGrantDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        
        public IActionResult Load()
        {
            var data = this.persistedGrantDbContext.PersistedGrants.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        [HttpPost]
        public IActionResult Add(PersistedGrant persistedGrant)
        {
           var form= HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if(item.Value.Count > 0&&!string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(persistedGrant, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}
            persistedGrant.Key = Guid.NewGuid().ToString();
            persistedGrant.CreationTime = DateTime.Now;
            var data = this.persistedGrantDbContext.PersistedGrants.Add(persistedGrant);
            this.persistedGrantDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }


        [HttpPost]
        public IActionResult Update(PersistedGrant persistedGrant)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if ( item.Value.Count>0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(persistedGrant, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}

            var entry = this.persistedGrantDbContext.Entry(persistedGrant);
            //entry.CurrentValues.SetValues(entity);
            //更新时可能出现异常 bug 
            entry.State = EntityState.Modified;
            //如果数据没有发生变化
            if (this.persistedGrantDbContext.ChangeTracker.HasChanges())
            {
                this.persistedGrantDbContext.SaveChanges();
                return new JsonResult(new { note = "success", status = true, code = 200 });
            }
            return new JsonResult(new { note = "fail", status = false, code = 400 });
        }


        [HttpPost]
        //form  not support  body
        public IActionResult Delete(string[] ids)
        {
            Expression<Func<PersistedGrant, bool>> where = null;
            foreach (var item in ids)
            {
                if (where == null)
                {
                    where = it => it.Key == item;
                }
                else
                {
                    where = where.Or(it => it.Key == item);
                }
            }
            var entry = this.persistedGrantDbContext.PersistedGrants.Where(where).Delete();
            this.persistedGrantDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }
    }
}
