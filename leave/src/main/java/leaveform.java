
import leave.*;
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ams.dto.LeaveDTO;

/**
 * Servlet implementation class leaveform
 */
@WebServlet("/leaveform")
public class leaveform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public leaveform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			Connection con=DBconnection.getConnection();
			
			HttpSession s=request.getSession(false);  
		      String user=(String)s.getAttribute("username"); 
			String LID=request.getParameter("LID");
			String Ltype=request.getParameter("Ltype");
			//SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String fromd=request.getParameter("fromd");
			//Date from_date=dateFormat.parse(from);
			
			String tod=request.getParameter("tod");
			//Date to_date=dateFormat.parse(to);
			
			String Ldesc=request.getParameter("desc");
			String status="Pending";
			
			LeaveDTO leaveDTO=new LeaveDTO();
			leaveDTO.setEmployee_id(user);
			leaveDTO.setFromd(java.sql.Date.valueOf(fromd));
			leaveDTO.setTod(java.sql.Date.valueOf(tod));
			leaveDTO.setLeave_desc(Ldesc);
			leaveDTO.setLeave_id(LID);
			leaveDTO.setLeaveType(Ltype);
			leaveDTO.setStatus(status);
			
			
			
		//	java.sql.Date sqlDate=new java.sql.Date(from_date.getTime());
			//java.sql.Date sqlDate1=new java.sql.Date(to_date.getTime());
			String StrQuery="insert into leave_tab values(?,?,?,?,?,?,?)";
			
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setString(6,leaveDTO.getEmployee_id());
			stmt.setString(1,leaveDTO.getLeave_id());
			
			stmt.setDate(2,leaveDTO.getFromd());
			stmt.setDate(3,leaveDTO.getTod());
			stmt.setString(4,leaveDTO.getLeave_desc());
			stmt.setString(5,leaveDTO.getLeaveType());
			stmt.setString(7,leaveDTO.getStatus());
			
			
			int i=stmt.executeUpdate();
			
			if(i==1)
			{
				response.sendRedirect("http://localhost:8081/leave/succSub.html");
				
			}
			else {
				response.sendRedirect("http://localhost:8081/leave/leaveform");
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
