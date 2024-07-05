<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<title>Event Registration Form.</title>
<jsp:include page="prognavbar.jsp" />

<style>
body {
  font-family: "Raleway", sans-serif;
  background-color: #ff6655;
}
h1 {
  text-align: center;
  margin: 20px auto;
}
form {
  width: 70%;
  margin: auto;
}
fieldset {
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 10px;
  margin: 20px auto;
  box-shadow: 0 0 5px #333;
  background-color: #eee;
}
label {
  display: block;
  
  margin-bottom: 5px;
}
input[type="text"],input[type="email"],select{
  width: calc(100% - 20px);
  height: 40px;
  padding: 5px;
  border-radius: 6px;
  border: 1px solid #ccc;
  margin-bottom: 10px;
}
button {
  width: 100%;
  text-align: center;
  margin: auto !important;
  height: 40px;
  border-radius: 10px;
  background-color: #eee;
}
</style>	


  
</head>
<body>

<div id="event-registration">
    <h1>Event Registration</h1>
    <form action="eventreg.jsp" method="POST" >
      <!-- Form contents will go here -->
      <fieldset>
        <h3>Event Information</h3>
        
        <label>Event Title <input type="text"  name="title"/></label>
        
            <label for="eventCategory">Event Category</label>
            <select id="eventCategory" name="eventCategory">
                <option value="TEC">Technology Club Events (TEC)</option>
                <option value="HWB">Health & Well Being Events (HWB)</option>
                <option value="IIE">Innovation, Incubation and Entrepreneurship Events (IIE)</option>
                <option value="ESO">Extension & Social Outreach Events (ESO)</option>
                <option value="LCH">Liberal, Creative and Hobby Club Events (LCH)</option>
            </select>
            <br/>
            <label for="eventSubCategory">Event Sub-Category</label>
            <select id="eventSubCategory" name="eventSubCategory">
                <option value="Workshop">Workshop</option>
                <option value="Practice">Practice</option>
                <option value="NSS">NSS</option>
                <option value="Competition">Competition</option>               
                <option value="Tinkering Lab">Tinkering Lab</option>               
            </select>
            
            <label>Event Date <input type="date" name="datetime" /></label>
            <br/>
            <label>Resource Person Name<input type="text" name="resource" /></label>
           
            <label>Event Description<input type="text" name="des" /></label>
            
       
      </fieldset>
      
      <button type="submit">Submit Event</button>
      </form>
    


    
<%
    if (request.getMethod().equals("POST")) {
        String title = request.getParameter("title");
        String eventCategory = request.getParameter("eventCategory");
        String eventSubCategory = request.getParameter("eventSubCategory");
        String datetime = request.getParameter("datetime");
        String resource = request.getParameter("resource");
        String description = request.getParameter("des");

        java.sql.Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
                        
            String sql = "INSERT INTO event (title, Category, SubCategory, date, name, description) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, title);
            pstmt.setString(2, eventCategory);
            pstmt.setString(3, eventSubCategory);
            pstmt.setString(4, datetime);
            pstmt.setString(5, resource);
            pstmt.setString(6, description);
            
            int rows = pstmt.executeUpdate();
            
            if (rows > 0) {
            	System.out.println("Success");
            	response.sendRedirect("events.jsp");   	
                
            } else {
            	System.out.println("Fail");
            	response.sendRedirect("events.jsp");
               
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
    }
%>
    
      
      
  </div>
</body>
</html>