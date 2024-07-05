<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- navbar.jsp --%>
<%-- navbar.jsp --%>
<%-- navbar.jsp --%>
<style>
    /* Style for horizontal navigation */
    nav {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #333; /* Background color of the navbar */
        padding: 10px 20px;
    }

    nav ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    nav ul li {
        margin-right: 20px;
    }

    nav ul li:last-child {
        margin-right: 0;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        padding: 10px;
    }

    nav ul li a:hover {
        background-color: #111; /* Darker background color on hover */
    }

    .logo img {
        height: 40px; /* Adjust height as needed */
        width: auto; /* Maintain aspect ratio */
    }
</style>

<nav>
    <div class="logo">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYN4scLAOk6JcRBGzBZrq9N4zSHo6oOB_aycIUGb6FlF48fK8XsTr1a6AJZgMuYrduBeY&usqp=CAU" alt="Logo">
    </div>
    <ul>
        <li><a href="adminhomepage.jsp">Home</a></li>
        <li><a href="EmpMang.jsp">Programmer Management</a></li>
        <li><a href="">Attendance</a></li>
        <li><a href="">Reports</a></li>
        <li><a href="userprofile.jsp">CRUD</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</nav>

</body>
</html>