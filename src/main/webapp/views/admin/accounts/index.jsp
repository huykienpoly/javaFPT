<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<li><a class="dropdown-item" href="/create">Đăng kí
									người dùng</a></li>
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

	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Fullname</th>
				<th>Username</th>
				<th>Email</th>
				<th>Photo</th>
				<th>Activated</th>
				<th>Role</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="acc">
				<tr>
					<td>${ acc.id }</td>
					<td>${ acc.fullname }</td>
					<td>${ acc.username }</td>
					<td>${ acc.email }</td>
					<td><img src="/SOF3021-IT16306/imgae/${ acc.photo }"
						style="height: 100px"></td>
					<td>${ acc.activated == 0 ? "Not Active" : "Active" }</td>
					<td>${ acc.admin == 1 ? "Admin" : "Member" }</td>
					<td><a href="/SOF3021-IT16306/admin/accounts/edit/${ acc.id }"
						class="btn btn-primary">Update</a></td>
					<td>
					<td>
						<button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal${ acc.id }">
							Xóa</button>
						<div class="modal fade" id="exampleModal${ acc.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel${ acc.id }" aria-hidden="true">
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
										<a href="/SOF3021-IT16306/admin/accounts/delete/${ acc.id }">
											<button type="button" class="btn btn-danger">Xóa</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					</td>

					<%-- <a
						href="/SOF3021-IT16306/admin/accounts/delete/${ acc.id }"
						class="btn btn-danger">Delete</a> --%>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="row">
		<ul class="pagination">
			<c:forEach var="i" begin="0" end="${ data.totalPages   }">
				<li class="page-item"><a class="page-link"
					href="/SOF3021-IT16306/admin/accounts/index?page=${ i }"> ${ i + 1 }
				</a></li>
			</c:forEach>
		</ul>
	</div>

	<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>