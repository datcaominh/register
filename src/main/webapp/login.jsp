<%@ page language="java" %>
<html>
<head><title>Login</title></head>
<body>
<h2>Login Page</h2>
<form action="login" method="post">
    Username: <input type="text" name="username"/> <br/>
    Password: <input type="password" name="password"/> <br/>
    <input type="submit" value="Login"/>
</form>
<% if (request.getParameter("error") != null) { %>
    <p style="color:red;">Invalid username or password</p>
<% } %>
</body>
</html>
