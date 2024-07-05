<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.time.LocalDateTime, java.sql.Timestamp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;	

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
       
       String sql = "SELECT * FROM register WHERE username=? AND password=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        System.out.println(username);
        System.out.println(password);

        rs = stmt.executeQuery();
        System.out.println("Query Executed");
        int lk=0;
        for(int i=0;i<username.length();i++)
        {
        	if(username.charAt(i)-'0'<0 || username.charAt(i)-'0'>9)
        	{
        		lk=1;
        	}
        }
        for(int i=0;i<password.length();i++)
        {
        	if(password.charAt(i)-'0'<0 || password.charAt(i)-'0'>9)
        	{
        		lk=1;
        	}
        }
        if (rs.next()) {	
        	  String insertSql = "INSERT INTO LOGIN (username, password, datetime,validity) VALUES (?, ?, ?,?)";
              PreparedStatement insertStmt = conn.prepareStatement(insertSql);
              insertStmt.setString(1, username);
              insertStmt.setString(2, password);
              insertStmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
              insertStmt.setString(4,"true");
              insertStmt.executeUpdate();
             
              
              
            System.out.println("Logs updated");
        	
        	if((username.equals("admin") && password.equals("admin")) || (username.equals("ss") && password.equals("ss")))
        		response.sendRedirect("adminhomepage.jsp");
        	else if(username.length()==10 && password.length()==10 && lk==0)
        	{
        		response.sendRedirect("proghomepage.jsp");
        	}
        	else
        		response.sendRedirect("home.jsp");  
        } 
        else
        {
        	String insertSql = "INSERT INTO LOGIN (username, password, datetime,validity) VALUES (?, ?, ?,?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, username);
            insertStmt.setString(2, password);
            insertStmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            insertStmt.setString(4,"false");
            insertStmt.executeUpdate();
            response.sendRedirect("index.jsp");
        }
        	
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
    
%>
