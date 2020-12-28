using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Mappers;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utility;
using Utility.Domain.Uow;

namespace Utility.IdentityServer4.Service
{
    public class EfConfigService
    {       
        // ConfigurationDbContext _configurationDbContext;
        private readonly IUnitWork _unitWork; 
        public EfConfigService(IEnumerable<IUnitWork> unitWorks)
        {
            this._unitWork = unitWorks.ToArray()[1];
        }


        //定义能够访问上述 API 的客户端
        public void AddClient(Client client)
        {
            client.AllowedGrantTypes = GrantTypes.ClientCredentials;
            this._unitWork.Insert(client.ToEntity());
        }

        //范围（Scopes）用来定义系统中你想要保护的资源，比如 API
        public void AddResource(ApiResource resource)
        {
            this._unitWork.Insert(resource.ToEntity());
        }
    }
}
