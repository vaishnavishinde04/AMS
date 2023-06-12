<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="leave.*" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
<%
try {
	HttpSession s = request.getSession(false);
	String user = (String) s.getAttribute("username");
%>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Employee page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon
		============================================ -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap CSS
		============================================ -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- nalika Icon CSS
		============================================ -->
<link rel="stylesheet" href="css/nalika-icon.css">
<!-- owl.carousel CSS
		============================================ -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.css">
<link rel="stylesheet" href="css/owl.transitions.css">
<!-- animate CSS
		============================================ -->
<link rel="stylesheet" href="css/animate.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="css/normalize.css">
<!-- meanmenu icon CSS
		============================================ -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- main CSS
		============================================ -->
<link rel="stylesheet" href="css/main.css">
<!-- morrisjs CSS
		============================================ -->
<link rel="stylesheet" href="css/morrisjs/morris.css">
<!-- mCustomScrollbar CSS
		============================================ -->
<link rel="stylesheet"
	href="css/scrollbar/jquery.mCustomScrollbar.min.css">
<!-- metisMenu CSS
		============================================ -->
<link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
<link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
<!-- calendar CSS
		============================================ -->
<link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
<link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
<!-- style CSS
		============================================ -->
<link rel="stylesheet" href="style.css">
<!-- responsive CSS
		============================================ -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr JS
		============================================ -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="left-sidebar-pro">
		<nav id="sidebar" class="">
			<div class="sidebar-header">
				<a href="index.html"><img class="main-logo"
					src="img/logo/11.jpeg" alt="" /></a> <strong><img
					src="img/logo/11.jpeg" alt="" /></strong>
			</div>
			<div class="nalika-profile">
				<div class="profile-dtl">
					<a href="#"><img src="img/<%=user%>.jpg" alt="" /></a>
					<h2><%=user%>
						<span class="min-dtn"></span>
					</h2>
				</div>

			</div>
			<div class="left-custom-menu-adp-wrap comment-scrollbar">
				<nav class="sidebar-nav left-sidebar-menu-pro">
					<ul class="metismenu" id="menu1">
						<li class="active"><a
							href="#"> <i
								class="icon nalika-home icon-wrap"></i> <span
								class="mini-click-non">Profile</span>
						</a></li>
						<li><a
							href="http://localhost:8081/leave/Attendance/emp_attendance.jsp"
							aria-expanded="false"><i class="icon nalika-mail icon-wrap"></i>
								<span class="mini-click-non">Attendance</span></a></li>
						<li><a
							href="http://localhost:8081/leave/Attendance/leave.html"
							aria-expanded="false"><i
								class="icon nalika-diamond icon-wrap"></i> <span
								class="mini-click-non">Apply leave</span></a></li>
						<li><a
							href="http://localhost:8081/leave/Attendance/leaveStatus.jsp"
							aria-expanded="false"><i
								class="icon nalika-pie-chart icon-wrap"></i> <span
								class="mini-click-non">Leave Status</span></a></li>
						
					</ul>
				</nav>
			</div>
		</nav>
	</div>
	<!-- Start Welcome area -->
	<div class="all-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="logo-pro">
						<a href="index.html"><img class="main-logo"
							src="img/logo/logo.png" alt="" /></a>
					</div>
				</div>
			</div>
		</div>
		<div class="header-advance-area">
			<div class="header-top-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="header-top-wraper">
								<div class="row">
									<div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
										<div class="menu-switcher-pro">
											<button type="button" id="sidebarCollapse"
												class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
												<i class="icon nalika-menu-task"></i>
											</button>
										</div>
									</div>

									<div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
										<div class="header-top-menu tabl-d-n hd-search-rp">
											<div class="breadcome-heading">
												<form role="search" class="">
													<h2 style="color: white;">Attendance Management System</h2>

												</form>
											</div>
										</div>
									</div>
									<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
										<div class="header-right-info">
											<ul class="nav navbar-nav mai-top-nav header-right-menu">


												<li class="nav-item"><a href="#" data-toggle="dropdown"
													role="button" aria-expanded="false"
													class="nav-link dropdown-toggle"> <i
														class="icon nalika-user"></i> <span class="admin-name"><%=user %></span>
														<i class="icon nalika-down-arrow nalika-angle-dw"></i>
												</a>
													<ul role="menu"
														class="dropdown-header-top author-log dropdown-menu animated zoomIn">

														<li><a
															href="http://localhost:8081/leave/Login1/login.jsp"><span
																class="icon nalika-unlocked author-log-ic"></span> Log
																Out</a></li>
													</ul></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Mobile Menu end -->
			<div class="breadcome-area">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="breadcome-list">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<div class="breadcomb-wp">
											<div class="breadcomb-icon">
												<i class="icon nalika-home"></i>
											</div>
											<div class="breadcomb-ctn">
												<h2>Employee</h2>
												<p>
													Welcome to <span class="bread-ntd">Employee Page</span>
												</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<%
	 int empcount=0;
	 int logintime=0;
	 int loginsavailabe=0;

	   
	   Connection con1=DBconnection.getConnection();
	 	Statement stmt1 = con1.createStatement();
	 	Statement stmt2 = con1.createStatement();
	 	Statement stmt3 = con1.createStatement();
	 	
	 	String StrQuery1 = "select count(*) from employee";
	 	
	 	String StrQuery3 = "select count(*) from employee";
	 	
	 	 ResultSet rs1 = stmt1.executeQuery(StrQuery3);
	 	    if(rs1.next()) {
	 	    	empcount=rs1.getInt(1);
	 	    }
	 	    	
	 	 
	 	  ResultSet rs3 = stmt3.executeQuery(StrQuery1);
	 	   if(rs3.next())
	 	   {
	 		  loginsavailabe=rs3.getInt(1);
	 	   }
	 	    
   
   %>   
		
		
		
		<div class="section-admin container-fluid">
			<div class="row admin text-center">
				<div class="col-md-12">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<div class="admin-content analysis-progrebar-ctn res-mg-t-15">
								<h4 class="text-left text-uppercase">
									<b>Attendance Management System</b>
								</h4>
								
								<div class="">
									<div style="width: 99%;" class=""></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"
							style="margin-bottom: 1px;">
							<div class="admin-content analysis-progrebar-ctn res-mg-t-30">
								<h4 class="text-left text-uppercase">
									<b>Total Employee</b>
								</h4>
								<div class="row vertical-center-box vertical-center-box-tablet">
									
									<div class="col-xs-9 cus-gh-hd-pro">
										<h2 class="text-right no-margin"><%=empcount %></h2>
									</div>
								</div>
								<div class="">
									<div style="width: 80%;" class=""></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<div class="admin-content analysis-progrebar-ctn res-mg-t-30">
								<h4 class="text-left text-uppercase">
									<b>Total Logins Available</b>
								</h4>
								<div class="row vertical-center-box vertical-center-box-tablet">
									
									<div class="col-xs-9 cus-gh-hd-pro">
										<h2 class="text-right no-margin"><%=loginsavailabe %></h2>
									</div>
								</div>
								<div class="">
									<div style="width: 60%;" class="progress-bar bg-blue"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<div class="admin-content analysis-progrebar-ctn res-mg-t-30">
								<h4 class="text-left text-uppercase">
									<b>Leave-Applications</b>
								</h4>
								<div class="row vertical-center-box vertical-center-box-tablet">
									<div class="text-left col-xs-3 mar-bot-15">
										<label class="label bg-purple"></label>
									</div>
									<div class="col-xs-9 cus-gh-hd-pro">
										<h2 class="text-right no-margin">46</h2>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="product-status-wrap">
						<h4>Team Members</h4>

						<table>
							<tr>
								<th>Image</th>
								<th>Name</th>
								<th>Class</th>
								<th>PRN Number</th>
								<th>Roll No</th>
								<th>Mobile No</th>
								<th>Performance Status</th>
							</tr>
							<tr>
								<td><img src="img/vaishnavi.jpeg" alt="" /></td>
								<td>Vaishnavi Shinde</td>
								<td>TE-C</td>
								<td>72081457A</td>
								<td>COTC41</td>
								<td>9852051345</td>
								<td>
									<button class="pd-setting">Good</button>
								</td>
							</tr>
							<tr>
								<td><img src="img/Nandu.jpg" alt="" /></td>
								<td>Nandkumar Chavan</td>
								<td>TE-C</td>
								<td>72150358G</td>
								<td>COTC09</td>
								<td>7709462232</td>
								<td>
									<button class="pd-setting">Good</button>
								</td>
							</tr>
							<tr>
								<td><img src="img/Aditi.jpg" alt="" /></td>
								<td>Aditi Umare</td>
								<td>TE-B</td>
								<td>72458935B</td>
								<td>COTB18</td>
								<td>9665543652</td>
								<td>
									<button class="pd-setting">Good</button>
								</td>
							</tr>

						</table>

					</div>
				</div>
			</div>
		</div>
	</div>


	</div>
	<!-- jquery
		============================================ -->
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- wow JS
		============================================ -->
	<script src="js/wow.min.js"></script>
	<!-- price-slider JS
		============================================ -->
	<script src="js/jquery-price-slider.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- sticky JS
		============================================ -->
	<script src="js/jquery.sticky.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="js/jquery.scrollUp.min.js"></script>
	<!-- mCustomScrollbar JS
		============================================ -->
	<script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/scrollbar/mCustomScrollbar-active.js"></script>
	<!-- metisMenu JS
		============================================ -->
	<script src="js/metisMenu/metisMenu.min.js"></script>
	<script src="js/metisMenu/metisMenu-active.js"></script>
	<!-- sparkline JS
		============================================ -->
	<script src="js/sparkline/jquery.sparkline.min.js"></script>
	<script src="js/sparkline/jquery.charts-sparkline.js"></script>
	<!-- calendar JS
		============================================ -->
	<script src="js/calendar/moment.min.js"></script>
	<script src="js/calendar/fullcalendar.min.js"></script>
	<script src="js/calendar/fullcalendar-active.js"></script>
	<!-- float JS
		============================================ -->
	<script src="js/flot/jquery.flot.js"></script>
	<script src="js/flot/jquery.flot.resize.js"></script>
	<script src="js/flot/curvedLines.js"></script>
	<script src="js/flot/flot-active.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="js/main.js"></script>

</body>
<%
} catch (Exception e) {
e.printStackTrace();

}
%>

</html>