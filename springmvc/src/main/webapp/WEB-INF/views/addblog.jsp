<%@page import="com.utkarsh.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Blog</title>
    
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            background-color: #f4f4f9;
        }
        .form-container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        }
        .form-title {
            color: #495057;
        }
    </style>
</head>
<body>
<%  User user =(User) request.getAttribute("user"); %>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-info sticky-top">
    <a class="navbar-brand text-light" href="#">Blogging Site</a>
    <div class="ml-auto">
        <a class="nav-link text-light" href="myblogs">myblogs</a>
        <a class="nav-link text-light" href="logout">Logout</a>
    </div>
</nav>

<!-- Form Container -->
<div class="container form-container">
    <h2 class="text-center form-title">Add a New Blog</h2>

    <form action="addblog" method="POST" >
       
        <div class="form-group">
            <label for="title">Blog Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter the blog title" required>
        </div>

     
        <div class="form-group">
            <label for="content">Content</label>
            <textarea class="form-control" id="content" name="content" rows="6" placeholder="Write your blog content here..." required></textarea>
        </div>

        <div class="form-group">
            <label for="author">Author</label>
            <input value="" type="text" class="form-control" id="author" name="author" placeholder="Enter the blog title" required>
        </div>
       
     
        <div class="form-group text-center">
            <button type="submit" class="btn btn-success">Publish Blog</button>
        </div>
    </form>
</div>
<% String mess =(String) request.getAttribute("message");
            		
        if(mess!=null){%>

<p class="text-center text-primary"  ><%= mess %>  </p>

<%}else{ %>

<p class="text-center text-danger"  >something is wrong!!</p>
<%} %>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
