using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IdentityServer.Data;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class IdentityResourceController : Controller
    {
        private ConfigurationDbContextWrapper configurationDbContext;

        public IdentityResourceController(ConfigurationDbContextWrapper configurationDbContext)
        {
            this.configurationDbContext = configurationDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            var data = this.configurationDbContext.IdentityResources.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Claim()
        {
            var data = this.configurationDbContext.Set<IdentityResourceClaim>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Property()
        {
            var data = this.configurationDbContext.Set<IdentityResourceProperty>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

      

    }
}
