<%@page import="com.utkarsh.springmvc.dto.BlogsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blogging Site</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        body {
           /*height: 00vh; /* For scrolling demo */
            margin: 0;
        }
        .navbar {
            padding: 10px; /* Adjust padding if needed */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-info d-flex justify-content-center sticky-top">
        <a class="navbar-brand text-light" href="">Write Blogs <i class="fa fa-pen mx-2 text-warning"></i></a>
    </nav>

    <div class="container">
        <h1 class="text-center ">Welcome to the Blogging Site!</h1>
		
    </div>
	
	
		<div class="container mt-3 bg-info border">
			<p class="my-3 text-center bg-dark text-danger"> Read Following Blogs to write blogs go for <a href="login" >login</a>  or <a href="signup" >singup</a> </p>
		<div class="row d-felx justify-content-center">
			
			<%
			List<BlogsDTO> blogs = (List<BlogsDTO>) request.getAttribute("allblogs");
			
			
					if (blogs != null) {
				for (BlogsDTO blog : blogs) {
			%>
			<div class="card col-5 m-3">
				<div class="card-header">
					<h3 class="card-title text-center"><%=blog.getTitle()%></h3>
				</div>
				<div class="card-body">
					<p><%=blog.getContent()%></p>
				</div>
				<div
					class="card-footer text-muted d-flex justify-content-around align-items-center">
					<h6>
						Author:
						<%=blog.getAuthor()%></h6>

					


				</div>
			</div>


			<%
			}
			} else {
			%>
			<h1>No blogs found!!!</h1>
			<%
			}
			%>
			
		</div>

	</div>
	
	
</body>
</html>
