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
    public class ClientController : Controller
    {
        private ConfigurationDbContextWrapper configurationDbContextWrapper;
        public ClientController(ConfigurationDbContextWrapper configurationDbContextWrapper)
        {
            this.configurationDbContextWrapper = configurationDbContextWrapper;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            var data = this.configurationDbContextWrapper.Clients.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Secret()
        {
            var data = this.configurationDbContextWrapper.Set<ClientSecret>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Scope()
        {
            var data = this.configurationDbContextWrapper.Set<ClientScope>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult RedirectUri()
        {
            var data = this.configurationDbContextWrapper.Set<ClientRedirectUri>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult Property()
        {
            var data = this.configurationDbContextWrapper.Set<ClientProperty>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult PostLogoutRedirectUri()
        {
            var data = this.configurationDbContextWrapper.Set<ClientPostLogoutRedirectUri>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult IdPRestriction()
        {
            var data = this.configurationDbContextWrapper.Set<ClientIdPRestriction>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult GrantType()
        {
            var data = this.configurationDbContextWrapper.Set<ClientGrantType>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult CorsOrigin()
        {
            var data = this.configurationDbContextWrapper.ClientCorsOrigins.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }


        public IActionResult Claim()
        {
            var data = this.configurationDbContextWrapper.Set<ClientClaim>().AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }



    }
}
