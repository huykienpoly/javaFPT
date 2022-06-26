<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>

<div class="mt-5 col-10 offset-1">
		<form:form
			modelAttribute="accou"
			method="POST"
			action="/SOF3021-IT16306/admin/accounts/update/${accou.id }">
			
			<div class="form-group mt-3">
				<label for="name">Name</label>
			    <form:input value="${ accou.username }" path="username" class="form-control" autocomplete="off" />
		
			</div>
			<div class="form-group mt-3">
				<label for="fullname">FullName</label>
			    <form:input  value="${ accou.fullname }" path="fullname" class="form-control" autocomplete="off" />
			
			</div>
			<div class="form-group mt-3">
				<label for="email">Email</label>
			    <form:input  value="${ accou.email }" path="email" class="form-control" id="email" name="email" autocomplete="off" />
				
			</div>
			<div class="form-group mt-3">
				<label for="password">Password</label>
				<form:password  value="${ accou.password }" path="password" name="password" class="form-control" readonly="true"/>
				
			</div>
			<div class="form-group mt-3">
				<label for="admin">Tài khoản</label>
				<form:select  value="${ accou.admin }" path="admin" id="admin" class="form-control">
					<form:option value="1">Admin</form:option>
					<form:option value="0">Member</form:option>
				</form:select>
				
			</div>
			<div class="form-group mt-3">
				<label for="photo">Image</label>
			    <input src="C:\Users\HP\Desktop\java4\SOF3021-IT16306\src\main\webapp\imgae"  value="${ accou.photo }" type="file" class="form-control" id="photo" name="photo">
			</div>
			<div class="form-group mt-3">
				<label for="status">Trạng thái</label>
				<form:select   path="activated" id="activated" class="form-control">
					<form:option value="1">Đang hoạt động</form:option>
					<form:option value="0">Vô hiệu hóa</form:option>
				</form:select>
				
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form:form>
	</div>
</body>
</html>