<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
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

        if (rs.next()) {	
            response.sendRedirect("home.jsp");  
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
    response.sendRedirect("index.jsp");
    
%>
