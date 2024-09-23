<%@page import="com.utkarsh.springmvc.dto.Role"%>
<%@page import="com.utkarsh.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DashBoard - Blogging Site</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            margin: 0;
            height: 100vh;
        }
        .navbar {
            padding: 10px;
        }
        .content {
            padding: 20px;
        }
    </style>
</head>
<body>

	<%  User user = (User) request.getAttribute("user"); %>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
        <a class="navbar-brand" href="#">Blogging Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
              <%
              if(user!=null){
              if(user.getRole().equals(Role.USER)){ %>
                <li class="nav-item">
                    <a class="nav-link" href="addblog">Add Blog <i class="fas fa-plus-circle ml-2"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="myblogs">My Blog <i class="fas fa-blog ml-2"></i></a>
                </li>
                <%}else{ %>
                <li class="nav-item">
                    <a class="nav-link" href="manageblogs">Manage blogs  <i class="fas fa-blog ml-2"></i></a>
                </li>
                <%} %>
                <li class="nav-item">
                    <a class="nav-link" href="manageaccount"><%= user.getUserName()%><i class="fas fa-user-cog ml-2"></i></a>
                </li>
               <%} %>
                <li class="nav-item">
                    <a class="nav-link text-danger" href="logout">Logout <i class="fas fa-sign-out-alt ml-2"></i></a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container content">
        <h1 class="text-center mt-4">Welcome to Your Blogging Dashboard!</h1>
        <p class="text-center">Here you can manage your blogs and account settings.</p>

        <!-- Placeholder Content -->
        <div class="row">
            <div class="col-md-4">
               <%
               if(user!=null){
               if(user.getRole().equals(Role.USER)){ %>
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Add a New Blog</h5>
                        <p class="card-text">Click the button in the navbar to create a new blog post.</p>
                        <a href="addblog" class="btn btn-primary">Go to Add Blog</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">View Your Blogs</h5>
                        <p class="card-text">Manage and edit your existing blog posts.</p>
                        <a href="myblogs" class="btn btn-primary">Go to My Blog</a>
                    </div>
                </div>
            </div>

			<%} %>
            <div class="col">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Account Settings</h5>
                        <p class="card-text">Manage your account, change password, and more.</p>
                        <a href="manageaccount" class="btn btn-primary">Go to Account Settings</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<%} else{ %>
		<h1>Login Required</h1>
		<%} %>
</body>
</html>
