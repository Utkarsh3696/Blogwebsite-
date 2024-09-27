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
<title>Manage User</title>
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
				<li class="nav-item">
                    <a class="nav-link" href="manageblogs">Manage blogs  <i class="fas fa-blog ml-2"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home">Home <i class="fas fa-home ml-2"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="users">Manage Users  <i class="fas fa-blog ml-2"></i></a>
                </li>
				<li class="nav-item"><a class="nav-link text-danger"
					href="logout">Logout <i class="fas fa-sign-out-alt ml-2"></i></a></li>
			</ul>
		</div>
	</nav>



	<div class="container mt-2 " > 
	
	<table class="table table-striped text-center" >
		<thead class="bg-info">
		<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Email</th>
		<th>Mobile</th>
		<th>Action</th>
		</tr>
		</thead>
		
		<tbody>
		<% List<User> users = (List<User>) request.getAttribute("users"); 
		if(users!=null)
		{ for(User user :users){
		%>
		
		<%if(user.getRole().equals(Role.ADMIN)){%>
		<tr class="text-danger bg-warnig"> 
		<td><%=user.getId()%></td>
		<td><%=user.getUserName() %></td>
		<td><%=user.getEmail()%></td>
		<td><%=user.getMobile()%></td>
		<td>You</td>
		 </tr>
		<%}else{ %>
		<tr> 
		<td><%=user.getId()%></td>
		<td><%=user.getUserName() %></td>
		<td><%=user.getEmail()%></td>
		<td><%=user.getMobile()%></td>
		<td> <% if(user.isBlock()){ %> <a href="user-block?id=<%=user.getId()%>" >UnBlock</a>  <%}else{ %> <a href="user-block?id=<%=user.getId()%>" >Block</a> <%} %> </td>
		 
		 </tr>
		<%}}} %>
		 
		</tbody>
	</table>
	
	</div>
</body>
</html>