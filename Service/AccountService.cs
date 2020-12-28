////#define Identity4_0
//#define Identity3_0
//using Identity.Api.Models;
//using IdentityModel;
//using IdentityServer4;
//using IdentityServer4.Events;
//using IdentityServer4.Extensions;
//using IdentityServer4.Models;
//using IdentityServer4.Services;
//using IdentityServer4.Stores;
//using IdentityServer4.Test;
//using IdentityServerHost.Quickstart.UI;
//using Microsoft.AspNetCore.Authentication;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.ModelBinding;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Security.Claims;
//using System.Threading.Tasks;

//namespace Utility.IdentityServer4.Service
//{
//    public class IAccountService
//    {

//    }
//    public class InMemoryAccountService: IAccountService
//    {
//        public  TestUserStore Users { get; }
//        public  IIdentityServerInteractionService Interaction { get; }
//        public  IClientStore ClientStore { get; }
//        public  IAuthenticationSchemeProvider SchemeProvider { get; }
//        public  IEventService Events { get; }
//        public InMemoryAccountService(
//          IIdentityServerInteractionService interaction,
//          IClientStore clientStore,
//          IAuthenticationSchemeProvider schemeProvider,
//          IEventService events,
//          TestUserStore users = null)
//        {
//            // if the TestUserStore is not in DI, then we'll just use the global users collection
//            // this is where you would plug in your own custom identity management library (e.g. ASP.NET Identity)
//           this.Users = users ?? new TestUserStore(TestUsers.Users);

//            this.Interaction = interaction;
//            this.ClientStore = clientStore;
//            this.SchemeProvider = schemeProvider;
//            this.Events = events;
//        }
//        public ClaimsPrincipal User { get; set; }
//        public HttpContext HttpContext { get; set; }

//        /// <summary>
//        /// Handle logout page postback
//        /// </summary>
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public async Task<LoggedOutViewModel> Logout(LogoutInputModel model)
//        {
//            // build a model so the logged out page knows what to display
//            LoggedOutViewModel vm = await BuildLoggedOutViewModelAsync(model.LogoutId);

//            if (User?.Identity.IsAuthenticated == true)
//            {
//                // delete local authentication cookie
//                await HttpContext.SignOutAsync();

//                // raise the logout event
//                await Events.RaiseAsync(new UserLogoutSuccessEvent(User.GetSubjectId(), User.GetDisplayName()));
//            }

//            return vm;
//        }


//        /*****************************************/
//        /* helper APIs for the AccountController */
//        /*****************************************/
//        public async Task<LoginViewModel> BuildLoginViewModelAsync(string returnUrl)
//        {
//            var context = await Interaction.GetAuthorizationContextAsync(returnUrl);
//            if (context?.IdP != null && await SchemeProvider.GetSchemeAsync(context.IdP) != null)
//            {
//                var local = context.IdP == IdentityServer4.IdentityServerConstants.LocalIdentityProvider;

//                // this is meant to short circuit the UI and only trigger the one external IdP
//                var vm = new LoginViewModel
//                {
//                    EnableLocalLogin = local,
//                    ReturnUrl = returnUrl,
//                    Username = context?.LoginHint,
//                };

//                if (!local)
//                {
//                    vm.ExternalProviders = new[] { new ExternalProvider { AuthenticationScheme = context.IdP } };
//                }

//                return vm;
//            }

//            var schemes = await SchemeProvider.GetAllSchemesAsync();

//            var providers = schemes
//                .Where(x => x.DisplayName != null ||
//                            (x.Name.Equals(AccountOptions.WindowsAuthenticationSchemeName, StringComparison.OrdinalIgnoreCase))
//                )
//                .Select(x => new ExternalProvider
//                {
//                    DisplayName = x.DisplayName ?? x.Name,
//                    AuthenticationScheme = x.Name
//                }).ToList();

//            var allowLocal = true;
//#if Identity3_0
//            if (context.ClientId != null)
//            {
//                var client = await ClientStore.FindEnabledClientByIdAsync(context.ClientId);
//#else
//            if (context.Client?.ClientId != null)
//            {
//                var client = await ClientStore.FindEnabledClientByIdAsync(context.Client.ClientId);
//#endif
//                if (client != null)
//                {
//                    allowLocal = client.EnableLocalLogin;

//                    if (client.IdentityProviderRestrictions != null && client.IdentityProviderRestrictions.Any())
//                    {
//                        providers = providers.Where(provider => client.IdentityProviderRestrictions.Contains(provider.AuthenticationScheme)).ToList();
//                    }
//                }
//            }

//            return new LoginViewModel
//            {
//                AllowRememberLogin = AccountOptions.AllowRememberLogin,
//                EnableLocalLogin = allowLocal && AccountOptions.AllowLocalLogin,
//                ReturnUrl = returnUrl,
//                Username = context?.LoginHint,
//                ExternalProviders = providers.ToArray()
//            };
//        }

//        private async Task<LoginViewModel> BuildLoginViewModelAsync(LoginInputModel model)
//        {
//            var vm = await BuildLoginViewModelAsync(model.ReturnUrl);
//            vm.Username = model.Username;
//            vm.RememberLogin = model.RememberLogin;
//            return vm;
//        }

//        public async Task<LogoutViewModel> BuildLogoutViewModelAsync(string logoutId)
//        {
//            var vm = new LogoutViewModel { LogoutId = logoutId, ShowLogoutPrompt = AccountOptions.ShowLogoutPrompt };

//            if (User?.Identity.IsAuthenticated != true)
//            {
//                // if the user is not authenticated, then just show logged out page
//                vm.ShowLogoutPrompt = false;
//                return vm;
//            }

//            var context = await Interaction.GetLogoutContextAsync(logoutId);
//            if (context?.ShowSignoutPrompt == false)
//            {
//                // it's safe to automatically sign-out
//                vm.ShowLogoutPrompt = false;
//                return vm;
//            }

//            // show the logout prompt. this prevents attacks where the user
//            // is automatically signed out by another malicious web page.
//            return vm;
//        }

//        public async Task<LoggedOutViewModel> BuildLoggedOutViewModelAsync(string logoutId)
//        {
//            // get context information (client name, post logout redirect URI and iframe for federated signout)
//            var logout = await Interaction.GetLogoutContextAsync(logoutId);

//            var vm = new LoggedOutViewModel
//            {
//                AutomaticRedirectAfterSignOut = AccountOptions.AutomaticRedirectAfterSignOut,
//                PostLogoutRedirectUri = logout?.PostLogoutRedirectUri,
//                ClientName = string.IsNullOrEmpty(logout?.ClientName) ? logout?.ClientId : logout?.ClientName,
//                SignOutIframeUrl = logout?.SignOutIFrameUrl,
//                LogoutId = logoutId
//            };

//            if (User?.Identity.IsAuthenticated == true)
//            {
//                var idp = User.FindFirst(JwtClaimTypes.IdentityProvider)?.Value;
//                if (idp != null && idp != IdentityServerConstants.LocalIdentityProvider)
//                {
//                    var providerSupportsSignout = await HttpContext.GetSchemeSupportsSignOutAsync(idp);
//                    if (providerSupportsSignout)
//                    {
//                        if (vm.LogoutId == null)
//                        {
//                            // if there's no current logout context, we need to create one
//                            // this captures necessary info from the current logged in user
//                            // before we signout and redirect away to the external IdP for signout
//                            vm.LogoutId = await Interaction.CreateLogoutContextAsync();
//                        }

//                        vm.ExternalAuthenticationScheme = idp;
//                    }
//                }
//            }

//            return vm;
//        }
//    }
//}
