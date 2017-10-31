<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>starting page</title>
    <script type="text/javascript" src="js/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="js/jquery-easyui-1.5.1/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="js/jquery-easyui-1.5.1/themes/icon.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
 
 	<style>
		#div1{
			width: 500px;
			height: 300px;
			margin: 100px 0 0 0;
			border: 2px solid grey;
		}
		#div2{
			width: 300px;
			height: 200px;
		}
		h2{
			margin: 100px 0 0 0;
		}
		a{
			text-decoration: none;
		}
	</style>
  </head>
<div align="center">
	<h2>欢迎使用CRM管理系统</h2>
	<div id="div1" align="center">
		<div id="div2">
			<h3>用户登录</h3><br>
			<form action="${pageContext.request.contextPath}/index/login.action" method="post">
				用户名:<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br/><br/>
				密&nbsp;码:<input type="password" name="password" class="easyui-validatebox" data-options="required:true"/><br/><br/>
				<input type="submit" value="登录"/>&nbsp;&nbsp;<input type="reset" value="重置"/>
			</form>
		</div><br/><br/><br/>
	</div>
</div>
  </body>
</html>
