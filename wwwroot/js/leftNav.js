function navBar(strData){
	var data;
	if(typeof(strData) == "string"){
		var data = JSON.parse(strData); //部分用户解析出来的是字符串，转换一下
	}else{
		data = strData;
	}	
	var ulHtml = '<ul class="layui-nav layui-nav-tree">';
	for(var i=0;i<data.length;i++){
		if(data[i].spread){
			ulHtml += '<li class="layui-nav-item layui-nav-itemed">';
		}else{
			ulHtml += '<li class="layui-nav-item">';
		}
		if(data[i].children != undefined && data[i].children.length > 0){
			ulHtml += '<a href="javascript:;">';
			if(data[i].item.icon_name != undefined && data[i].Item.IconName != ''){
				if (data[i].item.icon_name.indexOf("icon-") != -1){
					ulHtml += '<i class="iconfont ' + data[i].item.icon_name + '" data-icon="' + data[i].item.icon_name+'"></i>';
				}else{
					ulHtml += '<i class="layui-icon" data-icon="' + data[i].item.icon_name + '">' + data[i].item.icon_name+'</i>';
				}
			}
			ulHtml += '<cite>' + data[i].item.name+'</cite>';
			ulHtml += '<span class="layui-nav-more"></span>';
			ulHtml += '</a>';
			ulHtml += '<dl class="layui-nav-child">';
			for(var j=0;j<data[i].children.length;j++){
				if(data[i].children[j].target == "_blank"){
					ulHtml += '<dd><a href="javascript:;" data-url="'+data[i].children[j].item.url+'" target="'+data[i].children[j].target+'">';
				}else{
					ulHtml += '<dd><a href="javascript:;" data-url="'+data[i].children[j].item.url+'">';
				}
				if (data[i].children[j].item.icon_name != undefined && data[i].children[j].item.icon_name != ''){
					if (data[i].children[j].item.icon_name.indexOf("icon-") != -1){
						ulHtml += '<i class="iconfont ' + data[i].children[j].item.icon_name + '" data-icon="' + data[i].children[j].item.icon_name+'"></i>';
					}else{
						ulHtml += '<i class="layui-icon" data-icon="' + data[i].children[j].item.icon_name + '">' + data[i].children[j].item.icon_name+'</i>';
					}
				}
				ulHtml += '<cite>' + data[i].children[j].item.name+'</cite></a></dd>';
			}
			ulHtml += "</dl>";
		}else{
			if(data[i].target == "_blank"){
				ulHtml += '<a href="javascript:;" data-url="'+data[i].item.url+'" target="'+data[i].target+'">';
			}else{
				ulHtml += '<a href="javascript:;" data-url="' + data[i].item.url+'">';
			}
			if (data[i].item.icon_name != undefined && data[i].item.icon_name != ''){
				if (data[i].item.icon_name.indexOf("icon-") != -1){
					ulHtml += '<i class="iconfont ' + data[i].item.icon_name + '" data-icon="' + data[i].item.icon_name+'"></i>';
				}else{
					ulHtml += '<i class="layui-icon" data-icon="' + data[i].item.icon_name + '">' + data[i].item.icon_name+'</i>';
				}
			}
			ulHtml += '<cite>' + data[i].item.name+'</cite></a>';
		}
		ulHtml += '</li>';
	}
	ulHtml += '</ul>';
	return ulHtml;
}
