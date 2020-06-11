package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBReturnServlet extends HttpServlet {
	DBConnector DBcon = null;
	Connection conn = null;
	Statement stmt = null;
  public void doPost(HttpServletRequest request, HttpServletResponse response)
                                              throws IOException, ServletException {
     String strReturn = request.getParameter("id");
    if(strReturn != null) {
    	try {
	    	DBcon = new DBConnector();
			conn = DBcon.getConnection();
	    	stmt = DBcon.getStatement();
	    	String sql = "UPDATE library SET rental=\"Y\" WHERE id="+strReturn;
			stmt.executeUpdate(sql);
	    	response.sendRedirect("lib-list");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    	
    
  }
}
