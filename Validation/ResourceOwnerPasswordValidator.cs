using IdentityServer4.Models;
using IdentityServer4.Validation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentityServer.Validation
{
    /// <summary>
    ///  NotSupportedResourceOwnerPasswordValidator
    /// </summary>
    public class ResourceOwnerPasswordValidator : IResourceOwnerPasswordValidator
    {
        public Task ValidateAsync(ResourceOwnerPasswordValidationContext context)
        {
            //test
            context.Result = new GrantValidationResult("test", "test", GetUserClaim());
            return Task.CompletedTask;
        }
        public Claim[] GetUserClaim()
        {

            var claims = new Claim[] { new Claim("USERID", "test"), new Claim("USERNAME", "test") };
            return claims;
        }
    }
}
