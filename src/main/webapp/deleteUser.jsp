<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name=request.getParameter("username");
   
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        String sql = "DELETE from register  WHERE username=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.executeUpdate();
        System.out.println("Deleted Successfully");
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("userprofile.jsp");
%>
