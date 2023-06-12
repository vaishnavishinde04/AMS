<%@page import="com.ams.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="leave.*"%>
<%@page import="com.ams.dao.LoginDAO" %>
<%@page import="com.ams.dto.LoginDTO" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

</head>
<body>
	<center>
		<div class="cont">
			<table border=1
				class="table table-Secondary table-hover table-striped table-sm"
				style="width: 60%; margin-top: 30px">
				<tr>
					<th>Username</th>
					<th>Passowrd</th>
					<th>Position</th>
					<th>View</th>
					<th>Update</th>
					<th>Delete</th>
					
				</tr>
				<%
				try {
				 	
				 	 LoginDAO dao = new LoginDAO();
				 	 List<DTO> dtolst = dao.reteriveall();
				 	 
				 	 Iterator itr = dtolst.iterator();
				 	LoginDTO dto = new LoginDTO();
					    
					    while(itr.hasNext()) {
					    	dto = (LoginDTO) itr.next();
				
				
				%>
				<tr>

					<td><%=dto.getEmployee_id()%></td>
					<td><%=dto.getPassword()%></td>
					<td><%=dto.getPosition()%></td>
					
					

					<td><a href="view.jsp?id=<%=dto.getEmployee_id()%>">view</a></td>
					<td><a href="edit.jsp?id=<%=dto.getEmployee_id()%>">Edit</a></td>
					<td><a href="DeleteUser.jsp?id=<%=dto.getEmployee_id()%>">delete</a></td>


				</tr>
				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>


			</table>
			<br>
			<br> <a href="http://localhost:8081/leave/Login/Newuser.html"><input
				type="button" name="btnAddNew" id="btnAddNew" value="New Record"></a>
	</center>
</body>
</html>