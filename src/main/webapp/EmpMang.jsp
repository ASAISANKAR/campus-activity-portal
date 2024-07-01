<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="adminnavbar.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>

 <div class="container text-center">
  <div class="row">
<%-- 1st start --%>
    <div class="col">
      <div class="card" style="width: 18rem;">
  <img src="https://as2.ftcdn.net/v2/jpg/02/23/89/81/1000_F_223898108_tfEKIURf0xjs0uDVKZxvMd8KfQN7Qtc9.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <a href="adminreg.jsp" class="btn btn-success">Add Student or Programmer</a>
  </div>
</div>
    </div>
    <%-- 1st ends --%>
    
    <%--2nd start --%>
    <div class="col">
     <div class="card" style="width: 18rem;">
  <img src="https://coralogix.com/wp-content/uploads/2016/01/Log-query-1000X1000-.png" alt="...">
  <div class="card-body">
    <a href="#" class="btn btn-success">Log's Data</a>
  </div>
</div>
    </div>
    <%--2nd ends --%>
    
    <%--3rd start--%>
    <div class="col">
     <div class="card" style="width: 20rem;">
  <img src="https://quixy.com/wp-content/uploads/2022/10/Time-Management-Activities.png" height="300"  width="320" alt="...">
  <div class="card-body">
    <a href="#" class="btn btn-success">Activity Management</a>
  </div>
</div>
    </div>
    <%-- 3rd ends --%>
    
    
  </div>
</div>
</body>
</html>