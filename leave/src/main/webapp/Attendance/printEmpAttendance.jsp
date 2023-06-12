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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

<title>Attendance</title>
</head>
<body onload="printHTML()">
<div id="myElement">



	<h1>Attendance Report</h1>

		<%
		try {
			
			HttpSession s = request.getSession(false);
			String user = (String) s.getAttribute("username");
			
			HttpSession s1 = request.getSession(false);
			int year = (int) s1.getAttribute("year");
			System.out.print("year");
			String month = (String) s1.getAttribute("month");
			
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

		Year:
		<br>
		<%=rs.getInt(1)%><br>

		Month:<br>
		<%=rs.getString(2)%><br>
		Attendance:<br>
		<%=rs.getInt(4)%><br>
		
		
		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>



</div>


		<script>
        var element = document.getElementById('myElement');

        html2pdf(element, {
            filename: 'Attendance.pdf',
            margin: [0, 0, 0, 0],
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { dpi: 192, letterRendering: true },
            jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
        }).then(function() {
            // redirect to the new HTML file
            window.location.href = 'http://localhost:8081/leave/succSub.html';
        });
        
        
        
    </script>

		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>