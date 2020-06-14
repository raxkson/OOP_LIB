package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBDeleteServlet extends HttpServlet {
	DBConnector DBcon = null;
	Connection conn = null;
	Statement stmt = null;
  public void doPost(HttpServletRequest request, HttpServletResponse response)
                                              throws IOException, ServletException {
     String strDelete = request.getParameter("id");
     response.setContentType("text/html;charset=utf-8");
	 PrintWriter out = response.getWriter();
    if(strDelete != null) {
    	try {
	    	DBcon = new DBConnector();
			conn = DBcon.getConnection();
	    	stmt = DBcon.getStatement();
	    	String sql = "DELETE FROM library WHERE id="+strDelete;
			stmt.executeUpdate(sql);
			out.print("<script>");
			out.print("if(!alert(\""+strDelete+"번 도서 삭제가 완료 되었습니다.\")) document.location = 'lib-list';");
			out.print("</script>");
			//response.sendRedirect("lib-list");
	    	
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    	
    
  }
}
