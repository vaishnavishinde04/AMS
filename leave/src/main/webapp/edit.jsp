<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.ams.dto.LeaveDTO" %>
<%@page import="leave.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="http://localhost:8081/leave/update" method="get">
<h1>Edit Leave Form</h1><br><br>
<%

String LID=request.getParameter("id");

LeaveDTO leaveDTO=new LeaveDTO();
leaveDTO.setLeave_id(LID);

String StrQuery="select * from leave_tab where LID=?";
try{
	Connection con=DBconnection.getConnection();
	PreparedStatement stmt=con.prepareStatement(StrQuery);
	stmt.setString(1,leaveDTO.getLeave_id());
	ResultSet rs=stmt.executeQuery();
	while(rs.next())
	{
	
%>
Employee ID:
<input type="text" name="emp_id" id="emp_id" value="<%=rs.getString(6)%>"><br><br>

Leave ID:
<input type="text" name="LID" id="LID" value="<%=rs.getString(1)%>"><br><br>

from:
<input type="date" name="fromd" id="fromd" value="<%=rs.getDate(2)%>">
To:
<input type="date" name="tod" id="tod" value="<%=rs.getDate(3)%>"><br><br>
Leave Descrition:<br>
<textarea name="desc" id="desc" rows="3" cols="30" value="<%=rs.getString(4)%>"></textarea><br><br>
Leave Type:
<input type="text" name="Ltype" id="Ltype" value="<%=rs.getString(5)%>"><br><br>

<input type="submit" value="submit">
</form>
<%

}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</body>
</html>