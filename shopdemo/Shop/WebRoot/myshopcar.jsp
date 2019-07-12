<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myshopcar.jsp' starting page</title>
    
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
    <%
    	ArrayList<Car> al=(ArrayList<Car>)request.getSession().getAttribute("myal");
    	Iterator<Car> iterator=al.iterator();
     %>
     <p>我的购物车</p>
     <table>
    	<tr><th>商品编号</th><th>商品名称</th><th>商品价格</th><th>商品重量</th><th>商品类型</th><th>数量</th></tr>
	    <%
	    	while(iterator.hasNext()){
	    		Car car=iterator.next();
	    %>
	    <tr>
		    	<td><%=car.getC_s_id() %></td><td><%=car.getC_name() %></td><td><%=car.getC_price() %></td>
		    	<td><%=car.getC_weight() %></td><td><%=car.getC_type() %></td><td><%=car.getC_num() %></td>
	    </tr>
	    <%
	    	}
	     %>
    </table>
    <a href="http://localhost:8080/Shop/one?flag=selectshop"><input type="button" value="继续购物"></a>
  </body>
</html>
