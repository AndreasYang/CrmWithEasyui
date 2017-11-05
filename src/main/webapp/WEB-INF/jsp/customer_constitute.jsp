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
		$.post("${path}/customer/findCustomerConstitute.action",
				function(result){
			if(result.status == Util.SUCCESS){
				var xAxisData = new Array();
				var seriesData = new Array();
				var data = result.data;
				for(var i=0;i<data.length;i++){
					xAxisData.push(data[i].customerLevel);
					seriesData.push(data[i].levelCount);
				}
				console.log(xAxisData);
				myChart.setOption({
					title: {
		                text: '客户构成分析'
		            },
		            tooltip: {},
		            legend: {
		                data:['客户数量']
		            },
		            xAxis: {
		                data: xAxisData
		            },
		            yAxis: {},
		            series: [{
		                name: '客户数量',
		                type: 'bar',
		                data: seriesData
		            }]
				})
			}
		}		
		);
	});
</script>
</body>
</html>