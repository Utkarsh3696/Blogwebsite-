<%@page import="com.google.protobuf.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Blogging Site</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        body {
            margin: 0;
            height: 100vh; /* Full viewport height */
        }
        .navbar {
            padding: 10px; /* Adjust padding if needed */
        }
        .form-container {
            margin-top: 30px;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-info sticky-top">
        <a class="navbar-brand text-light" href="#">Write Blogs <i class="fa fa-pen mx-2 text-warning"></i></a>
    </nav>

    <div class="container">
        <h1 class="text-center mt-4">Login to Your Account</h1>
        <div class="form-container mx-auto" style="max-width: 400px;">
            <form action="./login" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
        <div class="text-center mt-3">
            <p>Don't have an account? <a href="signup">SignUp here</a></p>
        </div>
    </div>
    <%
    
    	Object message = request.getAttribute("message");
                    	
        if(message !=null)
        {
        	message= message.toString();
        }
        if(message == null)
        {
        	message="";
        }
                    		
                    		
    %>
    
    <p class="text-center text-danger" > <%= message %></p>

</body>
</html>
