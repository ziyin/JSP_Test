<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<link rel="stylesheet" type="text/css" href="Style/Unite.css"
	media="screen" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="NavigationBar.jsp" />
	<%
	String driverName="com.mysql.jdbc.Driver";  //驅動
	
	String DB_URL = "jdbc:mysql://localhost:3306/protein_server?serverTimezone=UTC";
	String Account = "root";
	String Password = "root"; 

	try
	{
		Class.forName(driverName).newInstance();
		Connection conn = DriverManager.getConnection(DB_URL,Account,Password);
		
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); //DB Connect
		try
		{
			String SQL_Line="SELECT * from try_data";
			ResultSet result = stmt.executeQuery(SQL_Line);
			
			while(result.next())
			{				
				out.println( result.getString("ID"));
			}
			
		}catch(Exception e)
		{
			out.println(e.toString());
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}
	%>
</body>
</html>	