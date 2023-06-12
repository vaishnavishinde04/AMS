<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="javax.servlet.http.HttpSession" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<link rel="stylesheet" href="styles.css">

</head>
<body>

  <%
  try
	{
	  HttpSession s=request.getSession(false);  
      String user=(String)s.getAttribute("username"); 
		
  %>
	
<div class="wrapper hover_collapse">
	<div class="top_navbar">
		<div class="logo">Admin<span>Page</span></div>
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
				<a href="http://localhost:8081/leave/attendance.jsp">
					<span class="text">Leave Applications</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/workingDays.jsp">
					<span class="text">Workdays</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/holidaysmaintenance.jsp">
					<span class="text">Holidays</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/newuser.html">
					<span class="text">New Registration</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/Generate_Attendance.jsp">
					<span class="text">Generate Attendance</span>
				</a>
			</li>
			<li>
				<a href="http://localhost:8081/leave/viewAttendaceForm.jsp">
					<span class="text">View Attendance</span>
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



</body>

<%
	}
	catch(Exception e)  {
		e.printStackTrace();
		
	}


%>
</html>