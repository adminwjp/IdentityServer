using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Infrastructure
{
    [Table("ModuleElement")]
    public partial class ModuleElement
    {
        public static List<ModuleElement> Toolbars = new List<ModuleElement>();
        static ModuleElement()
        {
            var toolbar = new ModuleElement()
            {
                DomId = "add",
                Name = "新增",
                Icon = "&#xe608;",
                Class= "layui-btn-normal",
            };
            Toolbars.Add(toolbar);

            toolbar = new ModuleElement()
            {
                DomId = "update",
                Name = "修改",
                Icon = "&#xe642;",
                Class = "layui-btn-normal",
            };
            Toolbars.Add(toolbar);

            toolbar = new ModuleElement()
            {
                DomId = "detail",
                Name = "详情",
                Icon = "&#xe770;",
                Class = "layui-btn-normal",
            };
            Toolbars.Add(toolbar);

            toolbar = new ModuleElement()
            {
                DomId = "delete",
                Name = "删除",
                Icon = "&#xe640;",
                Class = "layui-btn-normal",
            };
            Toolbars.Add(toolbar);

            toolbar = new ModuleElement()
            {
                DomId = "refresh",
                Name = "刷新",
                Icon = "&#xe669;",
                Class = "layui-btn-normal",
            };
            Toolbars.Add(toolbar);

            toolbar = new ModuleElement()
            {
                DomId = "reset",
                Name = "重置",
                Icon = "&#xe673;",
                Class = "layui-btn-normal",
            };
            Toolbars.Add(toolbar);
        }
        public ModuleElement()
        {
            this.DomId = string.Empty;
            this.Name = string.Empty;
            this.Attr = string.Empty;
            this.Script = string.Empty;
            this.Icon = string.Empty;
            this.Class = string.Empty;
            this.Remark = string.Empty;
            this.Sort = 0;
            this.ModuleId = string.Empty;
            this.TypeName = string.Empty;
            this.TypeId = string.Empty;
        }
        public string DomId { get; set; }
        public string Name { get; set; }
        public string Attr { get; set; }
        public string Script { get; set; }
        public string Icon { get; set; }
        public string Class { get; set; }
        public string Remark { get; set; }
        public int Sort { get; set; }
        public string ModuleId { get; set; }
        public string TypeName { get; set; }
        public string TypeId { get; set; }
    }
}
