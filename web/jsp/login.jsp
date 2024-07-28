<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <h2>Admin Login</h2>
    <form action="login.jsp" method="post">
        Username: <input type="text" name="username" /><br/>
        Password: <input type="password" name="password" /><br/>
        <input type="submit" value="Login" />
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username.equals("admin") && password.equals("admin")) {
                response.sendRedirect("viewPassengers.jsp");
            } else {
                out.println("Invalid credentials");
            }
        }
    %>
</body>
</html>
