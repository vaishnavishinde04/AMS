
import leave.*;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormatSymbols;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import leave.DBconnection;
import leave.connectivity;

/**
 * Servlet implementation class Generate_attendace
 */
@WebServlet("/Generate_attendace")
public class Generate_attendace extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Generate_attendace() {
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
			 
			Connection con=DBconnection.getConnection();
			Connection conn=connectivity.getConnection();
			String strQuery="select workingdays.year,workingdays.month,workingdays.workdays,employee.employee_id from workingdays cross join employee where year=? and month=?";
			PreparedStatement stmnt=conn.prepareStatement(strQuery);
			stmnt.setInt(1, year);
			stmnt.setString(2, month);
			
			
			ResultSet rs=stmnt.executeQuery();
			while(rs.next())
			{
				
				int workdays=rs.getInt(3);
				String employee_id=rs.getString(4);
				
				
				String StrQuery1="insert into emp_attendance values(?,?,?,?)";
				PreparedStatement stmt=conn.prepareStatement(StrQuery1);
				stmt.setInt(1, year);
				stmt.setString(2, month);
				stmt.setString(3, employee_id);
				
				stmt.setInt(4,workdays);
				int i=stmt.executeUpdate();
				if(i==1)
				{
					System.out.print("successfull");
				}
				else
				{
					System.out.print("fail");
				}
				
				String strQuery1="select * from leave_tab where emp_id=?";
				PreparedStatement stmt1=con.prepareStatement(strQuery1);
				stmt1.setString(1, employee_id);
			    ResultSet rs1=stmt1.executeQuery();
			    while(rs1.next())//leave table
				{                
			    	String emp_id=rs1.getString(6);
					System.out.print(emp_id);
					 Date start_date=rs1.getDate(2);
				     Date end_date=rs1.getDate(3);
				     String LID=rs1.getString(1);
				     
				     
				     Calendar cal=Calendar.getInstance();
				        cal.setTime(start_date);
				        int year1=cal.get(Calendar.YEAR);
				        int month1=cal.get(Calendar.MONTH);
				        int maxDays1=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				        
				        DateFormatSymbols dfs=new DateFormatSymbols();
				        String[] months=dfs.getMonths();
				        String monthName=months[month1];
				        
				       
			            
				        Calendar cal1=Calendar.getInstance();
				        cal1.setTime(end_date);
				        int year2=cal1.get(Calendar.YEAR);
				        int month2=cal1.get(Calendar.MONTH);
				        int maxDays2=cal1.getActualMaximum(Calendar.DAY_OF_MONTH);
				        
				        String monthName1=months[month2];
				        
				        
					if( ((monthName.equalsIgnoreCase(month)) || (monthName1.equalsIgnoreCase(month))) && (year1==year))
					{
						
						//System.out.print("successf");
					        if(monthName.equalsIgnoreCase(monthName1)) 
					        {
					        	
					        	String sql="select datediff(?,?) as leave_diff from leave_tab where emp_id=? and fromd=? and tod=? and status=?";
//					        	String sql="select * from leave_tab where emp_id=? and fromd=? and tod=?";
					            String status="Approved";
					        	PreparedStatement stmt4=con.prepareStatement(sql);
					        	stmt4.setDate(1, end_date);
					        	stmt4.setDate(2, start_date);
					        	stmt4.setString(3, emp_id);
					        	stmt4.setDate(5, end_date);
					        	stmt4.setDate(4, start_date);
					        	stmt4.setString(6, status);
					        	
					        	
					        	ResultSet rsdiff=stmt4.executeQuery();
					        	int leavediff=0;
					        		if(rsdiff.next())
					        	{
					        	leavediff=rsdiff.getInt(1);
//					        	System.out.print("ld"+leavediff);
//					        	System.out.print("wk"+workdays);
					        	
					        	//holidays
					        	String sql1="select * from holidays where holiday_date between ? and ?";
					        	
					        	PreparedStatement stmt5=conn.prepareStatement(sql1);
					        	stmt5.setDate(1, start_date);
					        	stmt5.setDate(2, end_date);
					        	ResultSet holiday_rs=stmt5.executeQuery();
					        	int count=0;
					        	while(holiday_rs.next())
					        	{
					        		count++;
					        	}
					        	
					        	
					        	int total_attendance=workdays-leavediff+count;
					        	System.out.print(total_attendance);
				        		String StrQuery2="update emp_attendance set attendance=? where year=? and month=? and employee_id=?";
								PreparedStatement stmt2=conn.prepareStatement(StrQuery2);
								stmt2.setInt(1, total_attendance);
								stmt2.setInt(2, year);
								stmt2.setString(3, month);
								stmt2.setString(4, employee_id);
								
				        		int j=stmt2.executeUpdate();
				        		if(j==1) 
				        		{
				        			System.out.print("succ");
				        		}
				        		else
				        		{
				        			System.out.print("fail");
				        		}
			
					        	}
					        				
					        }
					        else {
					        	if(monthName.equalsIgnoreCase(month))
					        	{
					        		int day_of_Month1=cal.get(Calendar.DAY_OF_MONTH);
					        	
					        	System.out.println("day of month:"+monthName+day_of_Month1);
					        	int firstMonthLeaveDiff=maxDays1-day_of_Month1;
					        	System.out.println(" max day :"+maxDays1);
//                                 String sql1="select * from holidays where holiday_date between ? and ?";
//					        	
//					        	PreparedStatement stmt5=conn.prepareStatement(sql1);
//					        	stmt5.setDate(1, start_date);
//					        	stmt5.setDate(2, end_date);
//					        	ResultSet holiday_rs=stmt5.executeQuery();
//					        	int count=0;
//					        	while(holiday_rs.next())
//					        	{
//					        		count++;
//					        	}
//					        	System.out.print(count);
					        	
					        	int total_attendance=workdays-firstMonthLeaveDiff;
					        	
					        	System.out.println("\nTotal 1st month"+total_attendance);
					        	String StrQuery2="update emp_attendance set attendance=? where year=? and month=? and employee_id=?";
								PreparedStatement stmt4=conn.prepareStatement(StrQuery2);
								stmt4.setInt(1, total_attendance);
								stmt4.setInt(2, year1);
								stmt4.setString(3, monthName);
								stmt4.setString(4, employee_id);
								
				        		int j=stmt4.executeUpdate();
				        		if(j==1) 
				        		{
				        			System.out.print("succ");
				        		}
				        		else
				        		{
				        			System.out.print("fail");
				        		}
					        	}
					        	if(monthName1.equalsIgnoreCase(month))
					        	{
				        		int day_of_Month2=cal1.get(Calendar.DAY_OF_MONTH);
						        System.out.println("\nday of month:"+monthName1+day_of_Month2);
						        
						        
						        int secondMonthLeaveDiff=0;
				        		secondMonthLeaveDiff=day_of_Month2;
				        		 System.out.println("secondMo"+secondMonthLeaveDiff);
				        		 
				        		 
				        		int total_attendance1=workdays-secondMonthLeaveDiff;
				        		System.out.println("\nTotal 2nd month"+total_attendance1);
				        		
					        	String StrQuery3="update emp_attendance set attendance=? where year=? and month=? and employee_id=?";
								PreparedStatement stmt3=conn.prepareStatement(StrQuery3);
								stmt3.setInt(1, total_attendance1);
								stmt3.setInt(2, year2);
								stmt3.setString(3, monthName1);
								stmt3.setString(4, employee_id);
								
				        		int k=stmt3.executeUpdate();
				        		if(k==1) 
				        		{
				        			System.out.print("succ");
				        		}
				        		else
				        		{
				        			System.out.print("fail");
				        		}
					        	
					        	}
					        }     
					        }
					}
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
