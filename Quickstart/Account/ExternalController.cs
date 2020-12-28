#define Identity4_0
//#define Identity3_0
using IdentityModel;
using IdentityServer.Models;
using IdentityServer4;
using IdentityServer4.Events;
using IdentityServer4.Services;
using IdentityServer4.Stores;
using IdentityServer4.Test;
using IdentityServerHost.Quickstart.UI;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using Utility.IdentityServer4.Service;
using Utility.Response;



namespace IdentityServerHost.Quickstart.UI
{
        [SecurityHeaders]
        [AllowAnonymous]
        public class ExternalController : Controller
        {
            private readonly IIdentityServerInteractionService interaction;
            private readonly ExternalInMemoryService userService;

            public ExternalController(IIdentityServerInteractionService interaction, ExternalInMemoryService userService)
            {
                this.interaction = interaction;
                this.userService = userService;
            }


            /// <summary>
            /// initiate roundtrip to external authentication provider
            /// </summary>
            [HttpGet]
            public IActionResult Challenge(string scheme, string returnUrl)
            {
                if (string.IsNullOrEmpty(returnUrl)) returnUrl = "~/";

                // validate returnUrl - either it is a valid OIDC URL or back to a local page
                if (Url.IsLocalUrl(returnUrl) == false && interaction.IsValidReturnUrl(returnUrl) == false)
                {
                    // user might have clicked on a malicious link - should be logged
                    throw new Exception("invalid return URL");
                }

                // start challenge and roundtrip the return URL and scheme 
                var props = new AuthenticationProperties
                {
                    RedirectUri = Url.Action(nameof(Callback)),
                    Items =
                {
                    { "returnUrl", returnUrl },
                    { "scheme", scheme },
                }
                };

                return Challenge(props, scheme);

            }

            /// <summary>
            /// Post processing of external authentication
            /// </summary>
            [HttpGet]
            public async Task<IActionResult> Callback()
            {
                userService.HttpContext = this.HttpContext;
                ResponseApi responseApi = await userService.Callback();
                if (responseApi.Success)
                {
                    if (responseApi.Data is RedirectViewModel redirect)
                    {
                        return this.LoadingPage("Redirect",redirect.RedirectUrl);
                    }
                    else
                    {
                        return Redirect(responseApi.Message);
                    }
                }
                else
                {
                    throw new Exception(responseApi.Message);
                }
            }
        }
}