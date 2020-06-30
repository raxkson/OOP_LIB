package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBIndexServlet extends HttpServlet {
	Statement stmt = null;
  public void doGet(HttpServletRequest request, HttpServletResponse response)
                                              throws IOException, ServletException {

	  	String strId = request.getParameter("id");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	  try {
		  int id = Integer.parseInt(strId);
		    LIBIndex list = null;
			try {
				list = readDB(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.print("<script>");
				  out.print("if(!alert(\"정확한 id를 입력해주세요\")) document.location = 'lib-list';");
				  out.print("</script>");
				e.printStackTrace();
			}
		     request.setAttribute("LIB_INDEX", list);
		     RequestDispatcher dispatcher;
		     dispatcher = request.getRequestDispatcher("LIBIndexView.jsp");
		     dispatcher.forward(request, response);
		  
	  } catch (Exception e) {
		  out.print("<script>");
		  out.print("if(!alert(\"정확한 id를 입력해주세요\")) document.location = 'lib-list';");
		  out.print("</script>");
	  }
     
  }

  
  private LIBIndex readDB(int id) throws Exception {
		LIBIndex list = new LIBIndex();
		DBConnector DBcon = new DBConnector();
		Connection conn = DBcon.getConnection();
		Statement stmt = DBcon.getStatement();
		  
		try {
			ResultSet rs = 
			stmt.executeQuery("SELECT * FROM library WHERE id="+id+";");
			
		    if(rs.next()) {  
		    	list.setId(rs.getInt("id"));
		        list.setTitle(rs.getString("title"));
		        list.setWriter(rs.getString("writer"));
		        list.setPrice(rs.getInt("price"));
		        list.setRental(rs.getString("rental"));
		        list.setCount(rs.getInt("count"));
		    }
		}
    catch (Exception e){
      throw new ServletException(e);
    }
    finally {
      try {
        stmt.close();
      }
      catch (Exception ignored) {
      }
      try {
        conn.close();
      }
      catch (Exception ignored){
      }
    }
    return list;
  }
  
}
