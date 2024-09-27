<%@page import="com.utkarsh.springmvc.dto.BlogsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogging Site</title>

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
body {
    margin: 0;
}

.navbar {
    padding: 10px;
}
</style>
</head>
<body>
    <!-- Navbar with login and signup options -->
    <nav
        class="navbar navbar-expand-lg navbar-light bg-info d-flex justify-content-between sticky-top">
        <a class="navbar-brand text-light" href="">Write Blogs <i
            class="fa fa-pen mx-2 text-warning"></i></a>
        
        <!-- Add login and signup buttons -->
        <div class="ml-auto">
            <a href="login" class="btn btn-light mx-2">Login</a>
            <a href="signup" class="btn btn-warning mx-2">Sign Up</a>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center">Welcome to the Blogging Site!</h1>
    </div>
    
    <div class="container mt-5 w-25">
        <form class="text-center" action="./sort" method="GET">
            <div class="form-group">
                <label for="index" class="font-weight-bold">Sort Blogs By:</label>
                <select name="index" id="index" class="form-control" required="required">
                    <option disabled selected>Sort</option>
                    <option value="1">NEWEST FIRST</option>
                    <option value="0">OLDEST FIRST</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Sort</button>
        </form>
    </div>

    <div class="container-fluid mt-3">
        <div class="row d-flex justify-content-center">
            <%
            List<BlogsDTO> blogs = (List<BlogsDTO>) request.getAttribute("allblogs");

                if (blogs != null) {
                for (BlogsDTO blog : blogs) {
            %>
            <div
                class="col m-1 col-md-3 col-sm-6 border border-1 d-flex flex-column justify-content-between"
                style="min-height: 400px; max-height: 500px;">
                <h3 class="text-center mt-2"><%=blog.getTitle()%></h3>

                <p style="text-align: justify;" class="flex-grow-1"><%=blog.getContent()%></p>

                <div class="d-flex justify-content-between mt-2">
                    <p class="text-secondary mt-2"><%=blog.getDate()%></p>
                    <p class="text-secondary mt-2"><%=blog.getAuthor()%></p>
                </div>
            </div>
            <%
                } } else {
            %>
            <h1>No blogs found!!!</h1>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
