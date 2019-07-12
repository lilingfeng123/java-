<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  		if(request.getSession().getAttribute("new")!=null){	
  	 %>
  	 <font style="color:red"><%=(String)request.getSession().getAttribute("new")+"!!!" %></font>
  	 <%
  	 	}
  	  %>
    <form action="one?flag=login" method="post">
    	’À∫≈£∫<input type="text" name="AdminID"/><br/>
    	√‹¬Î£∫<input type="password" name="Password"/><br/>
    	<input type="submit" value="µ«¬º"/>
    </form>
  </body>
</html>
