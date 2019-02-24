<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>students monthly bill</title>
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
height:25px;
color:white;
text-shadow:2px 2px 3px green;
}
a{
float:left;
color:red;
font-weight:bold;
margin-left:10px;
background-color:yellow;
border-radius:15px;
padding:2px;
text-decoration:none;

}
</style>
</head>

<%

String crs=request.getParameter("crs");

String mnt=request.getParameter("mnt");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select sname,adno,month,workdays,adays,lev,persentage,scholorship from entry1 where  crs='"+crs+"'and month='"+mnt+"' ");
 	%>
 	<body background="">
<center><a href="view.html">Back to home</a></center>
<div class="h"><center><h2><u>Students attendance for the month of <font color="black"><%out.println(mnt); %></font></u></h3></center></div>
 	
 <table align="center" border="1px solid green">
<tr><th>Name of the student</th><th>admission no</th><th>month</th><th>working days</th><th> attending days</th><th>leave days</th><th>percentage</th><th> scholarship</th></tr>
 
 	<%
 	while(r.next())
 	{
 		%>
 		

 		<tr><td><%=r.getString(1) %></td>
 		<td><%=r.getString(2) %></td>
 		<td><%=r.getString(3) %></td>
 		<td><%=r.getString(4) %></td>
 		<td><%=r.getString(5) %></td>
 		<td><%=r.getString(6) %></td>
 		<td><%=r.getString(7) %></td>
 		<td><%=r.getString(8) %></td>
 		</tr>
 		
 		
 		<% 
 		
 	
 	} 
         
 	}catch(Exception e){
	
	System.out.println(e);
}



%>
 </table>

</body>
</html>