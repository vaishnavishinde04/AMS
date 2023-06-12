<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="leave.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="ISO-8859-1">
<title>Attendance</title>

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



</head>
<body>

<div class="content">
    
    <div class="container">
      <h2 class="mb-5">Attendance Applications</h2>
      

      <div class="table-responsive custom-table-responsive">

        <table class="table custom-table">
          <thead>
           
            <tr>
              
              <th scope="col">Leave ID</th>
              <th scope="col">From</th>
              <th scope="col">To</th>
              <th scope="col">Leave Description</th>
              <th scope="col">Leave ID</th>
              <th scope="col">Leave Type</th>
              
              <th scope="col">Status</th>
              
              
           </tr>
          </thead>
          <tbody>
          

<%
try{
Connection con=DBconnection.getConnection();

String strQuery="select * from leave_tab where emp_id=?";
HttpSession s=request.getSession(false);
String user=(String)s.getAttribute("username");

PreparedStatement stmt=con.prepareStatement(strQuery);
stmt.setString(1, user);

ResultSet rs = stmt.executeQuery();

while(rs.next()){
%>
<tr>

<td><%=rs.getString(1) %></td>
<td><%=rs.getDate(2) %></td>
<td><%=rs.getDate(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>

</tr>
<%
}
}catch(Exception e)
{
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