var Util = {
		//对应ServerResoponse成功返回的状态 
		SUCCESS : 0,
		//对应ServerResoponse失败返回的状态 
		ERROR : 1,
		//将datagrid被选中的行拼接成以","分割的字符串:1,2,3
		getSelectionsIds : function(datagridId){
			//getSelections none 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。 
			var selectedIds = $(datagridId).datagrid("getSelections");
			console.log(selectedIds);
			var ids = [];//[1,2,3]
			for(var i in selectedIds){
				ids.push(selectedIds[i].id);
			}
			ids = ids.join(",");// 1,2,3
			return ids;
		},
		// 格式化时间
		formatDateTime : function(val, row) {
			var now = new Date(val);
			return now.format("yyyy-MM-dd hh:mm:ss");
		},
		// 格式化连接
		formatUrl : function(val, row) {
			if (val) {
				return "<a href='" + val + "' target='_blank'>查看</a>";
			}
			return "";
		},
		
		// 在0-9的时间日期前面补0
		formatZero: function(n){
			 if(n>=0&&n<=9){
				 return "0"+n;
			 }else{
				 return n;
			 }
		 },
		
		 //获取当前时间并格式化
		getCurrentDateTime : function(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var day=date.getDate();
			var hours=date.getHours();
			var minutes=date.getMinutes();
			var seconds=date.getSeconds();
			
			return year+"-"+this.formatZero(month)+"-"+this.formatZero(day)+" "+this.formatZero(hours)+":"+this.formatZero(minutes)+":"+this.formatZero(seconds);
		},
		
		
}