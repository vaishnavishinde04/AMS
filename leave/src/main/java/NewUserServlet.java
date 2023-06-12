
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.dao.LoginDAO;
import com.ams.dto.LoginDTO;

/**
 * Servlet implementation class NewUser
 */
@WebServlet("/NewUserServlet")
public class NewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUserServlet() {
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
			
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String position=request.getParameter("position");
			
			LoginDTO dto=new LoginDTO();
			dto.setEmployee_id(username);
			dto.setPassword(password);
			dto.setPosition(position);
			
			System.out.print(dto.getEmployee_id());
			
			LoginDAO dao=new LoginDAO();
			int result=dao.insert(dto);
			
			if(result==1)
			{
				response.sendRedirect("http://localhost:8081/leave/Login/LoginMaintainance.jsp");

			}
			else
			{
				response.sendRedirect("Error.jsp");
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
