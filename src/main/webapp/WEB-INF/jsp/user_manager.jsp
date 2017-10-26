<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/util.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table class="easyui-datagrid" rownumbers="true" fitColumns="true"
		pagination="true"
		data-options="fit:true,singleSelect:true,url:'${path}/user/findAll.action',method:'get',toolbar:'#toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,align:'center'">编号</th>
				<th data-options="field:'userName',width:100,align:'center'">用户名</th>
				<th data-options="field:'password',width:80,align:'center'">密码</th>
				<th data-options="field:'trueName',width:80,align:'center'">真实姓名</th>
				<th data-options="field:'email',width:100,align:'center'">邮件</th>
				<th data-options="field:'phone',width:100,align:'center'">联系电话</th>
				<th data-options="field:'roleName',width:100,align:'center'">角色</th>
			</tr>
		</thead>
	</table>
	
	<div id="toolbar">
		<a onclick="add()" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a class="easyui-linkbutton" iconCls="icon-edit">修改</a>
		<a class="easyui-linkbutton" iconCls="icon-remove">删除</a>
	</div>
	
	<!-- 添加用户弹窗 -->
	<div id="addDialog" style="display:none;padding:5px;width:400px;height:300px;" title="添加用户"> 
		<form id="ff" method="post">   
		    <div>   
		        <label for="name">用户名</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div>
		    <div>   
		        <label for="name">密码</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div> 
		    <div>   
		        <label for="name">确认密码</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div> 
		    <div>   
		        <label for="name">真实姓名</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div>    
		    <div>   
		        <label for="email">邮件</label>   
		        <input class="easyui-validatebox" type="text" name="email" data-options="validType:'email'" />   
		    </div>
		    <div>   
		        <label for="name">联系电话</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div> 
		    <div>   
		        <label for="name">角色</label>   
		        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
		    </div>       
		</form>  
	</div> 
</body>
</html>

<script type="text/javascript">
	function add() { 
		$('#addDialog').show(); 
		$('#addDialog').dialog({ 
		collapsible: true, 
		minimizable: true, 
		maximizable: true, 
		buttons: [{ 
		text: '添加', 
		iconCls: 'icon-add', 
		handler: function() { 
			alert('添加成功'); 
		} 
		}, { 
		text: '取消', 
		handler: function() { 
			$('#addDialog').dialog('close'); 
		} 
		}] 
		}); 
		} 
</script>