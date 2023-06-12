<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*"%>
<%@page import="leave.*" %>
    <%@page import="com.ams.dto.LeaveDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String LID=request.getParameter("id");

LeaveDTO leaveDTO=new LeaveDTO();
leaveDTO.setLeave_id(LID);

String StrQuery="update leave_tab set status=? where LID=?";
String status="Deny";
try{
	Connection con=DBconnection.getConnection();
	PreparedStatement stmt=con.prepareStatement(StrQuery);
	stmt.setString(2,leaveDTO.getLeave_id());
	stmt.setString(1,status);
	
	int i=stmt.executeUpdate();
	
	if(i==1)
	{
		response.sendRedirect("http://localhost:8081/leave/Attendance/attendance.jsp");
		
	}
	else {
		response.sendRedirect("");
		
	}
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>