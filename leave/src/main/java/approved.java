
import java.sql.*;
import leave.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.dto.LeaveDTO;

/**
 * Servlet implementation class approved
 */
@WebServlet("/approved")
public class approved extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approved() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String LID=request.getParameter("id");
		
		LeaveDTO leaveDTO=new LeaveDTO();
		leaveDTO.setLeave_id(LID);
		
		String StrQuery="update leave_tab set status=? where LID=?";
		String status="Approved";
		try{
			Connection con=DBconnection.getConnection();
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setString(2,leaveDTO.getLeave_id());
			stmt.setString(1,status);
			//ResultSet rs=stmt.executeQuery();
			int i=stmt.executeUpdate();
			
			if(i==1)
			{
				response.sendRedirect("http://localhost:8081/leave/Attendance/attendance.jsp");
				
			}
			else {
				response.sendRedirect("");
				
			}
			
		}catch(Exception e){
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
