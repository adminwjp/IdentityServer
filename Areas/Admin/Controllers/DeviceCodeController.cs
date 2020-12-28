using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Utility.Extensions;
using Utility.Reflect;
using Utility.Utils;
using Z.EntityFramework.Plus;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DeviceCodeController : Controller
    {
        private PersistedGrantDbContext persistedGrantDbContext;

        public DeviceCodeController(PersistedGrantDbContext persistedGrantDbContext)
        {
            this.persistedGrantDbContext = persistedGrantDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            // Unable to cast object of type 'System.DBNull' to type 'System.DateTime' 
            var data = this.persistedGrantDbContext.DeviceFlowCodes.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        [HttpPost]
        public IActionResult Add(DeviceFlowCodes device)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(device, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}
            device.UserCode = Guid.NewGuid().ToString();
            device.CreationTime = DateTime.Now;
            device.Expiration = DateTime.Now;//  // Unable to cast object of type 'System.DBNull' to type 'System.DateTime'  
            var data = this.persistedGrantDbContext.DeviceFlowCodes.Add(device);
            this.persistedGrantDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }


        [HttpPost]
        public IActionResult Update(DeviceFlowCodes device)
        {
            var form = HttpContext.Request.Form;
            if (form.Count > 0)
            {
                foreach (var item in form)
                {
                    var key = StringUtils.Parse(item.Key, StringFormat.InitialLetterLowerCaseUpper);
                    if (item.Value.Count > 0 && !string.IsNullOrEmpty(item.Value[0]))
                    {
                        ReflectHelper.SetValue(device, key, item.Value[0], true);
                    }
                }
            }
            //using (StreamReader sr = new StreamReader(HttpContext.Request.Body))
            //{
            //    string json = sr.ReadToEndAsync().Result;// StreamHelper.GetString(HttpContext.Request.Body);
            //    persistedGrant = JsonHelper.ToObject<PersistedGrant>(json, Startup.JsonSerializerSettings);
            //}

            var entry = this.persistedGrantDbContext.Entry(device);
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
            Expression<Func<DeviceFlowCodes, bool>> where = null;
            foreach (var item in ids)
            {
                if (where == null)
                {
                    where = it => it.UserCode == item;
                }
                else
                {
                    where = where.Or(it => it.UserCode == item);
                }
            }
            var entry = this.persistedGrantDbContext.DeviceFlowCodes.Where(where).Delete();
            this.persistedGrantDbContext.SaveChanges();
            return new JsonResult(new { note = "success", status = true, code = 200 });
        }

    }
}
