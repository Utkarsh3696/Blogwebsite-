<%@page import="com.utkarsh.springmvc.dto.Role"%>
<%@page import="com.utkarsh.springmvc.dto.User"%>
<%@page import="com.utkarsh.springmvc.dto.BlogsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my blogs</title>
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
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
		<a class="navbar-brand" href="#">Blogging Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="home">Home <i class="fas fa-home ml-2"></i></a>
					
					</li>
				<li class="nav-item"><a class="nav-link text-danger"
					href="logout">Logout <i class="fas fa-sign-out-alt ml-2"></i></a>
					
					</li>
					
			</ul>
		</div>
	</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid w-100">
        <!-- Sort Blogs Form -->
        <form class="text-center w-25 d-flex align-items-center" action="./sort" method="GET">
            <div class="form-group mb-0 w-100">
               
                <select name="index" id="index" class="form-control" required>
                    <option disabled selected>Sort</option>
                    <option value="1">NEWEST FIRST</option>
                    <option value="0">OLDEST FIRST</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary ml-2">Sort</button>
        </form>

        <!-- Search Blogs Form -->
        <form class="text-center w-50 d-flex align-items-center justify-content-end" action="./searchqurey" method="GET">
            <div class="form-group mb-0 w-100">
              <% String qvalue = (String)request.getParameter("qvalue");
              if(qvalue==null)
              {
            	  qvalue="";
              }
              
              %>
                <input class="form-control" type="text" name="qvalue" id="qvalue" value="<%=qvalue %>" placeholder="Write name or anything related to blog" />
            </div>
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</nav>

	<div class="container-fluid mt-3">   
		<div class="row d-felx justify-content-center">
			
		
	
			<%
			List<BlogsDTO> blogs = (List<BlogsDTO>) request.getAttribute("allblogs");
			User user = (User) request.getAttribute("user");
			
			%>
			
			
			 <% 
			if (user != null) {
				if (user.getRole().equals(Role.ADMIN)) {
					if (!(blogs.isEmpty())) {
				for (BlogsDTO blog : blogs) {
			%>
			<div class="col m-1 col-md-3 col-sm-6 border border-1 d-flex flex-column justify-content-between" style="minheight: 400px;maxheight: 500px;">
    <h3 class="text-center mt-2"><%= blog.getTitle() %></h3>
    
    <p style="text-align: justify;" class="flex-grow-1"><%= blog.getContent() %></p>
    
    <div class="d-flex justify-content-between align-items-center mt-2 h-25">
        <a class="btn btn-danger" href="deleteblog?blogid=<%= blog.getId() %>">Delete</a>
       <p class="text-secondary" >- <%= blog.getAuthor() %></p>
    </div>
    <p class="text-secondary text-right mt-2"><%= blog.getDate() %></p>
</div>
		
			<%
			}
			} else {
			%>
			<h1>No blogs found for search!!!</h1>
			<%
			}
			}
			}else{
			%>
			
			<h1>You are not authorized person to access this page </h1>
			<%} %>
		</div>

	</div>

</body>
</html>