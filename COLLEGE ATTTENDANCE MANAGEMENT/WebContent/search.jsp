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
height:25px;
color:white;
text-shadow:2px 2px 3px green;
}
a{
float:left;
color:white;
font-weight:bold;
margin-left:10px;
background-color:black;
border-radius:15px;
padding:2px;
text-decoration:none;

}
</style>
</head>
<body background="">
<center><a href="index.html">Back to home</a></center>
<div class="h"><center><h3><u>Student details</u></h3></center></div>

<%

String adno=request.getParameter("adno");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
	Statement st1=con.createStatement();
 	ResultSet rs=st1.executeQuery("select month,persentage,scholorship from entry1 where  adno='"+adno+"'");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,sname,dateofbirth,dpt,crs,adno,mobile,email,password from  newuserreg where adno='"+adno+"'");
 	%>
 <table align="center" border="1px solid green">
<tr><th>NAME</th><th>SURNAME</th><th>DOB</th><th>DEPTNAME</th><th>COURSE</th><th>ADMNO</th><th>MOBILE</th><th>EMAIL</th>
</tr>
 
 	<%
 	if(r.next())
 	{
 		%>
 		

 		<tr><td><%=r.getString(1) %></td>
 		<td><%=r.getString(2) %></td>
 		<td><%=r.getString(3) %></td>
 		<td><%=r.getString(4) %></td>
 		<td><%=r.getString(5) %></td>
 		<td><%=r.getLong(6) %></td>
 		<td><%=r.getLong(7) %></td>
 		<td><%=r.getString(8) %></td>
 		
 	
 		
 		</tr>
 		
 		
 		<% 
 		 
 	} else
 	{
 	%>
 	
 	<h1 style="color:red;"> invalid admission number</h1>
 	<%} %>
 	</table><br><br><br><br><br><br><br><br><br><br>
 	
 	 <table align="center" border="1px solid green">
 	<tr><th>month</th><th>percentage</th><th> scholarship</th></tr>
 	 
 	 	<%
 	 	while(rs.next())
 	 	{
 	 		%>
 	 		

 	 		<tr><td><%=rs.getString(1) %></td>
 	 		<td><%=rs.getString(2) %></td>
 	 		<td><%=rs.getString(3) %></td>
 	 		
 	 		
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