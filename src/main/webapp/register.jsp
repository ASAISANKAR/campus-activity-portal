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

        // Check if user already exists
        String checkSql = "SELECT * FROM register WHERE username=?";
        stmt = conn.prepareStatement(checkSql);
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // User already exists, handle accordingly
        	response.sendRedirect("exist.jsp");
            
        } else {
            // User does not exist, insert into register table
            String insertSql = "INSERT INTO register (username, password) VALUES (?, ?)";
            stmt = conn.prepareStatement(insertSql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Registration successful");
            } else {
                out.println("Registration failed");
            }
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
