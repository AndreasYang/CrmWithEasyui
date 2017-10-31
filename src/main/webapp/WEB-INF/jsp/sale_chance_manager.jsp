<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		/* 数据表格datagrid */
		$("#datagrid").datagrid({
			url:'${path}/saleChance/findAll.action',
			method:'get',
			fit:true,
			singleSelect:false,
			toolbar:'#toolbar',
			pagination:true,
			rownumbers:true,
			fitColumns:true,
			columns:[[
			         {field:'cb',checkbox:true,align:'center'},    
				     {field:'id',title:'编号',width:80,align:'center'},    
				     {field:'chanceSource',title:'机会来源',width:100,align:'center'},    
				     {field:'customerName',title:'客户名称',width:80,align:'center'},
				     {field:'successRate',title:'成功几率',width:80,align:'center'},
				     {field:'overview',title:'概要',width:100,align:'center'},
				     {field:'linkMan',title:'联系人',width:80,align:'center'},
				     {field:'linkPhone',title:'联系电话',width:100,align:'center'},
				     {field:'description',title:'机会描述',width:80,align:'center'},
				     {field:'createMan',title:'创建人',width:80,align:'center'},
				     {field:'createTime',title:'创建时间',width:100,align:'center'},
				     {field:'assignMan',title:'指派人',width:80,align:'center'},
				     {field:'assignTime',title:'指派时间',width:100,align:'center'},
				     {field:'status',title:'分配状态',width:80,align:'center',formatter:function(value,row,index){
				    	 	if(value==1){
				    	 		return "已分配";
				    	 	}else{
				    	 		return "未分配";
				    	 	}
				     }},
				     {field:'devResult',title:'客户开发状态',width:80,align:'center',formatter:function(value,row,index){
				    	 	if(value==0){
				    	 		return "未开发";
				    	 	}if(value==1){
				    	 		return "开发中";
				    	 	}if(value==2){
				    	 		return "开发成功";
				    	 	}else{
				    	 		return "开发失败";
				    	 	}
				     }},
				]]
		});
		
		/* 添加、修改的dialog弹窗 */
		$("#dialog").dialog({
			closed:true,
			buttons:[
						{
							text:'保存',
							iconCls:'icon-ok',
							handler:function(){
								doSave();
							}
						},
						{
							text:'关闭',
							iconCls:'icon-cancel',
							handler:function(){
								$("#dialog").dialog("close");
							}
						}
						
					]
		});
	});
	
	
	/* 删除 */
	function doDelete(){
		var ids = Util.getSelectionsIds("#datagrid");
		if (ids.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据");
			return;
		}
		$.messager.confirm("系统提示", "您确认要删除么", function(r){
			if (r){
				$.post(
					"${path}/dataDic/delete.action",
					{ids:ids}, 
					function(result) {
						$.messager.alert("系统提示", result.msg);
						if(result.status == Util.SUCCESS) {
							$("#datagrid").datagrid("reload");
						}
					},
					"json"
				);
			}
		})
	}
	
	/* 查找 */
	function doSearch(){
		$("#datagrid").datagrid("load",{
			'customerName':$("#scustomerName").val(),
			'overview':$("#soverview").val(),
			'createMan':$("#screateMan").val(),
			'status':$("#sstatus").val(),
		})
	}

	var url;
	/* 打开添加dialog */
	function openAddDialog() {
		$("#dialog").dialog("open").dialog("setTitle","添加信息");
		url = "${path}/saleChance/add.action";
		$('#form').form("clear");
		
	}
	
	function closeDialog(){
		 $("#dialog").dialog("close");
	}
	
	/* 打开修改dialog */
	function openUpdateDialog() {
		var selections = $("#datagrid").datagrid("getSelections");
		if(selections.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据");
			return;
		}
		var row = selections[0];
		$("#dialog").dialog("open").dialog("setTitle","修改信息");
		url = "${path}/saleChance/update.action";
		$('#form').form("load", row);
	}
	
	function doSave(){
		$('#form').form('submit', {    
		    url:url,    
		    onSubmit: function(){    
			        return $(this).form("validate");
		    },    
		    success:function(data){//正常返回ServerResponse
		    	var data = eval('(' + data + ')');
		    	if(data.status == Util.SUCCESS) {
		    		$.messager.alert("系统提示", data.msg);
		    		$("#dialog").dialog("close");
		    		$("#datagrid").datagrid("reload");
		    	}
		    }    
		});  
	}
</script>

</head>
<body>
	<table id="datagrid"></table>
	
	<!-- 表格按钮 -->
	<div id="toolbar">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" iconCls="icon-edit">修改</a>
			<a href="javascript:doDelete()" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		</div>
		<!-- 搜索 -->
		<div>
			客户名称：<input class="easyui-textbox" id="scustomerName"/>
			概要：<input class="easyui-textbox" id="soverview">
			创建人：<input class="easyui-textbox" id="screateMan">
			创建时间：<input class="easyui-datetimebox" id="screateTime" style="width:200px">
			分配状态：<select class="easyui-combobox" id="sstatus" style="width:80px">
							<option></option>
							<option value="0">未分配</option>
							<option value="1">已分配</option>
						</select>
			<a href="javascript:doSearch();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<!-- 弹窗 -->
	<div id="dialog" class="easyui-dialog" style="width:700px;padding: 10px 20px">
		<form action="" id="form" method="post">
			<input type="hidden" id="id" name="id"/>
			<input type="hidden" id="status" name="status" value="0"/>
			<table cellspacing="8px">
				<tr>
					<td>客户名称：</td>
					<td><input class="easyui-textbox" id="customerName" name="customerName" class="easyui-combobox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>机会来源：</td>
					<td><input class="easyui-textbox" id="chanceSource" name="chanceSource" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>联系人：</td>
					<td><input class="easyui-textbox" id="linkMan" name="linkMan" class="easyui-combobox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>联系电话：</td>
					<td><input class="easyui-textbox" id="linkPhone" name="linkPhone" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>成功机率：</td>
					<td><input class="easyui-textbox" id="successRate" name="successRate" class="easyui-combobox"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>概要：</td>
					<td><input class="easyui-textbox" id="overview" name="overview" class="easyui-combobox" /></td>
				</tr>
				<tr>
					<td>机会描述：</td>
					<td><input class="easyui-textbox" data-options="multiline:true" id="description" name="description" class="easyui-combobox" style="height:100px"/></td>
				</tr>
				<tr>
					<td>创建人：</td>
					<td><input class="easyui-textbox" id="createMan" name="createMan" class="easyui-combobox"required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>创建时间：</td>
					<td><input class="easyui-textbox" id="createTime" name="createTime" class="easyui-validatebox"/></td>
				</tr>
				<tr>
					<td>指派给：</td>
					<td><input class="easyui-textbox" id="assignMan" name="assignMan" class="easyui-combobox"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>指派时间：</td>
					<td><input class="easyui-textbox" id="assignTime" name="assignTime" class="easyui-validatebox"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

