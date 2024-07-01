<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name=request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        String sql = "UPDATE register SET username=?,password=? WHERE username=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3,name);
        ps.executeUpdate();
        System.out.println("Updated Successfully");
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("userprofile.jsp");
%>
