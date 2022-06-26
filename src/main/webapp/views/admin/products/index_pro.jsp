<%@ page language="java" contentType="text/html; UTF-8"
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
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin/accounts/index">Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin/categories/index">Categories</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Đăng kí
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="admin/accounts/create">Đăng kí người dùng</a></li>
            <li><a class="dropdown-item" href="categories/create">Thêm mới loại sản phẩm </a></li>
             <li><a class="dropdown-item" href="create_pro">Thêm mới  sản phẩm </a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<form method="GET" >
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sắp xếp theo</label>
					<select name="sort_by" class="form-control">
						<option value="id">Mặc định</option>
						<option value="price" >
							Giá
						</option>
						<option value="createdDate" >
							Ngày
						</option>
					</select>
				</div>
				<div class="col-6">
					<label>Thứ tự</label>
					<select name="sort_direction" class="form-control">
						<option value="asc">Tăng dần</option>
						<option value="desc">Giảm dần</option>
					</select>
				</div>
			</div>
			
			<div>
				<button class="btn btn-primary mt-4">Lọc</button>
				<a href="${ pageContext.request.contextPath }/admin/accounts"
					class="btn btn-danger mt-4" type="reset">
					Reset
				</a>
			</div>
		</form>
	</div>
<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Image</th>
							<th>Price</th>
							<th>Date</th>
							<th>Available</th>
							 <th>Category_ID</th> 
							<th colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ data.content }" var="pro">
						<tr>
							<td>${ pro.id }</td>
							<td>${ pro.name }</td>
							<td>
							<img   src="/SOF3021-IT16306/imgae/${ pro.image }" style="height:100px">
							<%-- ${ pro.image } --%></td>
							<td>${ pro.price }</td>
							<td>${ pro.createdDate }</td>
							<td>${ pro.available }</td>
							 <td>${ pro.category.id }</td>
							<td>
								<a href="/SOF3021-IT16306/admin/products/edit_pro/${ pro.id }" class="btn btn-primary">Update</a>
							</td>
							
				<td >
						<button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal${ pro.id }">
							Xóa</button>
						<div class="modal fade" id="exampleModal${ pro.id }"
							tabindex="-1" aria-labelledby="exampleModalLabel${ pro.id }"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel${ pro.id }">Thông
											báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Bạn có muốn xóa không?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<a href="/SOF3021-IT16306/admin/products/delete/${ pro.id }">
											<button type="button" class="btn btn-danger">Xóa</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					</td>
						</tr>
					</c:forEach>
					
					</tbody>
				
	

	
		</table>
		
		<div class="container mt-4">
		<div class="row">
			<c:forEach items="${ dsPro }" var="pro">
				<div class="col-12 col-md-4">
					<div class="card-group">
						<div class="card mb-3">
							<div class="row g-0">
								<div class="col-md-5 p-3">
									<img src="/SOF3021-IT16306/imgae/${ pro.image }"
										class="img-fluid mt-4 rounded mx-auto" style="height: 200px"
										width="800px" alt="...">
								</div>
								<div class="col-md-7 p-3">
									<div class="card-body" style="width: 18rem;">
										<h5 class="card-title">${ pro.name }</h5>
										<p class="card-text">Giá: ${ pro.price }</p>
										<p class="card-text">Danh Mục: ${ pro.category.name }</p>
										<p class="card-text pt-4">
											<a class="btn btn-primary"
												href="/SOF3021-IT16306/admin/order_detail/store">Thêm Vào Giỏ</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
		
	
	<div class="row">
		<ul class="pagination">
		<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
			<li class="page-item">
				<a class="page-link"
					href="/SOF3021-IT16306/admin/products/index_pro?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>