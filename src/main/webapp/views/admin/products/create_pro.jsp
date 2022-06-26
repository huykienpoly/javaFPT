<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Account</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light px-5">
	  <a class="navbar-brand" href="#">Navbar</a>
	
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
		action="/SOF3021-IT16306/admin/products/store"
		modelAttribute="product">
		
		<h3 class="text-center mt-3">Thêm Sản Phẩm</h3>
					<div class="row col-5 offset-4">
						<div class="form-group mt-3">
							<label>Tên Sản Phẩm</label>
							<form:input path="name"  class="form-control"   />
							<form:errors path="name"   class="text"></form:errors>
						</div>
						<div class="form-group mt-3">
							<label>Hình Ảnh</label>
							<form:input path="image" type="file" src="C:\Users\HP\Desktop\java4\SOF3021-IT16306\src\main\webapp\imgae"  class="form-control"  />
						</div>
						<div class="form-group mt-3">
							<label>Giá Tiền</label>
							<form:input path="price" class="form-control" />
						</div>
						<div class="form-group mt-3">
							<label>Ngày Tạo</label>
							<form:input type="date" path="createdDate" class="form-control" />
							<form:errors path="createdDate"   class="text"></form:errors>
						</div>
						<div class="form-group mt-3">
							<label>Available</label>
							<form:select path="available" class="form-control">
								<form:option value="0">Có Sẵn</form:option>
								<form:option value="1">Hết Hàng</form:option>
							</form:select>
						</div>
						
						<div class="form-group mt-3">
							<label class="form-label">ID_Danh Mục</label> <select
								name="category">
								<c:forEach items="${ dsCate }" var="cate">
									<option value="${ cate.id }">${ cate.name }</option>
								</c:forEach>
							</select>
						</div>
									
						<div class="mt-3">
							<button class="btn btn-success">Thêm</button>
							<button type="reset" class="btn btn-danger">Hủy</button>
						</div>
					</div>
		
	</form:form>
	</div>
	
	   <footer class="row card pt-3 bg-dark mt-2">
                 
                      <div class=" text-center text-white">
                        <p>FPT Polytechnic & copy 2017. All rights reserved.</p>
                  </div>
              </footer>
	
</body>
</html>