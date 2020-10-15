/**
 * 
 */
function showDialog(msg){
	$.alert({
		title: '提示',
		content: msg,
		theme: 'supervan'
	});
}
function deleteByPrimaryKey(url,param,pageNo){
	$.confirm({
	    title: '警告!',
	    content: '确认删除此信息么？',
		theme: 'supervan',
	    buttons: {
	    	ok: {
	            text: '确认',
	            action:function(){
	        		$.post(url, param,function(data){
	        			var json = eval(data);
	        			if(json.state == 200){
	        				showDialog("已删除！");
	        				$("#myFrame")[0].contentWindow.showUser(pageNo); 
	        				return;
	        			}
	        			else{
	        				showDialog(json.error);
	        				return;
	        			}
	        		},"json");
	            }
	        },
	        cancel:{
	            text: '取消'
	        }
	    }
	});
}
