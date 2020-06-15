package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBRentServlet extends HttpServlet {
	DBConnector dbConnect = null;
	Connection conn = null;
	Statement stmt = null;
  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException {
	  request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  String id = request.getParameter("id");
	  if((isNumber(id))) {
		  out.print("<script>");
		  out.print("if(!alert(\"id는 숫자로 입력되어야 합니다.\")) document.location = 'LIBRentView.jsp';");
		  out.print("</script>");
		  //response.sendRedirect("LIBRentView.jsp");
	  }
	  else if(id == "")
		  response.sendRedirect("LIBRentDone.jsp?RESULT=Missing");
	  else {
		try {
			dbConnect = new DBConnector();
			conn = dbConnect.getConnection();
			stmt = dbConnect.getStatement();
			int check = checkRent(id);
			if(check == 2) {
				String sql = "UPDATE library SET rental=\"N\" WHERE id="+id;
				stmt.executeUpdate(sql);
				sql = "UPDATE library SET count = count + 1 WHERE id="+id;
				stmt.executeUpdate(sql);
				response.setHeader("Refresh", "0; URL=lib-list");
				out.print("<script>");
				out.print("if(!alert(\""+id+"번 도서 대여가 완료 되었습니다.\")) document.location = 'lib-list';");
				out.print("</script>");
				//response.sendRedirect("lib-list");
			}else if (check == 1) {
				response.sendRedirect("LIBRentDone.jsp?RESULT=Rented");
			}else {
				response.sendRedirect("LIBRentDone.jsp?RESULT=None");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	  }
  }
  private int checkRent(String id) throws Exception {
	  ResultSet rs = null;
	  try {
		  String sql = "SELECT * FROM library WHERE id =" + id;
		  rs = stmt.executeQuery(sql);
		  if(rs.next()) {
			  String rental = rs.getString("rental");
			  if(rental.charAt(0) == 'Y')
				  return 2;
			  else
				  return 1;
		  }
		  else
			  return 0;
	  } catch(Exception e){
		  throw new ServletException(e);
	  }
  }
  static boolean isNumber(String input) {
	    char tmp;
	    boolean result = true;
	    for(int i = 0; i < input.length(); i++) {
	    	tmp = input.charAt(i);
	    	if('0' <= tmp && tmp <= '9')
	    		result = false;
	    }
	    
	    return result;
  }
  
}
