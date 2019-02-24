
    <%@ page import="java.sql.*" %>

<html>
<head>

<title>Insert title here</title>
<style type="text/css">
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
<body>
<%try{
String name=request.getParameter("name");
String sname=request.getParameter("sname");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String gender=request.getParameter("gender");
String dateofbirth=request.getParameter("dateofbirth");
String crs=request.getParameter("crs");
String catagiry=request.getParameter("ct");
String dpt=request.getParameter("dpt");
String adn=request.getParameter("adm");


String pass=request.getParameter("pass");
String mobileno=request.getParameter("mb");
Long mbn=Long.parseLong(mobileno);
String email=request.getParameter("email");


	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","college","hari");
	PreparedStatement ps=con.prepareStatement("insert into newuserreg values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,sname);
	ps.setString(3,fname);
	ps.setString(4,mname);
	ps.setString(5,gender);
	ps.setString(6,dateofbirth);
	ps.setString(7,dpt);
	ps.setString(8,crs);
	ps.setString(9,adn);
	ps.setLong(10,mbn);
	ps.setString(11,email);
	ps.setString(12,pass);
	ps.setString(13,catagiry);
	int n=ps.executeUpdate();
	if(n>0)
	{
		
	%>
		<h1>SUCESSFULLY REGISTERED</a></center></h1>
		
		<%@include file="slogin.html"%>
		
		
		
		<% 
	}

	
}catch(Exception e){
	out.print(e);
}






%>

</body>
</html>