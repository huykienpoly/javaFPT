<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>
<form:form
					method="POST"
					action="/SOF3021-IT16306/admin/orders/update/${  order.id }"
					modelAttribute="order">
					<div class="row col-5 offset-4">
						<<div class="form-group mt-3">
							<label for="user.id">ID_Danh Mục</label>
							<form:input path="user.id" value="${order.user.id }" id="user.id" name="user.id" class="form-control"  readonly="true"/>
						</div>		<div class="form-group mt-3">
							<label>Created_Date</label>
							<fmt:formatDate pattern = "yyyy-MM-dd" value = "${order.createdDate}" />
						</div>
						<div class="form-group mt-3">
							<label>Address</label>
							<form:input path="address" value="${ order.address }"  class="form-control" />
						</div>
									
						<div class="mt-3">
							<button class="btn btn-success">Cập nhật</button>
							<a class="btn btn-danger">Hủy</a>
						</div>
					</div>
				</form:form>
				<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>