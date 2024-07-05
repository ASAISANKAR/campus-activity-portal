<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <jsp:include page="prognavbar.jsp" />
</head>
<body>

<div class="container mt-4">
    <div align="center">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Sub-Category</th>
                    <th>Event Date</th>
                    <th>Resource Person</th>
                    <th>Description</th>
                    <th>Action</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
                    java.sql.PreparedStatement ps = conn.prepareStatement("SELECT * FROM event");
                    java.sql.ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) { %>
                    
                        <tr>
                            <td><%= rs.getString("title") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getString("subcategory") %></td>
                            <td><%= rs.getString("date") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("description") %></td>
                            <td><a href="deleteevent.jsp?title=<%= rs.getString("title") %>"><button type="button" class="btn btn-outline-danger">Un-Register</button></a></td>
                            <td><%= rs.getString("status") %></td>
                            
                        </tr>
                    <% }
                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("Exception occurred: " + e.getMessage());
                    e.printStackTrace();
                } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
