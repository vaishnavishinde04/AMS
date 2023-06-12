<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="leave.*" %>
    <%@page import="com.ams.dto.AttendanceDTO" %>

<!doctype html>


<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../CSS1/fonts/icomoon/style.css">

<link rel="stylesheet" href="../CSS1/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../CSS1/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="../CSS1/css/style.css">
<link href="../CSS/css/main.css" rel="stylesheet" media="all">

    <title>Attendance</title>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
      <h2 class="mb-5">Attendance</h2>
      

      <div class="table-responsive custom-table-responsive">

        <table class="table custom-table">
          <thead>
            <tr>  

             <th scope="col">Year</th>
              <th scope="col">Month</th>
              <th scope="col">Employee ID</th>
              <th scope="col">Attendance</th>
            </tr>
          </thead>
          <tbody>
          
          
<%
try{
	int year=Integer.parseInt(request.getParameter("year"));
	String month=request.getParameter("month");
	Connection conn=connectivity.getConnection();
	
	AttendanceDTO attendanceDTO=new AttendanceDTO();
	attendanceDTO.setYear(year);
	attendanceDTO.setMonth(month);
	
	//Statement stmt1=conn.createStatement();
	String StrQuery1="select * from emp_attendance where year=? and month=?";
	PreparedStatement stmnt=conn.prepareStatement(StrQuery1);
	stmnt.setInt(1, attendanceDTO.getYear());
	stmnt.setString(2, attendanceDTO.getMonth());
	ResultSet rs=stmnt.executeQuery();
	while(rs.next())
	{
%>
          
            <tr scope="row">
 <td><%=rs.getInt(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
</tr>
<%
	}
	
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>
           
            
          </tbody>
        </table>
         
                        
      </div>


    </div>

  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>