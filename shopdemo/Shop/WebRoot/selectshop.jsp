<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectshop.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.table{
		 	position:absolute;
		 	left:10px;
			font-family : 微软雅黑,宋体;
			font-size :0.5em;
			color :gray;
			border: 1px solid #000;
			border-collapse:collapse; 
            table-layout: fixed;
		}
        th{
			overflow:hidden;
			background:#F0F0F0;
			border: 1px solid  #e6e6e6;
		}
		td{
			border: 1px solid  #e6e6e6;
			overflow:hidden;
		}
        th, td{
			height:40px;
			width:175px;
			overflow:hidden;
			text-align:center;
			white-space: nowrap;
			text-overflow:ellipsis
		}
	</style>
  </head>
  
  <body>
  	<jsp:useBean id="al" class="java.util.ArrayList" scope="request"/>
    <form action="one?flag=addshop" method="post">
    <table>
    <tr><th>商品编号</th><th>商品名称</th><th>商品价格</th><th>商品数量</th><th>商品重量</th><th>商品类型</th><th>操作</th></tr>
    <c:forEach var="shop" items="${al }">
    <tr>
	    	<td>${shop.s_id }</td><td>${shop.s_name }</td><td>${shop.s_price }</td>
	    	<td>${shop.s_num }</td><td>${shop.s_weight }</td><td>${shop.s_type }</td>
	    	<td><input type="checkbox" name="myshop" value="${shop.s_id }"/>添加</td>
    </tr>
     </c:forEach>
    </table>
    <input type="submit" value="加入购物车">
    </form>
    <a href="http://localhost:8080/Shop/loginsuccess.jsp?AdminID="+${sessionScope.AdminID }><input type="button" value="返回"></a>
  </body>
</html>
