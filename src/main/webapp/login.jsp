<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f7f9fc; }
        .login-container { max-width: 400px; margin: 80px auto; padding: 30px; background-color: #fff; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .login-title { text-align:center; font-weight:600; margin-bottom:25px; color:#333; }
        .btn-login { width:100%; }
        .error-message { color:red; text-align:center; margin-top:15px; }
    </style>
</head>
<body>
<div class="login-container">
    <h2 class="login-title">Login</h2>
    <form action="login" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" required/>
        </div>
        <button type="submit" class="btn btn-primary btn-login">Login</button>
    </form>
    <% if (request.getParameter("error") != null) { %>
        <p class="error-message">Invalid username or password</p>
    <% } %>
    <div class="text-center mt-3">
        <a href="register.jsp">Don't have an account? Register</a> | 
        <a href="#" data-bs-toggle="modal" data-bs-target="#forgotModal">Forgot Password?</a>
    </div>
</div>

<!-- Modal Quên mật khẩu -->
<div class="modal fade" id="forgotModal" tabindex="-1" aria-labelledby="forgotModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="forgetpass" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="forgotModalLabel">Forgot Password</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
              <label class="form-label">Enter your username</label>
              <input type="text" class="form-control" name="username" required/>
          </div>
          <% if (request.getParameter("pass") != null) { %>
              <div class="alert alert-success">Your password: <strong><%= request.getParameter("pass") %></strong></div>
          <% } else if (request.getParameter("error") != null) { %>
              <div class="alert alert-danger">Username not found!</div>
          <% } %>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Get Password</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Nếu ForgetPassServlet trả về pass hoặc error, tự mở modal
    window.addEventListener('DOMContentLoaded', (event) => {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('pass') || urlParams.has('error')) {
            const forgotModal = new bootstrap.Modal(document.getElementById('forgotModal'));
            forgotModal.show();
        }
    });
</script>
</body>
</html>
