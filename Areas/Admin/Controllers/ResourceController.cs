using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IdentityServer.Data;
using IdentityServer4.EntityFramework.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ResourceController : Controller
    {
        private ConfigurationDbContextWrapper configurationDbContext;

        public ResourceController(ConfigurationDbContextWrapper configurationDbContext)
        {
            this.configurationDbContext = configurationDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            var data = this.configurationDbContext.ApiResources.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Claim()
        {
            var data = this.configurationDbContext.Set<ApiResourceClaim>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Property()
        {
            var data = this.configurationDbContext.Set<ApiResourceProperty>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Scope()
        {
            var data = this.configurationDbContext.Set<ApiResourceScope>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Secret()
        {
            var data = this.configurationDbContext.Set<ApiResourceSecret>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

    }
}
