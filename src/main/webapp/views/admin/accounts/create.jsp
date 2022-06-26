<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Account</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light px-5">
	  <a class="navbar-brand" href="/SOF3021-IT16306/layout">Navbar</a>
	
	  <div class="collapse navbar-collapse">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Users</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Categories</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Products</a>
	      </li>
	    </ul>
	  </div>
	</nav>
<div class="mt-5 col-10 offset-1">
	<form:form
		method="POST"
		action="/SOF3021-IT16306/admin/accounts/store"
		modelAttribute="account">
		
		<div  class="form-group">
			<label >Fullname</label>
			<form:input path="fullname" />
		</div>
		<div class="form-group" >
			<label>Email</label>
			<form:input path="email" type="email" />
		</div>
		<div class="form-group" >
			<label>Username</label>
			<form:input path="username" />
		</div>
		<div class="form-group">
			<label>Password</label>
			<form:password path="password" />
		</div>
		<div  class="form-group">
			<label>Photo</label>
			<form:input path="photo" />
		</div>
		<div class="form-group" >
			<label>Admin</label>
			<form:select path="fullname">
				<form:option value="0">Member</form:option>
				<form:option value="1">Admin</form:option>
			</form:select>
		</div>
		<button  class="btn btn-primary">Save</button>
		
	</form:form>
	</div>
	
	   <footer class="row card pt-3 bg-dark mt-2">
                 
                      <div class=" text-center text-white">
                        <p>FPT Polytechnic & copy 2017. All rights reserved.</p>
                  </div>
              </footer>
	
</body>
</html>