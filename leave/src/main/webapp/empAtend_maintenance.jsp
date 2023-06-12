<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@page import="leave.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<table border=1 class="table table-Secondary table-hover table-striped table-sm" style="width:30%;margin-top:30px">
<tr><th>year</th><th>Month</th><th>Attendance</th></tr>
<%
try{
	Connection con=connectivity.getConnection();
	Statement stmt=con.createStatement();
	String StrQuery="select * from workingdays";
	ResultSet rs=stmt.executeQuery(StrQuery);
	while(rs.next())
	{
%>
<tr>
<td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td>

<td><a href="?id=<%=rs.getString(1)%>&id2=<%=rs.getString(2)%>">view</a></td></tr>
<%
	}
	
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>
</table>
</body>
</html>