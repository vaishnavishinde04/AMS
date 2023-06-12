<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="leave.*" %>
    <%@page import="com.ams.dto.LeaveDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View page</title>
</head>
<body>
<h1>Leave Details</h1>
<%
String LID=request.getParameter("id");

try{
	Connection con=DBconnection.getConnection();
	LeaveDTO leaveDTO=new LeaveDTO();
	leaveDTO.setLeave_id(LID);
	
     String StrQuery="Select * from leave_tab where LID=?";
	PreparedStatement stmt=con.prepareStatement(StrQuery);
	stmt.setString(1, leaveDTO.getLeave_id());
	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
%>
Employee ID:<%=rs.getString(6) %><br>
Leave ID:<%=rs.getString(1) %><br>
From:<%=rs.getDate(2) %><br>
To:<%=rs.getDate(3) %><br>
Leave Description:<%=rs.getString(4) %><br>
Leave Type:<%=rs.getString(5) %>
</body>
<%
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}


%>


</html>