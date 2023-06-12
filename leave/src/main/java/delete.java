
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
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
			Connection con=connectivity.getConnection();
			String LD=request.getParameter("LID");
			
			LeaveDTO leaveDTO=new LeaveDTO();
			leaveDTO.setLeave_id(LD);
			
			String StrQuery="delete from leave where LID=?";
			
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setString(1,leaveDTO.getLeave_id());
			
			int i=stmt.executeUpdate();
			if(i==1)
			{
				response.sendRedirect("http://localhost:8081/leave/succdlt.html");
			}
			else {
				response.sendRedirect("http://localhost:8081/leave/delete.html");
				
			}
			
		}
		catch(Exception e) {
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
