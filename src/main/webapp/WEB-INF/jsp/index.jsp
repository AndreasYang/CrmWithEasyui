<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 70px">
		
	</div>
	<div data-options="region:'west'" title="West" style="width:15%;">
		<div class="easyui-accordion" data-optiopns="border:false,fit:true">
			<div title="学生管理" data-options="iconCls:'icon-user'">
				<a href="javascript:openTab('客户信息管理','customerManage.jsp','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 100%;">客户信息管理</a>
				<a href="javascript:openTab('客户流失管理','customerLossManage.jsp','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 100%;">客户流失管理</a>
			</div>
			<div title="服务管理" data-options="iconCls:'icon-sjzdlbgl'">
				<a href="javascript:openTab('服务创建','customerServiceCreate.jsp','icon-fwcj')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwcj'" style="width: 100%;">服务创建</a>
				<a href="javascript:openTab('服务分配','customerServiceAssign.jsp','icon-fwfp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwfp'" style="width: 100%;">服务分配</a>
				<a href="javascript:openTab('服务处理','customerServiceProce.jsp','icon-fwcl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwcl'" style="width: 100%;">服务处理</a>
				<a href="javascript:openTab('服务反馈','customerServiceFeedback.jsp','icon-fwfk')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwfk'" style="width: 100%;">服务反馈</a>
				<a href="javascript:openTab('服务归档','customerServiceFile.jsp','icon-fwgd')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwgd'" style="width: 100%;">服务归档</a>
			</div>
			<div title="统计报表" data-options="iconCls:'icon-lsdd'">
				<a href="javascript:openTab('客户贡献分析','khgxfx.jsp','icon-khgxfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgxfx'" style="width: 100%;">客户贡献分析</a>
				<a href="javascript:openTab('客户构成分析','khgcfx.jsp','icon-khgcfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgcfx'" style="width: 100%;">客户构成分析</a>
				<a href="javascript:openTab('客户服务分析','khfwfx.jsp','icon-khfwfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khfwfx'" style="width: 100%;">客户服务分析</a>
				<a href="javascript:openTab('客户流失分析','khlsfx.jsp','icon-khlsfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsfx'" style="width: 100%;">客户流失分析</a>
			</div>
			<div title="基础数据管理" data-options="iconCls:'icon-tjbb'">
				<a href="javascript:openTab('数据字典管理','dataDicManage.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 100%;">数据字典管理</a>
				<a href="javascript:openTab('产品信息查询','productSearch.jsp','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 100%;">产品信息查询</a>
				<a href="javascript:openTab('用户信息管理','${path}/user/index.action','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-user'" style="width: 100%;">用户信息管理</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-item'">
				<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 100%;">修改密码</a>
				<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 100%;">安全退出</a>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tabsId" class="easyui-tabs" data-options="fit:true">   
		    <div title="首页" data-optio="iconCls:icon-home">   
		        	首页    
		    </div>   
		</div>
	</div>
	<div data-options="region:'south'" style="height:15px;"></div>
	
</body>

<script type="text/javascript">
	function openTab(titleText,url,icon){
		//如果这个tab已经存在，切换到这个tab
		//exists which 表明指定的面板是否存在，'which'参数可以是选项卡面板的标题或索引。 
		if ($("#tabsId").tabs("exists",titleText)) {
			//select which 选择一个选项卡面板，'which'参数可以是选项卡面板的标题或者索引。 
			$("#tabsId").tabs("select",titleText);
		} else {
			//如果这个tab不存在，创建这个tab
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='"+url+"'></iframe>";
			$("#tabsId").tabs("add",{
				title:titleText,
				iconCls:icon,
				closable:true,
				content:content
			});
		}
		
	}
</script>
</html>