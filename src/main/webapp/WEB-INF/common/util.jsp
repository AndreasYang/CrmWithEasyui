<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<script type="text/javascript">  
     var path="${pageContext.request.contextPath}";  
</script>

<script type="text/javascript" src="${path}/resources/js/common.js"></script>

<link rel="stylesheet" href="${path}/resources/thirdlib/jquery-easyui/themes/default/easyui.css"/>
<link rel="stylesheet" href="${path}/resources/thirdlib/jquery-easyui/themes/icon.css"/>
<script type="text/javascript" src="${path}/resources/thirdlib/jquery-easyui/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/resources/thirdlib/jquery-easyui/jquery.easyui.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/resources/thirdlib/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>