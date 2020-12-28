using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;

namespace Utility.IdentityServer4.Service
{
    public interface ILoginService<T> where T:class
    {
        Task<bool> ValidateCredentials(T user, string password);

        Task<T> FindByUsername(string user);

        Task SignIn(T user);

        Task SignInAsync(T user, AuthenticationProperties properties, string authenticationMethod = null);
    }

  
}
