<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>	
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16306 - Create Products</title>
<link rel = "stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>
	<div class="row">
	
	   <div class="col-7">
	   <table class="table">
		<thead>
			<tr>
				<th>Tên sản phẩm</th>
				<th>Số lượng</th>
				<th>Gía</th>
				<th>Tổng tiền</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data }" var="acc">
			<tr>
				<td>${ acc.product.name }</td>
				<td>${ acc.quantity }</td>
				<td>${ acc.product.price }</td>
				<td>${ acc.price }</td>
				<td><a class="btn btn-danger" href="/SOF3021-IT16306/admin/shops/delete/${acc.id }">Xóa</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	   </div>
	   
	   <div class="col-5">
	   <form:form action="/SOF3021-IT16306/admin/shops/add"
	    method="POST" 
	    modelAttribute="oder">
	    <div >
	    <label>Thành tiền</label>
	    <input type="text" value="${thanhtien }">
	    </div>
	    
	    <div >
	     <label>Tên khách hàng</label>
	    <input type="text" value="">
	    </div>
	    
	    <div>
	    <label>Địa chỉ</label>
	    <form:input path="address"/>  
	    </div>
	    <div>
	    
	    <button class="btn btn-primary">Thanh toan</button>	    
	    </form:form>
	   </div>
	</div>
	
<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>