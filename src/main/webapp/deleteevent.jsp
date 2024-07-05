<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    String title = request.getParameter("title");
    String eventCategory = request.getParameter("eventCategory");
    String eventSubCategory = request.getParameter("eventSubCategory");
    String datetime = request.getParameter("date");
    
    java.sql.Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        
        String sql2 = "SELECT * FROM event WHERE title=?";
        pstmt = conn.prepareStatement(sql2);
        pstmt.setString(1, title);
        

        ResultSet rs = pstmt.executeQuery();
        System.out.println("Done 1");
        if (rs.next()) {
            String validity = rs.getString("status");
            if (validity.equals("pending")) {
                
                System.out.println("Doing 2");
                String sql = "DELETE FROM event WHERE title=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                
                
                int rows = pstmt.executeUpdate();
                
                if (rows > 0) {
                    System.out.println("Success");
                    response.sendRedirect("events.jsp");
                } else {
                    System.out.println("Fail");
                    response.sendRedirect("events.jsp");
                }
            } else {
                out.println("Failed to delete the event. It is already approved/rejected by the admin.");
            }
        } else {
            out.println("Event not found or invalid credentials.");
        }
    } catch (ClassNotFoundException e) {
        out.println("<p style='color: red;'>Failed to load MySQL JDBC driver: " + e.getMessage() + "</p>");
    } catch (SQLException e) {
        out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p style='color: red;'>Failed to close database connection: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
