<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name=request.getParameter("datetime");
   
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        String sql = "DELETE from login  WHERE datetime=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.executeUpdate();
        System.out.println("Log Deleted Successfully");
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("logs.jsp");
%>
