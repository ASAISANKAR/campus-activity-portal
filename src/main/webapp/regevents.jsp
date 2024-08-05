<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Events</title>
<jsp:include page="navbar.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
  .card {
    margin-bottom: 20px; /* Optional: Add space between cards */
  }
</style>

</head>
<body>
<div class="container">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
        java.sql.PreparedStatement ps = conn.prepareStatement("SELECT * FROM event");
        java.sql.ResultSet rs = ps.executeQuery();

        while (rs.next()) { 
    %>
    
    <div class="col">
      <div class="card">
        <img src="https://dummyimage.com/hd1080" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%= rs.getString("title") %></h5>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Date:</strong> <%= rs.getString("date") %></li>
            <li class="list-group-item"><strong>Category:</strong> <%= rs.getString("category") %></li>
            <li class="list-group-item"><strong>Sub-Category:</strong> <%= rs.getString("subcategory") %></li>
            <li class="list-group-item"><strong>Resource Person:</strong> <%= rs.getString("name") %></li>
          </ul>
          <p class="card-text mt-3"><%= rs.getString("description") %></p>
          <a href="#" class="btn btn-success">Register</a>
        </div>
      </div>
    </div>
    <% 
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.println("Exception occurred: " + e.getMessage());
        e.printStackTrace();
    } %>
  </div>
</div>
</body>
</html>
