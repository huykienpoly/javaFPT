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
						modelAttribute="catego"
						method="POST"
						action="/SOF3021-IT16306/admin/categories/update/${ catego.id }">
					
						<div class="form-group mt-3">
							<label for="fullname">Tên Danh Mục</label>
						    <form:input path="name" class="form-control" value="${ catego.name }"/>
						</div>
						
						<div class="form-group mt-3">
							<button class="btn btn-primary">Sửa</button>
							<button type="reset" class="btn btn-danger">Hủy</button>
						</div>
					</form:form>
	</div>
</body>
</html>