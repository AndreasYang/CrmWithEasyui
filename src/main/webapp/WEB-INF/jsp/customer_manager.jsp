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
			'num':$("#snum").val(),
			'name':$("#sname").val()
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
		        if($("#managerName").combobox("getValue") == "") {
		        	$.messager.alert("系统提示", "请选择客户经理");
		        	return false;
		        }
		        if($("#level").combobox("getValue") == "") {
		        	$.messager.alert("系统提示", "请选择客户等级");
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
	
	function openCustomerLinkManTab(){
		var id = $("#datagrid").datagrid("getSelected").id;
		
		 window.parent.openTab('联系人管理','${path}/customerLinkman/index.action?customerId='+id,'icon-jwjl');
	}
	function openCusDevPlanTab(id){
		 window.parent.openTab('交往记录管理','${path}/cusDevPlan/index.action?saleChanceId='+id,'icon-jwjl');
	}
	function openCusDevPlanTab(id){
		 window.parent.openTab('历史订单查看','${path}/cusDevPlan/index.action?saleChanceId='+id,'icon-jwjl');
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
			<a href="javascript:openCustomerLinkManTab()" class="easyui-linkbutton" iconCls="icon-jwjl">联系人管理</a>
			<a href="javascript:openCusDevPlanTab()" class="easyui-linkbutton" iconCls="icon-jwjl">交往记录管理</a>
			<a href="javascript:openCusDevPlanTab()" class="easyui-linkbutton" iconCls="icon-jwjl">历史订单查看</a>
		</div>
		<div>
			<div>
			客户编号：<input type="text" id="snum"/>
			客户名称：<input type="text" id="sname">
			<a href="javascript:doSearch();" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
		</div>
	</div>
	
	<!-- 弹窗 -->
	<div id="dialog" class="easyui-dialog" closed="true"
		style="width:800;height:300,padding: 10px 20px" buttons="#dialog-button">
		<form action="" id="form" method="post">
			<input type="hidden" id="id" name="id"/>
			<input type="hidden" id="num" name="num"/>
			<table cellspacing="8px">
				<tr>
					<td>客户名称：</td>
					<td><input type="text" id="name" name="name" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>地区：</td>
					<td>
						<select class="easyui-combobox" id="region" name="region" editable="false" style="width:162px" panelHeight="120px">
							<option></option>
							<option value="青岛">青岛</option>
							<option value="北京">北京</option>
							<option value="上海">上海</option>
							<option value="深圳">深圳</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>客户经理：</td>
					<td><input class="easyui-combobox" id="managerName" name="managerName" data-options="panelHeight:'auto',
							valueField:'trueName',textField:'trueName',
							url:'${path}/user/getCustomerManagerList.action'"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>客户等级：</td>
					<td><input class="easyui-combobox" id="level" name="level" data-options="panelHeight:'auto',
							valueField:'dataDicValue',textField:'dataDicValue',
							url:'${path}/dataDic/getCustomerLevel.action'"/></td>
				</tr>
				<tr>
					<td>客户满意度：</td>
					<td>
						<select class="easyui-combobox" id="satisfy" name="satisfy" editable="false" style="width:162px" panelHeight="120px">
							<option></option>
							<option value="☆☆☆☆☆">☆☆☆☆☆</option>
							<option value="☆☆☆☆">☆☆☆☆</option>
							<option value="☆☆☆">☆☆☆</option>
							<option value="☆☆">☆☆</option>
							<option value="☆">☆</option>
						</select>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>客户信用度：</td>
					<td>
						<select class="easyui-combobox" id="credit" name="credit" editable="false" style="width:162px" panelHeight="120px">
							<option></option>
							<option value="☆☆☆☆☆">☆☆☆☆☆</option>
							<option value="☆☆☆☆">☆☆☆☆</option>
							<option value="☆☆☆">☆☆☆</option>
							<option value="☆☆">☆☆</option>
							<option value="☆">☆</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>邮政编码：</td>
					<td><input type="text" id="postCode" name="postCode" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>联系电话：</td>
					<td><input type="text" id="phone" name="phone" class="easyui-validatebox"  /></td>
				</tr>
				<tr>
					<td>传真：</td>
					<td><input type="text" id="fax" name="fax" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>网址：</td>
					<td><input type="text" id="webSite" name="webSite" class="easyui-validatebox"  /></td>
				</tr>
				<tr>
					<td>客户地址：</td>
					<td colspan="4"><input type="text" id="address" name="address" class="easyui-validatebox" style="width: 400px"/></td>
				</tr>
				<tr>
					<td>营业执照注册号：</td>
					<td><input type="text" id="licenceNo" name="licenceNo" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>法人：</td>
					<td><input type="text" id="legalPerson" name="legalPerson" class="easyui-validatebox"  /></td>
				</tr>
				<tr>
					<td>注册资金（万元）：</td>
					<td><input type="text" id="bankroll" name="bankroll" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>年营业额（万元）：</td>
					<td><input type="text" id="turnover" name="turnover" class="easyui-validatebox"  /></td>
				</tr>
				<tr>
					<td>开户银行：</td>
					<td><input type="text" id="bankName" name="bankName" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>开户账号：</td>
					<td><input type="text" id="bankAccount" name="bankAccount" class="easyui-validatebox"  /></td>
				</tr>
				<tr>
					<td>地税登记号：</td>
					<td><input type="text" id="localTaxNo" name="localTaxNo" class="easyui-validatebox"  /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>国税登记号：</td>
					<td><input type="text" id="nationalTaxNo" name="nationalTaxNo" class="easyui-validatebox"  /></td>
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

