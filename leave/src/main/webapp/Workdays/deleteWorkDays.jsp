<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="leave.*" %>
<%@page import="com.ams.dto.WorkdaysDTO" %>
<%@page import="com.ams.dao.WorkdayDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	
	    
        int yearid=Integer.parseInt(request.getParameter("id"));
        String monthid=request.getParameter("id2");
        
        WorkdaysDTO dto=new WorkdaysDTO();
        dto.setMonth(monthid);
        dto.setYear(yearid);
        
        WorkdayDAO workdayDAO=new WorkdayDAO();
        
        int rs=workdayDAO.delete(dto);
        		
        		
         if(rs==1)
         {
        	 response.sendRedirect("http://localhost:8081/leave/Workdays/workdaysmain.jsp");
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