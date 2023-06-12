
import leave.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ams.dto.LoginDTO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Connection con=connectivity.getConnection();
			
			String username=request.getParameter("username");
			String password=request.getParameter("password");

			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setEmployee_id(username);
			loginDTO.setPassword(password);
			
			
			
			
			String StrQuery="Select * from employee where employee_id=? and password=?";
			
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setString(1,loginDTO.getEmployee_id());
			stmt.setString(2, loginDTO.getPassword());
			
			ResultSet rs=stmt.executeQuery();
			
			
			 HttpSession session=request.getSession();  //create session
		     session.setAttribute("username",username);
			
			
			 if(rs.next())
			 {
				 if(rs.getString(3).equalsIgnoreCase("admin"))
				 {
				 response.sendRedirect("http://localhost:8081/leave/panel2/Admin.jsp");
				 }
				 else
				 {
					 response.sendRedirect("http://localhost:8081/leave/panel2/Employee.jsp");
				 }
				 
			 }
			 else
			 {
				 response.sendRedirect("http://localhost:8081/leave/Login1/login.jsp");
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
