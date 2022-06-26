<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
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
					action="/SOF3021-IT16306/admin/products/update/${ pro.id }"
					modelAttribute="pro">
					<h3 class="text-center mt-3">Thêm Sản Phẩm</h3>
					<div class="row col-5 offset-4">
						<div class="form-group mt-3">
							<label>Tên Sản Phẩm</label>
							<form:input path="name" value="${ pro.name }" class="form-control"   />
						</div>
						<div class="form-group mt-3">
							<label>Hình Ảnh</label>
							<form:input path="image" type="file" value="${ pro.image }" class="form-control"  />
						</div>
						<div class="form-group mt-3">
							<label>Giá Tiền</label>
							<form:input path="price" value="${ pro.price }"  class="form-control" />
						</div>
						<div class="form-group mt-3">
							<label>Ngày Tạo:
							<fmt:formatDate pattern = "yyyy-MM-dd" value = "${pro.createdDate}" />
							</label>
							
<%-- 							<form:input path="createdDate" type="Date" value="${ pro.createdDate }" class="form-control" /> --%>
						</div>
						<div class="form-group mt-3">
							<label>Available</label>
							<form:select path="available" value="${ pro.available }" class="form-control">
								<form:option value="0">Có Sẵn</form:option>
								<form:option value="1">Hết Hàng</form:option>
							</form:select>
						</div>
						
						
						<div class="form-group mt-3">
							<label for="category.id">ID_Danh Mục</label>
							<form:input path="category.id" value="${category.id }" id="category.id" name="category.id" class="form-control"  readonly="true"/>
						</div>
						<%-- <div class="form-group mt-3">
							<label class="form-label ">ID_Danh Mục</label> 
							<form:select
								name="category"  value="${ pro.category }" path="category" readonly="true">
								<c:forEach items="${ cate }" var="cate">
									<option value="${ cate.id }">${ cate.name }</option>
								</c:forEach>
							</form:select>
						</div> --%>
									
						<div class="mt-3">
							<button class="btn btn-primary">Update</button>
							<button type="reset" class="btn btn-danger">Hủy</button>
						</div>
					</div>
				</form:form>
</body>
</html>
