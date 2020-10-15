function selectByPrimaryKey(url,param){
	$.ajaxSettings.async = false; //关闭异步
	var result;
	$.post(url,param,function(data){
		var json = eval(data);
		if(json.state==500){
			result = null;
		} else if(json.state==200){
			result = json.data;
		}
	},"json");
	$.ajaxSettings.async = true; //打开异步
	return result;
}
function selectAll(url){
	$.ajaxSettings.async = false; //关闭异步
	var result;
	$.post(url,function(data){
		var json = eval(data);
		if(json.state==500){
			result = null;
		} else if(json.state==200){
			result = json.data;
		}
	},"json");
	$.ajaxSettings.async = true; //打开异步
	return result;
}
