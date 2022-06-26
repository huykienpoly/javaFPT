<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16306 - Create Products</title>
<link rel="stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/SOF3021-IT16306/layout">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin/accounts/index">Account</a></li>
					<li class="nav-item"><a class="nav-link"
						href="admin/categories/index">Categories</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Đăng kí </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="create">Đăng kí người
									dùng</a></li>
							<li><a class="dropdown-item"
								href="SOF3021-IT16306/admin/categories/create">Thêm mới loại
									sản phẩm </a></li>
							<li><a class="dropdown-item"
								href="SOF3021-IT16306/admin/products/create_pro">Thêm mới
									sản phẩm </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>





	<div class="container">
		
			<div class="row">

				<div class="col-7 col-lg-12 row container  p-2">
					<c:forEach items="${ data.content }" var="pro">
						<div class="card col-md-3 p-3 mb-3 ms-3	text-center">

							<form:form
								action="/SOF3021-IT16306/admin/order_detail/store/${pro.id }"
								method="POST" modelAttribute="orderDetail">
								<div class="card-body">
									<img src="/SOF3021-IT16306/imgae/${ pro.image }"
										class="img-fluid mt-4 rounded mx-auto" style="height: 200px"
										width="800px" alt="...">
								</div>
								<div class="card-footer">
									<h5 class="card-title">${pro.name }</h5>
									<p class="card-text">Giá bán: ${pro.price } VNĐ</p>
								</div>

								<form:input path="quantity" class="col-8 form-control" />
								<div class="row text-center">
									<button class="col-12 btn btn-primary ">Thêm vào giỏ
										hàng</button>
								</div>
							</form:form>
						</div>
					</c:forEach>
				</div>




				<div class="col-12 row">
					<table class="table">
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Số lượng</th>
								<th>Giá</th>
								<th>Tổng tiền</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ dataa }" var="acc">
								<form:form action="/SOF3021-IT16306/admin/order_detail/update/${ acc.product.id }"
								method="POST" modelAttribute="orderDetail">
									<tr>

										<td>${ acc.product.name }</td>
										<td><input name="quantity" value="${ acc.quantity }"
											onblur="this.form.submit()" style="width: 50px"></td>
										<td>${ acc.product.price }</td>
										<td>${ acc.price }</td>
										<td>
											<button type="button" class="btn btn-danger"
												data-bs-toggle="modal"
												data-bs-target="#exampleModal${ acc.id }">Xóa</button>
											<div class="modal fade" id="exampleModal${ acc.id}"
												tabindex="-1" aria-labelledby="exampleModalLabel${ acc.id }"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel${ acc.id }">Thông
																báo</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">Bạn có muốn xóa không?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
															<a
																href="/SOF3021-IT16306/admin/order_detail/delete/${ acc.id }">
																<button type="button" class="btn btn-danger">Xóa</button>
															</a>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</form:form>
							</c:forEach>
						</tbody>
					</table>

					<form:form action="/SOF3021-IT16306/admin/order_detail/add"
						method="POST" modelAttribute="oder">
		
							<div class="row">
								<h3 class="text-info text-center mt-1">Hóa Đơn</h3>
								<div class="form-group mt-3">
									<label>Thành tiền</label> <input class="form-control"
										type="text" value="${thanhtien }">
								</div>
								<div>


									<div>
										<label>Ngày Mua</label>
										<form:input class="form-control" path="createdDate"
											type="date" />
									</div>

									<div class="form-group mt-3">
										<label>Địa chỉ</label>
										<form:input class="form-control" path="address" />
									</div>
									<div>
										<button class="btn btn-primary mt-2">Thanh toán</button>
									</div>
								</div>
							</div>
					</form:form>
				</div>
			</div>
		</div>




	<div class="row align-items-center">
		<div class="col-md-6 offset-6">
			<ul class="pagination">
				<c:forEach var="i" begin="0" end="${ data.totalPages -1 }">
					<li class="page-item"><a class="page-link"
						href="/SOF3021-IT16306/admin/order_detail/index_detail?page=${ i }">
							${ i + 1 } </a></li>
				</c:forEach>
			</ul>
		</div>
	</div>


	<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>