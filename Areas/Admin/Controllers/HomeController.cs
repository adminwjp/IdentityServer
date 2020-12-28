using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("admin")]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Main()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Tree()
        {
           // return new JsonResult(ModuleView.ModuleViews);
            return new JsonResult(ModuleView.ModuleViews.GenerateTree(it => it.Id, it => it.ParentId));
        }

        [HttpGet]
        public IActionResult Toolbar(string code)
        {
            return new JsonResult(ModuleElement.Toolbars);
            
        }
    }
}
