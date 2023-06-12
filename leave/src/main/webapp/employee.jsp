<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="javax.servlet.http.*" %>
<%@page import="javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Page</title>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<link rel="stylesheet" href="styles.css">
</head>
<body>
<%
try{
	
	HttpSession s=request.getSession(false);
	String user=(String)s.getAttribute("username");
	

%>


<div class="wrapper hover_collapse">
	<div class="top_navbar">
		<div class="logo">Employee<span>Page</span></div>
		<div class="menu">
			<div class="hamburger">
				
			</div>
			<div class="profile_wrap">
				<div class="profile">
					
					<span class="name"><%=user %></span>
					<span class="icon">
						
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="sidebar">
		<div class="sidebar_inner">
		<ul>
			<li>
				<a href="#">
					<span class="text">Profile</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/emp_attendance.jsp">
					<span class="text">Attendance</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/leave.html">
					<span class="text">Apply Leave</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/leaveStatus.jsp">
					<span class="text">Leave Status</span>
				</a>
			</li>
			
		</ul>
		</div>
	</div>

	<div class="main_container">
		<div class="container">
			
			<div class="content">
			<h1>Attendance Management System</h1>
				</div>
		</div>
	</div>
</div>


<script src="scripts.js"></script>

<h1>employee page</h1>
<%
}

catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>