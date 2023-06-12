<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
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

try{
	
	    Connection con=DBconnection.getConnection();
        String LID=request.getParameter("id");
        LeaveDTO leaveDTO=new LeaveDTO();
        leaveDTO.setLeave_id(LID);
        
        String StrQuery="delete from leave_tab where LID=?";
        PreparedStatement stmt=con.prepareStatement(StrQuery);
        stmt.setString(1,leaveDTO.getLeave_id());
         int rs=stmt.executeUpdate();
         if(rs==1)
         {
        	 response.sendRedirect("http://localhost:8081/leave/attendancemaintenance.jsp");
         }
         else{
        	 response.sendRedirect("");
         }
}     
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>