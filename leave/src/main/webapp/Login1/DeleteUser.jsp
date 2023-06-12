<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ams.dao.LoginDAO"%>
<%@page import="com.ams.dto.LoginDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User</title>
</head>
<body>
	<%
	String Username = request.getParameter("id");
	LoginDTO dto = new LoginDTO();
	dto.setEmployee_id(Username);
	
	LoginDAO dao = new LoginDAO();
	int result = dao.delete(dto);
	if (result == 1) {
		response.sendRedirect("http://localhost:8081/leave/Login/LoginMaintainance.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
	%>
</body>
</html>