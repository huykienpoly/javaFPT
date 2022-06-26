<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    
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
					method="POST"
					action="/SOF3021-IT16306/admin/orders/store"
					modelAttribute="order">
					<div class="row col-5 offset-4">
						<div class="form-group mt-3">
							<label class="form-label ">User_ID</label> 
							<form:select
								name="user"  path="user">
								<c:forEach items="${ dsAcc }" var="acc">
									<option value="${ acc.id }">${ acc.username }</option>
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group mt-3">
							<label>Created_Date</label>
							<form:input path="createdDate" class="form-control" />
						</div>
						<div class="form-group mt-3">
							<label>Address</label>
							<form:input path="address" class="form-control" />
						</div>
									
						<div class="mt-3">
							<button class="btn btn-success">Thêm</button>
							<a class="btn btn-danger">Hủy</a>
						</div>
					</div>
				</form:form>
	</div>
	
</body>
</html>