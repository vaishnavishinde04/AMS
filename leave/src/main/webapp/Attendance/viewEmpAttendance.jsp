<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="leave.*"%>
<%@page import="com.ams.dto.AttendanceDTO"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
 
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
              <th scope="col">Attendance</th>
            </tr>
          </thead>
          <tbody>
          
 <%
			try {
				int year = Integer.parseInt(request.getParameter("year"));
				String month = request.getParameter("month");
				HttpSession s = request.getSession(false);
				String user = (String) s.getAttribute("username");
				
				
				 HttpSession session1=request.getSession();  //create session
			     session1.setAttribute("year",year);
			     session1.setAttribute("month",month);
			     
				AttendanceDTO attendanceDTO = new AttendanceDTO();
				attendanceDTO.setYear(year);
				attendanceDTO.setMonth(month);
				attendanceDTO.setEmployeeID(user);

				Connection conn = connectivity.getConnection();
				//Statement stmt1=conn.createStatement();
				String StrQuery1 = "select * from emp_attendance where year=? and month=? and employee_id=?";
				PreparedStatement stmnt = conn.prepareStatement(StrQuery1);
				stmnt.setInt(1, attendanceDTO.getYear());
				stmnt.setString(2, attendanceDTO.getMonth());
				stmnt.setString(3, attendanceDTO.getEmployeeID());
				ResultSet rs = stmnt.executeQuery();
				while (rs.next()) {
			%>
          
            <tr scope="row">
 <td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getInt(4)%></td>
			</tr>
			<%
			}

			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
           
            
          </tbody>
        </table>
         
           <button onclick="printHTML()" class="btn btn--radius-2 btn--blue">Generate Report</button>  
           <a href="../panel2/Employee.jsp" class="btn btn--radius-2 btn--blue">Back</a>           
      </div>


    </div>

  </div>
    
    <script>
      function printHTML() {
    	  
    	  // Remove the print button from the DOM
          const printButton = document.querySelector("button");
          printButton.parentNode.removeChild(printButton);
    	  
        const element = document.querySelector("html");
      //  element.style.backgroundColor = "";
        const opt = {
        	    filename: "my-document.pdf",
        	    margin: [0.5, 0.5, 0.5, 0.5], 
        	    image: { type: 'jpeg', quality: 0.98 }, 
        	    html2canvas: { scale: 2 }, 
        	    jsPDF: {
        	    	unit: 'in', format: 'letter', orientation: 'portrait',setFillColor: [0, 0, 0] } 
        	  };
        html2pdf().set(opt).from(element).save();
      }
    </script>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>