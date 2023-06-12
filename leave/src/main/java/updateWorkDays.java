
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

/**
 * Servlet implementation class updateWorkDays
 */
@WebServlet("/updateWorkDays")
public class updateWorkDays extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateWorkDays() {
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
			int year=Integer.parseInt(request.getParameter("year"));
			String month=request.getParameter("month");
			int days=Integer.parseInt(request.getParameter("days"));
			String StrQuery="update workingdays set workdays=? where year=? and month=?";
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setInt(1, days);
			stmt.setInt(2, year);
			stmt.setString(3, month);
			
			int i=stmt.executeUpdate();
			if(i==1) {
				response.sendRedirect("http://localhost:8081/leave/workingDays.jsp");
			}
			else {
				response.sendRedirect("http://localhost:8081/leave/updateWorkdays.jsp");
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
