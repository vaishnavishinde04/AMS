
import leave.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.dto.LeaveDTO;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
			
			String LID=request.getParameter("LID");
			String Ltype=request.getParameter("Ltype");
			String fromd=request.getParameter("fromd");
			String tod=request.getParameter("tod");
			String Ldesc=request.getParameter("desc");
			
			LeaveDTO leaveDTO=new LeaveDTO();
			leaveDTO.setLeave_id(LID);
			leaveDTO.setLeaveType(Ltype);
			leaveDTO.setFromd(java.sql.Date.valueOf(fromd));
			leaveDTO.setTod(java.sql.Date.valueOf(tod));
			leaveDTO.setLeave_desc(Ldesc);
			
			String StrQuery="update leave_tab set  fromd=?, tod=?,Ldesc=?, Ltype=? where LID=?";
			PreparedStatement stmt=con.prepareStatement(StrQuery);

			stmt.setString(5,leaveDTO.getLeave_id());
			stmt.setDate(1,leaveDTO.getFromd());
			stmt.setDate(2,leaveDTO.getTod());
			stmt.setString(3,leaveDTO.getLeave_desc());
			stmt.setString(4,leaveDTO.getLeaveType());
			
			int i=stmt.executeUpdate();
			
			if(i==1)
			{
				response.sendRedirect("http://localhost:8081/leave/succUpd.html");
				
			}
			else {
				response.sendRedirect("http://localhost:8081/leave/update.html");
				
			}
			
			
		}
		catch(Exception e){
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
