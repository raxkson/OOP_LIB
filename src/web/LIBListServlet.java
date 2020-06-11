package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class LIBListServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
                                              throws IOException, ServletException {
     String strPage = request.getParameter("PAGE");
     String strSort = request.getParameter("SORT");
     String strReturn = request.getParameter("RETURN");
     String strFind = request.getParameter("QUERY");
     
     int page = 1;
     String sort = "";
     String Return = "";
     String find = "";
     if(strPage != null)
    	 page = Integer.parseInt(strPage);
     if(strSort != null)
    	 sort = strSort;
     if(strReturn != null)
    	 Return = strReturn;
     if(strFind != null)
    	 find = strFind;
     
    LIBList list = null;
	try {
		list = readDB(page,sort,Return,find);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     request.setAttribute("LIB_LIST", list);
     RequestDispatcher dispatcher;
     if(strPage == null)
    	 dispatcher = request.getRequestDispatcher("LIBListView.jsp?PAGE=1");
     else
    	 dispatcher = request.getRequestDispatcher("LIBListView.jsp");
     dispatcher.forward(request, response);
  }

  
  private LIBList readDB(int page, String sort, String Return, String find) throws Exception {
	LIBList list = new LIBList();
	DBConnector DBcon = new DBConnector();
	Connection conn = DBcon.getConnection();
	Statement stmt = DBcon.getStatement();
	try {
		ResultSet rs = 
		stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM library ORDER BY id ASC;");
		
		if(sort.equals("rentable"))
			rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM library WHERE rental like \"Y\" ORDER BY id ASC;");
		else if(sort.equals("rented"))
			rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM library WHERE rental like \"N\" ORDER BY id ASC;");
		else if(Return.equals("true"))
			rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM library WHERE rental like \"N\" ORDER BY id ASC;");
		else if(find != null)
			rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM library WHERE title like '%"+find+"%' ORDER BY id ASC;");
		
    if(rs.next()) {  
    	int total = rs.getInt("COUNT");
    	int totalIndex = 0;
    	int MaxIndex = 10;
    	int pageIndex = 0;
    	
    	if((total % 10) == 0)
    		totalIndex = total / 10;
    	else
    		totalIndex = (total / 10) + 1;
    	
    	if(page < 10) {
    		pageIndex = 1;
    		MaxIndex = 10;
    	}else {
    		pageIndex = (page / 10) * 10;
    		MaxIndex = pageIndex + 10;
    	}
    	for(int i = pageIndex; i < MaxIndex; i++) {
    		if(i > totalIndex) {
    			list.setLastSize(i);
    			break;
    		}
    		list.setPageIndex(i - pageIndex, i);
    	}
    }
    
    rs = stmt.executeQuery("SELECT * FROM library ORDER BY id ASC LIMIT "+ (page -1)*10 +",10;");
    System.out.println(sort);
    
	if(sort.equals("count"))
		rs = stmt.executeQuery("SELECT * FROM library ORDER BY count DESC LIMIT "+ (page -1)*10 +",10;");
	else if(sort.equals("rentable"))
		rs = stmt.executeQuery("SELECT * FROM library WHERE rental like \"Y\" ORDER BY id ASC LIMIT "+ (page -1)*10 +",10;");
	else if(sort.equals("rented"))
		rs = stmt.executeQuery("SELECT * FROM library WHERE rental like \"N\" ORDER BY id ASC LIMIT "+ (page -1)*10 +",10;");
	else if(Return.equals("true"))
		rs = stmt.executeQuery("SELECT * FROM library WHERE rental like \"N\" ORDER BY id ASC LIMIT "+ (page -1)*10 +",10;");
	else if(find != null)
		rs = stmt.executeQuery("SELECT * FROM library WHERE title like '%"+find+"%' ORDER BY id ASC LIMIT "+ (page -1)*10 +",10;");
	
    for (int cnt = 0; cnt < 10; cnt++) {
    	if(!rs.next()) {
    		list.setLastPage(true);
    		break;
    	}
	        list.setId(cnt, rs.getInt("id"));
	        list.setTitle(cnt, rs.getString("title"));
	        list.setWriter(cnt, rs.getString("writer"));
	        list.setPrice(cnt, rs.getInt("price"));
	        list.setRental(cnt, rs.getString("rental"));
	        list.setCount(cnt, rs.getInt("count"));
	        
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
