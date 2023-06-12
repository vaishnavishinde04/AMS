
import leave.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class retrive
 */
@WebServlet("/retrive")
public class retrive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrive() {
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
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from leave_tab");
			
			
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<html><body>");
			out.println("<table border=1px padding=20px cellspacing=1px>");
			out.println("<tr><th>Leave ID</th><th>From</th><th>To</th><th>Leave Desc</th><th>Leave Type</th></tr>");
			while(rs.next())
			{
				String LID=rs.getString("LID");
				Date fromd=rs.getDate("fromd");
				Date tod=rs.getDate("tod");
				String Ldesc=rs.getString("Ldesc");
				String LType=rs.getString("LType");
				out.println("<tr><td>"+LID+"</td><td>"+fromd+"</td><td>"+tod+"</td><td>"+Ldesc+"</td><td>"+LType+"</td></tr>");
			}
			
			
			out.println("</table>");
			out.println("</body></html>");
			
			
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
