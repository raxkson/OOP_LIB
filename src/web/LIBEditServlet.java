package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBEditServlet extends HttpServlet {
	DBConnector dbConnect = null;
	Connection conn = null;
	Statement stmt = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		
		LIBIndex list = null;
		try {
		list = readDB(id);
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		request.setAttribute("LIB_INDEX", list);
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher("LIBEditView.jsp");
		dispatcher.forward(request, response);
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
		
	
  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException {
	  request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  String id = request.getParameter("id");
	  String title = request.getParameter("title");
	  String writer = request.getParameter("writer");
	  String price = request.getParameter("price");
	  

		System.out.println(price);
	  try {
		  if((isNumber(id) && isNumber(price))) {
			  out.print("<script>");
			  out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
			  out.print("</script>");
			  //response.sendRedirect("LIBAddView.jsp");
		  }
		  else if(id.length() > 10 || price.length() > 10 || title.length() > 30 || price.length() > 30) {
			  out.print("<script>");
			  out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
			  out.print("</script>");
		  }
		  else if(spaceCheck(id) || spaceCheck(title) || spaceCheck(price) || spaceCheck(writer)) {
			  out.print("<script>");
			  out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
			  out.print("</script>");
		  }
		  else if((Integer.parseInt(id) < 0 || Integer.parseInt(price) < 0)) {
			  out.print("<script>");
			  out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
			  out.print("</script>");
			  //response.sendRedirect("LIBAddView.jsp");
		  }
		  else if(id == "" || title == "" || writer == "" || price == "")
			  response.sendRedirect("LIBEditDone.jsp?RESULT=Missing");
		  else {
			try {
				dbConnect = new DBConnector();
				conn = dbConnect.getConnection();
				stmt = dbConnect.getStatement();
				String sql = "UPDATE library SET title = \""+title+"\", writer = \""+writer+"\", price = "+price+" WHERE id = "+id+";";
				stmt.executeUpdate(sql);
				out.print("<script>");
				out.print("if(!alert(\""+id+"번 도서 수정이 완료 되었습니다.\")) document.location = 'lib-list';");
				out.print("</script>");
					//response.sendRedirect("lib-list");
			} catch (Exception e) {
				out.print("<script>");
			    out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
			    out.print("</script>");
				throw new ServletException(e);
			}
		  }
	  } catch (Exception e){
		  out.print("<script>");
		  out.print("if(!alert(\"입력값을 확인해주세요.\")) window.history.back();");
		  out.print("</script>");
	  } 
  }
  private boolean checkId(String id) throws Exception {
	  ResultSet rs = null;
	  try {
		  String sql = "SELECT * FROM library WHERE id =" + id;
		  rs = stmt.executeQuery(sql);
		  if(rs.next())
			  return false;
		  else
			  return true;
	  } catch(Exception e){
		  throw new ServletException(e);
	  }
  }
  static boolean isNumber(String input) {
	    char tmp;
	    boolean result = true;
	    for(int i = 0; i < input.length(); i++) {
	    	tmp = input.charAt(i);
	    	if(tmp == '\"')
	    		result = false;
	    	if('0' <= tmp && tmp <= '9')
	    		result = false;
	    }
	    
	    return result;
  }
  public boolean spaceCheck(String spaceCheck)
  {
	  int tmp = 0;
      for(int i = 0 ; i < spaceCheck.length() ; i++)
      {
          if(spaceCheck.charAt(i) == ' ')
              tmp++;
      }
      if(tmp == spaceCheck.length())
    	  return true;
      return false;
  }
}
