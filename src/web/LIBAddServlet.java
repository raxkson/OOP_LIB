package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBAddServlet extends HttpServlet {
	DBConnector dbConnect = null;
	Connection conn = null;
	Statement stmt = null;
  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws IOException, ServletException {
	  request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  String id = request.getParameter("id");
	  String title = request.getParameter("title");
	  String writer = request.getParameter("writer");
	  String price = request.getParameter("price");
	  
	  try {
	  if((isNumber(id) && isNumber(price))) {
		  out.print("<script>");
		  out.print("if(!alert(\"id나 가격은 숫자로 입력되어야 합니다.\")) document.location = 'LIBAddView.jsp';");
		  out.print("</script>");
		  //response.sendRedirect("LIBAddView.jsp");
	  }
	  else if(id.length() > 10 || price.length() > 10 || title.length() > 40 || price.length() > 20) {
		  out.print("<script>");
		  out.print("if(!alert(\"값이 너무 큽니다.\")) document.location = 'LIBAddView.jsp';");
		  out.print("</script>");
	  }
	  else if(spaceCheck(id) || spaceCheck(title) || spaceCheck(price) || spaceCheck(writer)) {
		  out.print("<script>");
		  out.print("if(!alert(\"정확한 값을 입력해주세요\")) document.location = 'LIBAddView.jsp';");
		  out.print("</script>");
	  }
	  else if((Integer.parseInt(id) < 0 || Integer.parseInt(price) < 0)) {
		  out.print("<script>");
		  out.print("if(!alert(\"id나 가격을 확인해주세요.\")) document.location = 'LIBAddView.jsp';");
		  out.print("</script>");
		  //response.sendRedirect("LIBAddView.jsp");
	  }
	  else if(id == "" || title == "" || writer == "" || price == "")
		  response.sendRedirect("LIBAddDone.jsp?RESULT=Missing");
	  else {
		try {
			dbConnect = new DBConnector();
			conn = dbConnect.getConnection();
			stmt = dbConnect.getStatement();
			if(checkId(id)) {
				String sql = "INSERT INTO library (id, title, writer, price, rental, count) VALUES ("+id+",\""+title+"\",\""+writer+"\","+price+",\"Y\",0);";
				stmt.executeUpdate(sql);
				out.print("<script>");
				out.print("if(!alert(\""+id+"번 도서 추가가 완료 되었습니다.\")) document.location = 'lib-list';");
				out.print("</script>");
				
				//response.sendRedirect("lib-list");
			}else {
				response.sendRedirect("LIBAddDone.jsp?RESULT=Duplicate");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	  }
	  } catch (Exception e){
		  out.print("<script>");
		  out.print("if(!alert(\"입력값을 확인해주세요.\")) document.location = 'LIBAddView.jsp';");
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
