<!doctype html>
<%@page import="java.sql.*"%>
<%@page import="leave.*"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>Workdays</title>
</head>
<body>


	<div class="content">

		<div class="container">
			<h2 class="mb-5">Workdays</h2>


			<div class="table-responsive custom-table-responsive">

				<table class="table custom-table">
					<thead>
						<tr>
							<th scope="col">Year</th>
							<th scope="col">Month</th>
							<th scope="col">Working Days</th>
							<th scope="col">Delete</th>
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
                <td><a href="deleteWorkDays.jsp?id=<%=rs.getString(1)%>&id2=<%=rs.getString(2)%>">delete</a></td>
            </tr>
            <tr class="spacer">
							<td colspan="100"></td>
						</tr>
<%	    	
	    	
	    }
 } catch(Exception e) {
	 e.printStackTrace();
 }
 %>  
 	

					</tbody>
				</table>
				
				<form method="get" action="http://localhost:8081/leave/Workdays/addWorkdays.html">
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">New Record</button>
                            
                            <a href="../panel2/Admin.jsp" class="btn btn--radius-2 btn--blue">Back</a>
                        </div>
                        
                    </form>
			</div>


		</div>

	</div>



	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>