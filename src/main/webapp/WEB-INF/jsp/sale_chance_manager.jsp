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
		
		$(function(){
			$("#assignMan").combobox({
				onSelect:function(record){
					if(record.trueName!=''){
						$("#assignTime").val(Util.getCurrentDateTime());
					}else{
						$("#assignTime").val("");
					}
				}
			}); 
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
			'sstartDate':$("#sstartDate").val(),
			'sendDate':$("#sendDate").val()
		})
	}

	var url;
	/* 打开添加dialog */
	function openAddDialog() {
		$("#dialog").dialog("open").dialog("setTitle","添加信息");
		url = "${path}/saleChance/add.action";
		$('#form').form("clear");
		$("#createMan").val("${user.name}");
		$("#createTime").val(Util.getCurrentDateTime());
		
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
	
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(s){
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
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
			客户名称：<input type="text" id="scustomerName"/>
			概要：<input type="text" id="soverview">
			创建人：<input type="text" id="screateMan">
			创建开始时间：<input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" id="sstartDate" name="sstartDate" style="width:100px">
			创建结束时间：<input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" id="sendDate" name="sendDate" style="width:100px">
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
					<td><input type="text" id="customerName" name="customerName" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>机会来源：</td>
					<td><input type="text" id="chanceSource" name="chanceSource" required="true"/></td>
				</tr>
				<tr>
					<td>联系人：</td>
					<td><input type="text" id="linkMan" name="linkMan" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>联系电话：</td>
					<td><input type="text" id="linkPhone" name="linkPhone" required="true"/></td>
				</tr>
				<tr>
		   			<td>成功几率(%)：</td>
		   			<td><input type="text" id="successRate" name="successRate" class="easyui-numberbox" data-options="min:0,max:100" required="true"/>&nbsp;<font color="red">*</font></td>
		   			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		   		</tr>
		   		<tr>
		   			<td>概要：</td>
		   			<td colspan="4"><input type="text" id="overview" name="overview" style="width: 420px"/></td>
		   		</tr>
		   		<tr>
		   			<td>机会描述：</td>
		   			<td colspan="4">
		   				<textarea rows="5" cols="50" id="description" name="description"></textarea>
		   			</td>
		   		</tr>
				<tr>
					<td>创建人：</td>
					<!-- <td><input type="text" id="createMan" name="createMan" required="true"/></td> -->
					<td><input type="text" editable="false" id="createMan" name="createMan" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>创建时间：</td>
					<td><input type="text" readonly="true" id="createTime" name="createTime"/></td>
				</tr>
				<tr>
					<td>指派给：</td>
					<td><input class="easyui-combobox" id="assignMan" name="assignMan" data-options="panelHeight:'auto',
							valueField:'trueName',textField:'trueName',
							url:'${path}/user/getCustomerManagerList.action'"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>指派时间：</td>
					<td><input type="text" id="assignTime" name="assignTime"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

