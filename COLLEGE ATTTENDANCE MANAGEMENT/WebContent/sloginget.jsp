<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
long n=0;
String name="";
String uname=request.getParameter("user");
String password=request.getParameter("pass");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
	PreparedStatement ps=con.prepareStatement("select  email,password,adno,name from newuserreg where email=? and password=?");
	ps.setString(1,uname);
	ps.setString(2,password);
	
	ResultSet s=ps.executeQuery();
	if(s.next())
	{
		name=s.getString(4);
		n=s.getLong(3);
		
		response.sendRedirect("std.jsp?id="+n);
		
	}
	else{
		%>
		<%@include file="slogin.html"%>
		
		<h1>invalid username and password try again logIn</a></h1>
		<% 
	}
}catch(Exception e)
{
	System.out.println(e);
}

%>

</body>
</html>