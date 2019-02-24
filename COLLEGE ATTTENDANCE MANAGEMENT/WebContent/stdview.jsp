 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

table,th,td{
border:1px solid drakorange;
border-collapse:collapse;
opacity:0.95;
}
th,td{
padding:10px;
text-align:center;
font-size:20px;
}
th{
background-color:dodgerblue;
color:pink;
}
tr{
color:orange;
}
.h{
padding-left:10px;
padding-right:10px;
background-color:yellowgreen;
margin:5px;
height:px;
color:white;
text-shadow:2px 2px 3px green;
}
</style>

</head>
<body background="">
<div class="h"><center>STUDENT DETAILS</center></div>
<table align="center" border="1px solid green">
<tr><th>NAME</th><th>SURNAME</th><th>GENDER</th><th>DOB</th><th>DEPTNAME</th><th>COURSE</th><th>ADMNO</th><th>MOBILE</th><th>EMAIL</th><th>PASSWORD</t
h></tr>

<%
String user="";
long pass=0;
String crs=request.getParameter("id");
long num=Long.parseLong(crs);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,sname,gender,dateofbirth,dpt,crs,adno,mobile,email,password from  newuserreg where adno='"+num+"'");
 	while(r.next())
 	{
 		
 		%>
 		
 		<tr><td><%=r.getString(1) %></td>
 		<td><%=r.getString(2) %></td>
 		<td><%=r.getString(3) %></td>
 		<td><%=r.getString(4) %></td>
 		<td><%=r.getString(5) %></td>
 		<td><%=r.getString(6) %></td>
 		<td><%=r.getLong(7) %></td>
 		<td><%=r.getLong(8) %></td>
 		<td><%=r.getString(9) %></td>
 		<td><%=r.getString(10) %></td>
 		
 		</tr>
 		</table>
 		<% 
 		 
 	}
}catch(Exception e){
	
	System.out.println(e);
}



%>
<center><form action="sloginget.jsp"><input type="text" value="<% out.print(user); %>" name="user" hidden>
<input type="text" value="<% out.print(pass); %>" name="pass" hidden>




</body>
</html>