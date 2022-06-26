<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/SOF3021-IT16306/layout">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin/products/index_pro">Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin/accounts/index">Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin/categories/index">Categories</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="/admin/orders/index_ord">Order</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="/admin/order_detail/index_detail">Order_detail</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Đăng kí
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="admin/accounts/create">Đăng kí người dùng</a></li>
            <li><a class="dropdown-item" href="admin/categories/create">Thêm mới loại sản phẩm </a></li>
                  <li><a class="dropdown-item" href="admin/products/create_pro">Thêm mới  sản phẩm </a></li>
                   <li><a class="dropdown-item" href="/admin/orders/create_ord">Thêm mới Order </a></li>
                   <li><a class="dropdown-item" href="/admin/order_detail/create_detail">Thêm mới  OrdereDetail </a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Order ID</th>
				<th>Product ID</th>
				<th>Price</th>
				<th>Quantity</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="orderdetail">
				<tr>
					<td>${ orderdetail.id }</td>
					<td>${ orderdetail.order.account.username }</td>
					<td>${ orderdetail.product.name }</td>
					<td>${ orderdetail.price }</td>
					<td>${ orderdetail.quantity }</td>
					<td><a
						href="/SOF3021-IT16306/admin/order_detail/edit/${ orderdetail.id }"
						class="btn btn-primary">Edit</a></td>
						
							<td >
						<button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal${ orderdetail.id }">
							Xóa</button>
						<div class="modal fade" id="exampleModal${ orderdetail.id }"
							tabindex="-1" aria-labelledby="exampleModalLabel${ orderdetail.id }"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel${ orderdetail.id }">Thông
											báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn có muốn xóa không?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<a href="/SOF3021-IT16306/admin/order_detail/delete/${ orderdetail.id }">
											<button type="button" class="btn btn-danger">Xóa</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					</td>
				<%-- 	<td><a
						href="/SOF3021-IT16306/admin/order_detail/delete/${ orderdetail.id }"
						class="btn btn-danger">Delete</a></td> --%>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<div class="row">
		<ul class="pagination">
			<c:forEach var="i" begin="0" end="${ data.totalPages -1 }">
				<li class="page-item"><a class="page-link"
					href="/SOF3021-IT16306/admin/order_detail/index_detail?page=${ i }">
						${ i + 1 } </a></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>