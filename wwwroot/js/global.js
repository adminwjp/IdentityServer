    //监听表格内部按钮
//toolbar 2.5.3, 2.4.5 ; tool 2.3.0
var version = "2.3.0";
function initial(options) {
    layui.config({
        base: "/js/"
    }).use(['table', 'form', 'element', 'jquery', 'utils', 'vue'], function () {
        var $ = layui.jquery,
            form = layui.form;
        options.init && options.init.call(this,$);
        $("#menus").loadMenus(options.menuName);
        var table = layui.table;

        function initTable(tab) {
            var tableOptions = $.extend({
                id: tab.options && tab.options.id||'maingrid',
                elem: tab.options && tab.options.elem || '#maingrid', // 指定原始表格元素选择器（推荐id选择器）
                height: 'full-80', // 容器高度
                request: {
                    pageName: 'page', // 页码的参数名称，默认：page
                    limitName: 'limit' // 每页数据量的参数名，默认：limit
                },
                response: {
                    countName: 'count', // 数据总数的字段名称，默认：count
                    dataName: 'data', // 数据列表的字段名称，默认：data
                    msgName: "note",
                    statusCode: 200 //规定成功的状态码，默认：0
                },
                url: '',
                limit: 20,//分页初始化大小
                limits:  [10, 20, 30, 40, 50, 60, 70, 80, 90],  //分页数组，默认[10,20,30,40,50,60,70,80,90]
                cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                    layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                    //curr: 5, //设定初始在第 5 页
                    groups: 1, //只显示 1 个连续页码
                    first: false, //不显示首页
                    last: false //不显示尾页

                },
                //page: true,
                done: function (res) {

                }
            }, tab.options);
            if (tab.reload) {
                tab.table = table.reload(options.id, tableOptions);
                console.log("reload exec");
                console.log(tab);
            }
            else {
                tab.table = table.render(tableOptions);
                console.log("render exec");
                console.log(tab);
                tab.reload = true;
            }
        }

        var tableReload;
        var tabType;
        if (options.tabs) {
            //多表格即 多 选项卡
            for (var tab in options.tabs) {
                //注意 这里获取的是 属性 名称 而不是 对象 数组 话 就是 索引 
                console.log("bind tab" + tab);
                options.tabs[tab].initial = function (tab) {
                    initTable(tab);
                    //这 只能放 里面 不然没反应 前提必须渲染
                    toolListener(tab.options.id);
                    sortListener(tab.options.id);
                    //initTable(options.tabs[tab]);//逻辑不对 作用域 改变 了 ? options.tabs[tab] 执行的是最后一个 注意
                };//();
               
            }
        } else {
            tableReload = table.reload(options.id, {
                url: options.url,
                where: {},
                response: {
                    countName: 'count', // 数据总数的字段名称，默认：count
                    dataName: 'data', // 数据列表的字段名称，默认：data
                    msgName: "note",
                    statusCode: 200 //规定成功的状态码，默认：0
                },
            });//单 表格
            toolListener(options.id);
            sortListener(options.id);
        }

        if (options.many) {
            $("body").on("click", "." + options.tabName + " li", function () {
                var type = $(this).data('type');
                tabType =type;
                console.log(tabType);
                if (options.tabs[tabType]) {
                    if (options.tabs[tabType] && options.tabs[tabType].initial) {
                        if (options.tabs[tabType].table) {
                            console.log("reload");
                            options.tabs[tabType].table.reload(options.id, {});
                        } else {
                            console.log("render");
                            options.tabs[tabType].initial.call(this, options.tabs[tabType]);
                        }
                    }
                    tableReload = options.tabs[tabType].table;
                    console.log(options.tabs[tabType]);
                    console.log(tableReload);
                    //更新对应的选项卡 默认地址 
                    options.add = options.tabs[tabType].add;
                    options.update = options.tabs[tabType].update;
                    options.delete = options.tabs[tabType].delete;
                    options.id = tabType; //监听工具条;
                    options.key = options.tabs[tabType].key; //监听工具条;
                    options.form = options.tabs[tabType].form;
                    options.formId = options.tabs[tabType].formId;
                }
            });
            // options.tabs&&options.tabs[0].initial();//tab 选项 导致 页面没渲染出来 ? reload render 渲染不出来 点击后才会 出现
            $("." + options.tabName + " li:eq(0)").trigger("click");//手动触发
        }

        function toolListener(id) {
            //监听表格内部按钮
            //toolbar 2.5.3 tool 2.3.0
            // 监听工具条
            var t = 'tool(' + id + ')';
            if (version == '2.5.3') {
                t = 'toolbar(' + id + ')';
            }
            table.on(t, function (obj) {
                // console.log(obj);
                options.toolbarEvent && options.toolbarEvent[obj.event] ?
                    options.toolbarEvent[obj.event].call(this, obj.data) : "";
                //switch (obj.event) {
                //    case 'detail':
                //        layer.msg('查看');
                //        break;
                //    case 'delete':
                //        layer.msg('删除');
                //        break;
                //    case 'update':
                //        layer.msg('编辑');
                //        break;
                //};
            });
        }

        function sortListener(id) {
            //监听排序事件
            var t = 'sort(' + id + ')';
            if (version == '2.5.3') {
                t = 'sort(' + id + ')';
            }
            table.on(t, function (obj) { //注：sort 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                console.log(obj.field); //当前排序的字段名
                console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
                console.log(this); //当前排序的 th 对象
                var config = $.extend(options.config || {},
                    {
                        //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                        field: obj.field, //排序字段
                        order: obj.type //排序方式
                    });
                //尽管我们的 table 自带排序功能，但并没有请求服务端。
                //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
                table.reload(id, {
                    initSort: obj, //记录初始排序，如果不设的话，将无法标记表头的排序状态。
                    where: config
                });
                layer.msg('服务端排序。order by ' + obj.field + ' ' + obj.type);
            });
        }
       
       
        //添加（编辑、详情）对话框
        var editDlg = function () {
            if (!(($(options.form || '#formEdit')) || ($(options.formId || '#divEdit')))) {
                layer.msg('警告,表单元素未找到!', { icon: 1, time: 1000 });//重复操作 累  不实现 
                return;
            }
            var vm = new Vue({
                el: options.form || "#formEdit"
            });
            var flag = 1;  //是否为更新 1 添加 2  编辑 3 详情
            var show = function (data) {
                var title = flag == 2 ? "编辑信息" : flag == 1 ? "添加" : "详情";
                var layerClose = false;
                layer.open({
                    title: title,
                    area: ["500px", "400px"],
                    type: 1,
                    content: $(options.formId || '#divEdit'),
                    success: function () {
                        console.log(flag);
                        if (flag == 3) {
                            console.log($(options.form || '#formEdit'));
                            $(options.form || '#formEdit').attr("disabled", "disabled");//怎么禁用了
                        } else {
                            $(options.form || '#formEdit').remove("disabled", "");
                        }
                        vm.$set('$data', data);//成功赋值
                        options.initForm && options.initForm($, data);
                        form.render();
                    },
                    end: function () {
                        //tableReload.reload(options.id, {});//放在 当前 页 话 就 出现 重新刷新 隐藏 layui dialog
                    }
                });
                var url = options.add;
                if (flag == 2) {
                    url = options.update; //暂时和添加一个地址
                }
                if (flag != 3) {
                    //提交数据
                    form.on('submit(formSubmit)',
                        function (data) {
                            $.post(url,
                                data.field,
                                function (data) {
                                    layer.msg(data.note);
                                    if (data.status) {
                                        tableReload.reload(options.id, {});
                                        //var index = parent.layer.getFrameIndex(window.name);
                                        //parent.layer.close(index);
                                        var index = layer.getFrameIndex(window.name);
                                        layer.close(index);
                                        //layer.close();//操作成功 怎么关闭 了
                                    }
                                },
                                "json");
                            return false;
                        });
                }
            }
            return {
                add: function () { //弹出添加
                    flag = 1;
                    var obj = {};
                    obj[options.key] = "";
                    show(obj);
                },
                update: function (data) { //弹出编辑框
                    flag = 2;
                    show(data);
                },
                detail: function (data) { //弹出详情框
                    flag = 3;
                    layer.msg('警告,查看详情表单禁用失效!', { icon: 1, time: 1000 });
                    show(data);
                }
            };
        }();

        function deleteData(data) {
           // console.log(data);
            var ids;
            if (data instanceof Array) {
                ids = data;
            } else {
                ids = [data];
            }
            $.post(options.delete,
                { ids: ids },
                function (data) {
                    layer.msg(data.note);
                    if (data.status) {
                        tableReload.reload(options.id, {});
                    }
                }, "json");
        }
        if (!options.toolbarEvent) {
            options.toolbarEvent = {
                detail: editDlg.detail,
                update: editDlg.update,
                delete: function (data) {
                    //console.log(data);
                    deleteData(data[options.key]);
                }
            };
        }
        if (!options.toolListEvent) {
            options.toolListEvent = {
                detail: function () {
                    var checkStatus = table.checkStatus(options.id)
                        , data = checkStatus.data;
                    if (data.length == 1) {
                        editDlg.detail && editDlg.detail(data[0]);
                    } else {
                        layer.msg("只能选中一行进行查看详情!", { icon: 1, time: 1000 });
                    }
                },
                update: function () {
                    var checkStatus = table.checkStatus(options.id)
                        , data = checkStatus.data;
                    if (data.length == 1) {
                        editDlg.update && editDlg.update(data[0]);
                    } else {
                        layer.msg("只能选中一行进行编辑!", { icon: 1, time: 1000 });
                    }
                },
                add: editDlg.add,
                delete: function () {
                    var checkStatus = table.checkStatus(options.id)
                        , data = checkStatus.data;
                    if (data.length > 0) {
                        var ids = data.map(function (it) {
                            return it[options.key];
                        });
                        deleteData(ids);
                    } else {
                        layer.msg("没有选中行进行删除!", { icon: 1, time: 1000 });
                    }

                },
                refresh: function () {
                    tableReload.reload(options.id, {}); 
                },
                reset: function () {
                    tableReload.reload(options.id, {});

                }
            };
        }
        //监听头工具栏事件
        $('.toolList .layui-btn').on('click', function () {
            var type = $(this).data('type');
            //console.log(options.toolListEvent);
            options.toolListEvent && options.toolListEvent[type] ?
                options.toolListEvent[type].call(this) : "";
            //switch (type) {
            //    case 'detail':
            //        layer.msg('查看');
            //        break;
            //    case 'delete':
            //        layer.msg('删除');
            //        break;
            //    case 'update':
            //        layer.msg('编辑');
            //        break;
            //    case 'add':
            //        layer.msg('添加');
            //        break;
            //    case 'refresh':
            //        layer.msg('刷新');
            //        break;
            //    case 'reset':
            //        layer.msg('重置');
            //        break;
            //};
        });

        //监听单元格编辑
        table.on('edit(' + options.id + ')', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
        });

    });
}