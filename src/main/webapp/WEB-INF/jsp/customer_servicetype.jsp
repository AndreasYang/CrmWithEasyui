<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="${path}/resources/thirdlib/echarts/echarts.js"></script>
<script src="${path}/resources/thirdlib/echarts/echarts.min.js"></script>

</head>
<body>
<div id="main" style="width: 1000px;height:600px;"></div>
<script type="text/javascript">
	$(function(){
		var myChart = echarts.init(document.getElementById('main'));
		$.post("${path}/customer/findCustomerServiceType.action",
				function(result){
			if(result.status == Util.SUCCESS){
				var array = [];
				var sdata = result.data;
				for(var i=0;i<sdata.length;i++){
					var map ={};
					map.value = sdata[i].typeCount;
					map.name = sdata[i].serviceType;
					array[i]=map;
				}
				
				myChart.setOption({
					title : {
						text: '客户服务分析',
						x:'center'
					  },
					tooltip : {
						trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					legend:{
					    orient: 'vertical',
				        left: 'left',
			            data: array
				           },
				  	series:[{
		                name:'服务类型',
		                type:'pie',
		                radius:'55%',
		                data:array
			            }]
				})
			}
		}		
		);
	});
</script>
</body>
</html>