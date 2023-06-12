import java.sql.*;
import java.text.DateFormatSymbols;
import java.util.Calendar;

import leave.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ams.dto.HolidayDTO;
import com.ams.dto.WorkdaysDTO;

/**
 * Servlet implementation class deleteHoliday
 */
@WebServlet("/deleteHoliday")
public class deleteHoliday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteHoliday() {
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
		String holiday_date=request.getParameter("id");
		Connection con=connectivity.getConnection();
		
		HolidayDTO holidayDTO=new HolidayDTO();
		holidayDTO.setHolidayDate(java.sql.Date.valueOf(holiday_date));
		
		String StrQuery="delete from holidays where holiday_date=?";
		PreparedStatement stmt=con.prepareStatement(StrQuery);
		stmt.setDate(1, holidayDTO.getHolidayDate());
		int i=stmt.executeUpdate();
		
		

        Calendar cal=Calendar.getInstance();
        
        cal.setTime(java.sql.Date.valueOf(holiday_date));
        int year1=cal.get(Calendar.YEAR);
        int month1=cal.get(Calendar.MONTH);
        
        DateFormatSymbols dfs=new DateFormatSymbols();
        String[] months=dfs.getMonths();
        
        String monthName=months[month1];
        
        String strQuery1="select * from workingdays";
        
        WorkdaysDTO workdaysDTO=new WorkdaysDTO();
        
    	
    	ResultSet rs = stmt.executeQuery(strQuery1);
    	
    	while(rs.next())
    	{
    		if(rs.getString(2).equalsIgnoreCase(monthName) && (rs.getInt(1)==year1)) {
    			int workdays=rs.getInt(3);
    			workdays++;
    			System.out.print(workdays);
    			workdaysDTO.setMonth(monthName);
    			workdaysDTO.setWorkdays(workdays);
    			workdaysDTO.setYear(year1);
    			
    			String strQuery2="update workingdays set workdays=? where month=? and year=?";
    			PreparedStatement stmt1=con.prepareStatement(strQuery2);
    			stmt1.setInt(1, workdaysDTO.getWorkdays());
    			stmt1.setString(2, workdaysDTO.getMonth());
    			stmt1.setInt(3, workdaysDTO.getYear());
    			stmt1.executeUpdate();
    			
    		}
    	}
    	
    	if(i==1)
        {
        	response.sendRedirect("http://localhost:8081/leave/Holidays/holidaysmaintenance.jsp");
        }
        else {
        	response.sendRedirect(" ");
        }
		
		
		
		}catch(Exception e) {
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
