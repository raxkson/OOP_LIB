package web;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;

public class DBConnector {
	Connection conn = null;
	public DBConnector() {
		
	}
	public Connection getConnection() throws Exception {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?serverTimezone=UTC","root","root");
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			else
				return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new Exception(e);
		}
	}
	public Statement getStatement() throws SQLException {
		return conn.createStatement();
	}
}


