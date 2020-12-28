using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IdentityServer.Data;
using IdentityServer.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;

namespace IdentityServer.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UserController : Controller
    {
        private ApplicationDbContext applicationDbContext;

        public UserController(ApplicationDbContext applicationDbContext)
        {
            this.applicationDbContext = applicationDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Load()
        {
            // NotImplementedException: The method or operation is not implemented.
            //var data = this.applicationDbContext.Users.LeftJoin
            var data = this.applicationDbContext.Users.AsNoTracking().GroupJoin
                (this.applicationDbContext.UserRoles.AsNoTracking(), it => it.Id, it => it.UserId,
                (user, userRole) => new { User = user, UserRole = userRole }
                )
                .SelectMany(it => it.UserRole.DefaultIfEmpty(), (user, userRole) => new { user.User, UserRole = userRole }) //GroupJoin
                .ToList();
            List<ApplicationUser> applicationUsers = new List<ApplicationUser>();
            if (data.Any())
            {
                foreach (var item in data)
                {
                    item.User.RoleId = item.UserRole?.RoleId;
                    applicationUsers.Add(item.User);
                }
            }
            return new JsonResult(new { note = "success", status = true, code = 200, data=applicationUsers, count = applicationUsers == null ? 0 : applicationUsers.Count });
        }

        public IActionResult Role()
        {
            var data = this.applicationDbContext.Roles.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult RoleClaim()
        {
            var data = this.applicationDbContext.RoleClaims.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult UserClaim()
        {
            var data = this.applicationDbContext.UserClaims.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult UserLogin()
        {
            var data = this.applicationDbContext.UserLogins.AsNoTracking().ToList();
            return new JsonResult(new { note = "success", status = true, code = 200, data, count = data == null ? 0 : data.Count });
        }

        public IActionResult UserToken()
        {
            //MySqlException: Table 'IdentityServer.AspNetUserTokens' doesn't exist
            var data = this.applicationDbContext.UserTokens.AsNoTracking().ToList();
            return new JsonResult(new { note="success",status=true,code=200, data,count=data==null?0: data.Count });
        }

    }
}
