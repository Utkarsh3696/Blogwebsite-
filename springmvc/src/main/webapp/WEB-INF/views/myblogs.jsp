<%@page import="com.utkarsh.springmvc.dto.BlogsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my blogs</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-info sticky-top">
        <a class="navbar-brand" href="#">Blogging Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addblog">Add Blog <i class="fas fa-plus-circle ml-2"></i></a>
                </li>
                
              
               
                <li class="nav-item">
                    <a class="nav-link text-danger" href="logout">Logout <i class="fas fa-sign-out-alt ml-2"></i></a>
                </li>
            </ul>
        </div>
    </nav>


<div class="container mt-3" >
<div class="row d-felx justify-content-center" > 
<% List<BlogsDTO> blogs =(List<BlogsDTO>) request.getAttribute("blogs");

	if(blogs!=null)
	{
		for(BlogsDTO  blog :blogs)
		{
	

%>
<div class="card col-5 m-3">
  <div class="card-header">
    <h3 class="card-title text-center"><%= blog.getTitle() %></h3>
  </div>
  <div class="card-body">
    <p><%= blog.getContent() %></p>
  </div>
  <div class="card-footer text-muted d-flex justify-content-around align-items-center">
    <h6>Author: <%= blog.getAuthor() %></h6>
  
    
    <a  class="btn btn-danger" href="delete-blog?id=<%=blog.getId() %>"> delete </a>
    <a class="btn btn-primary"  href="update-blog?bid=<%=blog.getId()%>"> update </a>
    
  </div>
    <div class="card-footer text-muted d-flex justify-content-around align-items-center">
      <p><%=blog.getDate() %></p>
    
  </div>
</div>


<%}}else { %>
<h1  >No my blogs found create one</h1>
<%}if(blogs.isEmpty()){ %>
	<h1 class="text-center text-danger">You not written any blog write one now!!</h1>
	<%} %>
</div>
<h2 class="text-center" >Other All Blogs</h2>
<div class="row bg-secondary d-felx justify-content-center" > 
<% List<BlogsDTO> allblogs =(List<BlogsDTO>) request.getAttribute("allblogs");

	if(allblogs!=null)
	{
		for(BlogsDTO  blog1 :allblogs)
		{
	

%>
<div class="card col-5 m-3">
  <div class="card-header">
    <h3 class="card-title text-center"><%= blog1.getTitle() %></h3>
    
  </div>
  <div class="card-body">
    <p><%= blog1.getContent() %></p>
  </div>
  <div class="card-footer text-muted d-flex justify-content-around align-items-center">
    <h6>Author: <%= blog1.getAuthor() %></h6>
    <p><%=blog1.getDate() %></p>
    
  </div>
</div>


<%}}else { %>
<h1 class="text-center" >No  blogs found create one</h1>
<%} %>
</div>
 </div>
</body>
</html>