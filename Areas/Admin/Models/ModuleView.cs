using System;
using System.Collections.Generic;

namespace Infrastructure
{
    public class ModuleView
    {

        public static List<ModuleView> ModuleViews = new List<ModuleView>();

        static ModuleView()
        {
            int code = 100;
            var parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "用户管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/User/Index",
               // ParentId = string.Empty,
                ParentName = string.Empty
            };
           // parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "客户端管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/Client/Index",
                //ParentId = string.Empty,
                ParentName = string.Empty
            };
           // parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "设备验证码管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/DeviceCode/Index",
               // ParentId = string.Empty,
                ParentName = string.Empty
            };
           // parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "认证资源管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/IdentityResource/Index",
                //ParentId = string.Empty,
                ParentName = string.Empty
            };
            //parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "授权管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/PersistedGrant/Index",
                //ParentId = string.Empty,
                ParentName = string.Empty
            };
            //parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "资源管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/Resource/Index",
               // ParentId = string.Empty,
                ParentName = string.Empty
            };
            //parent.ParentId = parent.Id;
            ModuleViews.Add(parent);

            parent = new ModuleView()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "作用域管理",
                Code = (++code).ToString(),
                IconName = string.Empty,
                Url = "/Admin/Scope/Index",
               // ParentId = string.Empty,
                ParentName = string.Empty
            };
            //parent.ParentId = parent.Id;
            ModuleViews.Add(parent);


         

        }
        /// <summary>
        /// ID
        /// </summary>
        /// <returns></returns>
        public string Id { get; set; }

        /// <summary>
	    /// 节点语义ID
	    /// </summary>
        public string CascadeId { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        /// <returns></returns>
        public string Name { get; set; }

        /// <summary>
        /// 主页面URL
        /// </summary>
        /// <returns></returns>
        public string Url { get; set; }

        /// <summary>
        /// 父节点流水号
        /// </summary>
        /// <returns></returns>
        public string ParentId { get; set; }

        /// <summary>
        /// 父节点流水号
        /// </summary>
        /// <returns></returns>
        public string ParentName { get; set; }

        /// <summary>
        /// 节点图标文件名称
        /// </summary>
        /// <returns></returns>
        public string IconName { get; set; }


        public bool Checked { get; set; }

        /// <summary>
        /// 排序号
        /// </summary>
        public int SortNo { get; set; }

        public string Code { get; set; }

    }
}