<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="leave.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

</head>
<body><center><div class="cont">
<table border=1 class="table table-Secondary table-hover table-striped table-sm" style="width:60%;margin-top:30px">
<tr><th>Leave ID</th><th>From</th><th>To</th><th>Leave Description</th><th>Leave Type</th><th>Employee ID</th><th>Status</th>
<th>View</th><th>Update</th><th>Delete</th>
</tr>
<%


try{
	Connection con=DBconnection.getConnection();
	Statement stmt=con.createStatement();
	String strQuery="select * from leave_tab";
	
	ResultSet rs = stmt.executeQuery(strQuery);
	
	while(rs.next()){
 


%>
<tr>

<td><%=rs.getString(1) %></td>
<td><%=rs.getDate(2) %></td>
<td><%=rs.getDate(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>

<td><a href="view.jsp?id=<%=rs.getString(1)%>">view</a></td>
<td><a href="edit.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
<td><a href="delete.jsp?id=<%=rs.getString(1)%>">delete</a></td>


</tr>
<%
	}
	
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>


</table><br><br>
<a href="http://localhost:8081/leave/leave.html"><input type="button" name="btnAddNew" id="btnAddNew" value="New Record"></a></center>
</body>
</html>