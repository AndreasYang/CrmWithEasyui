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
		url:'${path}/customer/findAll.action',
		method:'get',
		fit:true,
		singleSelect:false,
		toolbar:'#toolbar',
		pagination:true,
		rownumbers:true,
		/* fitColumns:true, */
		columns:[[
		         {field:'cb',checkbox:true,align:'center'},    
			     {field:'id',title:'编号',width:80,align:'center'},    
			     {field:'num',title:'客户编号',width:100,align:'center'},    
			     {field:'name',title:'客户（公司）姓名',width:80,align:'center'},
			     {field:'region',title:'客户地区',width:80,align:'center'}, 
			     {field:'managerName',title:'客户经理',width:80,align:'center'}, 
			     {field:'level',title:'客户等级',width:80,align:'center'}, 
			     {field:'satisfy',title:'客户满意度',width:80,align:'center'}, 
			     {field:'credit',title:'客户信用度',width:80,align:'center'}, 
			     {field:'address',title:'客户地址',width:80,align:'center'}, 
			     {field:'postCode',title:'邮政编码',width:80,align:'center'}, 
			     {field:'phone',title:'联系电话',width:80,align:'center'}, 
			     {field:'fax',title:'传真',width:80,align:'center'}, 
			     {field:'webSite',title:'网址',width:80,align:'center'}, 
			     {field:'licenceNo',title:'营业执照编号',width:80,align:'center'}, 
			     {field:'legalPerson',title:'法人',width:80,align:'center'}, 
			     {field:'bankroll',title:'注册资金（万元）',width:80,align:'center'},
			     {field:'turnover',title:'年营业额',width:80,align:'center'},
			     {field:'bankName',title:'开户银行',width:80,align:'center'},
			     {field:'bankAccount',title:'开户账号',width:80,align:'center'},
			     {field:'localTaxNo',title:'地税登记号',width:80,align:'center'},
			     {field:'nationalTaxNo',title:'国税登记号',width:80,align:'center'},
			     {field:'status',title:'客户状态',width:80,align:'center'},
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
					"${path}/customer/delete.action",
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
	
	/* 根据用户名查找 */
	function doSearch(value){
		$("#datagrid").datagrid("load",{
			'name':value
		})
	}

	var url;
	/* 打开添加dialog */
	function openAddDialog() {
		$("#dialog").dialog("open").dialog("setTitle","添加信息");
		url = "${path}/customer/add.action";
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
		url = "${path}/customer/update.action";
		$('#form').form("load", row);
	}
	
	function doSave(){
		$('#form').form('submit', {    
		    url:url,    
		    onSubmit: function(){    
		        if($("#roleName").combobox("getValue") == "") {
		        	$.messager.alert("系统提示", "请选择用户角色");
		        	return false;
		        }
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
		<input class="easyui-searchbox" data-options="prompt:'用户名',searcher:doSearch" style="width:150px"></input>
	</div>
	
	<!-- 弹窗 -->
	<div id="dialog" class="easyui-dialog" closed="true"
		style="width:550;height:300,padding: 10px 20px" buttons="#dialog-button">
		<form action="" id="form" method="post">
			<input type="hidden" id="id" name="id"/>
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>密码：</td>
					<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>真实姓名：</td>
					<td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>邮箱：</td>
					<td><input type="text" id="email" name="email" class="easyui-validatebox" required="true" validType="email"/></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>用户角色：</td>
					<td>
						<select class="easyui-combobox" id="roleName" name="roleName" editable="false" style="width:160">
							<option></option>
							<option value="系统管理员">系统管理员</option>
							<option value="销售主管">销售主管</option>
							<option value="客户经理">客户经理</option>
							<option value="高管">高管</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 弹窗按钮 -->
	<div id="dialog-button">
		<a href="javascript:doSave()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	 
</body>
</html>

