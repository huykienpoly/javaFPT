<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
<link rel="stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css">
</head>
<body>
<form:form
						modelAttribute="orderDetail"
						method="POST"
						action="/SOF3021-IT16306/admin/order_detail/update/${ orderDetail.id }">
						<div class="row col-5 offset-4">
						<div class="form-group mt-3">
							<label>ID</label>
							<form:input path="id" value="${ orderDetail.id }" class="form-control" readonly="true" />
						</div>
					
						  <div class="form-group mt-3">
							<label class="form-label ">Order_ID</label> 
							<form:select name="order" value="${orderDetail.order.id }"  path="order.id">
								<c:forEach items="${ dsO }" var="order">
									<option value="${ order.id }">${ order.account.username }</option>
								</c:forEach>
							</form:select>
						</div>
						 <div class="form-group mt-3">
							<label class="form-label ">Product_ID</label> 
							<form:select name="product" value="${orderDetail.product.id }" path="product.id">
								<c:forEach  items="${ dsPro }" var="product">
									<option value="${product.id }">${ product.name }</option>
								</c:forEach>
							</form:select>
						</div> 
						<%--  <div class="form-group mt-3">
							<label>Product_ID</label>
							<form:input path="id" value="${ orderDetail.product.id }" class="form-control" readonly="true" />
						</div>  --%>
						<div class="form-group mt-3">
							<label>Price</label>
							<form:input path="price" value="${ orderDetail.price }" class="form-control" />
						</div>
						<div class="form-group mt-3">
							<label>Quantity</label>
							<form:input path="quantity" value="${orderDetail.quantity }" class="form-control" />
						</div>
									
						<div class="mt-3">
							<button class="btn btn-success">Sửa</button>
							<a class="btn btn-danger">Hủy</a>
						</div>
					</div>
					</form:form>
</body>
</html>