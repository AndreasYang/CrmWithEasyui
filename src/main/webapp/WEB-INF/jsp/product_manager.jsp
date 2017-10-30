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
			url:'${path}/product/findAll.action',
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
				     {field:'name',title:'产品名称',width:100,align:'center'},    
				     {field:'model',title:'型号',width:80,align:'center'},
				     {field:'unit',title:'单位',width:80,align:'center'},
				     {field:'price',title:'价格',width:80,align:'center'},
				     {field:'stock',title:'库存',width:80,align:'center'},
				     {field:'remark',title:'备注',width:80,align:'center'}
				     
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
					"${path}/product/delete.action",
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
			'name':$("#name").val(),
			'model':$("#model").val()
		})
	}

	var url;
	/* 打开添加dialog */
	function openAddDialog() {
		$("#dialog").dialog("open").dialog("setTitle","添加信息");
		url = "${path}/product/add.action";
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
		url = "${path}/product/update.action";
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
		<a href="javascript:openAddDialog()" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" iconCls="icon-edit">修改</a>
		<a href="javascript:doDelete()" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		产品名称：<input type="text" id="name"></input>
		型号：<input type="text" id="model"></input>
		<a href="javascript:doSearch();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	</div>
	
	<!-- 弹窗 -->
	<div id="dialog" class="easyui-dialog" style="width:650;padding: 10px 20px">
		<form action="" id="form" method="post">
			<input type="hidden" id="id" name="id"/>
			<table cellspacing="8px">
				<tr>
					<td>产品名称：</td>
					<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>型号：</td>
					<td><input type="text" id="model" name="model" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>单位：</td>
					<td><input type="text" id="unit" name="unit" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>价格：</td>
					<td><input type="text" id="price" name="price" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>库存：</td>
					<td><input type="text" id="stock" name="stock" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>备注：</td>
					<td><input type="text" id="remark" name="remark" class="easyui-validatebox" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

