<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f9fc;
        }
        .welcome-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .welcome-title {
            margin-bottom: 25px;
            font-weight: 600;
            color: #333;
        }
        .btn-logout {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <h2 class="welcome-title">Welcome, ${username}!</h2>
        <p>You have successfully logged in.</p>
        <a href="logout" class="btn btn-danger btn-logout">Logout</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
