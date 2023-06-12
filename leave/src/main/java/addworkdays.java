import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.dao.WorkdayDAO;
import com.ams.dto.WorkdaysDTO;

/**
 * Servlet implementation class addworkdays
 */
@WebServlet("/addworkdays")
public class addworkdays extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addworkdays() {
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
			
			int year=Integer.parseInt(request.getParameter("year"));
			String month=request.getParameter("month");
			int days=Integer.parseInt(request.getParameter("days"));
			
			WorkdaysDTO dto=new WorkdaysDTO();
			dto.setMonth(month);
			dto.setYear(year);
			dto.setWorkdays(days);
			
			WorkdayDAO workdayDAO=new WorkdayDAO();
			int result=workdayDAO.insert(dto);
			
			
			
			if(result==1) {
				response.sendRedirect("http://localhost:8081/leave/Workdays/workdaysmain.jsp");
			}
			else {
				response.sendRedirect("http://localhost:8081/leave/addWorkdays.html");
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
