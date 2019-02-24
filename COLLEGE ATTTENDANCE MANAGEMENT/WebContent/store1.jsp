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
String sname=request.getParameter("sname");
String adno=request.getParameter("adno");

String crs=request.getParameter("crs");
String mnt=request.getParameter("mnt");

String days=request.getParameter("day");
int day=Integer.parseInt(days);

String ad1=request.getParameter("ad");
int adn=Integer.parseInt(ad1);

int ld=day-adn;
float p=adn*100;
 float pt=p/day;
String sp="Not Eligible";

if(pt>=75)
{  sp="Eligible";
}

try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
 	
	Statement st=con.createStatement();
	ResultSet r=st.executeQuery("select * from newuserreg where adno='"+adno+"'");
	if(r.next()){
		
	
	
	PreparedStatement ps=con.prepareStatement("insert into entry1 values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,sname);
	ps.setString(2,adno);
	ps.setString(3,crs);
	ps.setString(4,mnt);
	ps.setInt(5,day);
	ps.setInt(6,adn);
	ps.setInt(7,ld);
	ps.setFloat(8,pt);
	ps.setString(9,sp);

	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<%@include file="adentry.html"%>
		<%
			

		out.println("<center><h1 style='color:green'>Sucessfully updated student monthly Attendances.....</h1></center>");
		
		
	}

	
	
	}
	
	else
	{
		out.println(r.next());
		%>
		<%@include file="adentry.html"%>
		<%
		
		out.println("<h1 style='color:red'> please enter valid admission number and student name</h1>");
	}
	
}
	
catch(Exception e){
	System.out.println(e);
	out.println("heere");
}
%>

</body>
</html>