<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="leave.*" %>
<%@page import="com.ams.dto.WorkdaysDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8081/leave/updateWorkDays" method=get>
<%
try {
	Connection con=connectivity.getConnection();
	String StrQuery="select * from workingdays where year=? and month=?";
	String monthid=request.getParameter("id2");
	int yearid=Integer.parseInt(request.getParameter("id"));
	
	WorkdaysDTO workdaysDTO=new WorkdaysDTO();
	workdaysDTO.setMonth(monthid);
	workdaysDTO.setYear(yearid);
	
	PreparedStatement stmt=con.prepareStatement(StrQuery);
	stmt.setInt(1, workdaysDTO.getYear());
	stmt.setString(2, workdaysDTO.getMonth());
	ResultSet rs=stmt.executeQuery();
	while(rs.next())
	{
%>
Enter year:
<input type="text" name="year" id="year" value="<%=rs.getString(1)%>"><br><br>
Enter Month:
<select name="month" id="month" value="<%=rs.getString(2)%>">
<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>

</select>
Enter days:
<input type="text" name="days" id="days" value="<%=rs.getString(3)%>"><br><br>
<input type="submit" value="Submit">
</form>
<%
	}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>



</body>
</html>