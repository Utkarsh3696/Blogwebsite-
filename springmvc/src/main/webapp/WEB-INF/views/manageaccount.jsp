<%@page import="com.utkarsh.springmvc.dto.Role"%>
<%@page import="com.utkarsh.springmvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Account</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.container {
	margin-top: 50px;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getAttribute("user");
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-info">
		<a class="navbar-brand text-white" href="#">Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<%
				if(user!=null){
				if (user.getRole().equals(Role.USER)) {
				%>
				<li class="nav-item"><a class="nav-link text-white"
					href="addblog">Add Blog</a></li>
				<li class="nav-item"><a class="nav-link text-white" href="#">My
						Blogs</a></li>
				<%
				}}
				%>

				<li class="nav-item"><a class="nav-link text-white"
					href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h2 class="text-center">Manage Your Account</h2>
		<form action="update-account" method="POST" class="mt-4">
			<%
			if (user != null) {
			%>
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					class="form-control" id="username" name="username"
					value="<%=user.getUserName()%>" required>
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email"
					class="form-control" id="email" name="email"
					value="<%=user.getEmail()%>" required>
			</div>
			<div class="form-group">
				<label for="mobile">Mobile</label> <input type="text"
					class="form-control" id="mobile" name="mobile"
					value="<%=user.getMobile()%>" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" name="password"
					value="<%=user.getPassword()%>" required>
			</div>
			<div class="form-group">
				<label for="role">Role</label> <input type="text"
					class="form-control" id="role" name="role"
					value="<%=user.getRole()%>" disabled>
			</div>
			<button type="submit" class="btn btn-primary">Update Account</button>
		</form>
		
		<form action="delete-account" method="POST" class="mt-4">
			<button type="submit" class="btn btn-danger"
				onclick="return confirm('Are you sure you want to delete your account?');">Delete
				Account</button>
		</form>
		<%
		} else{
		%>
		<h2>Something went wrong login again!!</h2>
		<%
		}
		%>

		
	</div>
</body>
</html>
