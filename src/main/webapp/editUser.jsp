<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%


    String username = request.getParameter("username");
    String password = "";
    
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM register WHERE username=?");
        ps.setString(1,username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            password=rs.getString("password");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="update.jsp" method="post">
         <input type="hidden" name="name" value="<%= username %>">
        Name: <input type="text" name="username" value="<%= username %>"><br>
        Password: <input type="text" name="password" value="<%= password %>"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
