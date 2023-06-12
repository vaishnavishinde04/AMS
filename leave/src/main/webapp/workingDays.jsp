<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="leave.*"%>
<!DOCTYPE html>
<html>
<head>

 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../CSS/fonts/icomoon/style1.css">

    <link rel="stylesheet" href="../CSS/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../CSS/css/bootstrap.min.css">
    <link rel="stylesheet" href="../CSS/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="../CSS/css/style1.css">
     <link href="../CSS/css/main.css" rel="stylesheet" media="all">
<title>Workingdays Maintaniance Page</title>
</head>
<body>
	
		<div class="content">
    
    <div class="container">
      <h2 class="mb-5">WorkingDays Maintaniance</h2>
      

      <div class="table-responsive">

        <table class="table table-striped custom-table">
          <thead>
				
				<tr>
              
              <th scope="col">Year</th>
              <th scope="col">Month</th>
              <th scope="col">Working Days</th>
              <th scope="col">Delete</th>
             
              <th scope="col"></th>
            </tr>
				
			</thead>
			<tbody>
			<%
			try {
				Connection con = connectivity.getConnection();
				Statement stmt = con.createStatement();
				String StrQuery = "select * from workingdays";
				ResultSet rs = stmt.executeQuery(StrQuery);
				while (rs.next()) {
			%>
			<tr scope="row">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>

				<td><a
					href="deleteWorkDays.jsp?id=<%=rs.getString(1)%>&id2=<%=rs.getString(2)%>">delete</a></td>
			</tr>
			<%
			}

			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
			
			
			
			 </tbody>
		</table>
		<br>
		<br>
		
		
		
		
		   <form method="get" action="http://localhost:8081/leave/addWorkdays.html">
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">New Record</button>
                            
                            <a href="../panel1/AdminPanel.jsp" class="btn btn--radius-2 btn--blue">Back</a>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    

 
    
    

   


</body>
</html>