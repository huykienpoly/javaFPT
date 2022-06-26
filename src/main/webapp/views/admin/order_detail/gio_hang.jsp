<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
				<th>Giá</th>
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
				
				<td >
						<button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal${ acc.id }">
							Xóa</button>
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
										<a href="/SOF3021-IT16306/admin/order_detail/delete/${ acc.id }">
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
	   </div>
	    <div class="card mt-3  offset-1 col-6">
	   <div class="col-8 container">
	   <form:form action="/SOF3021-IT16306/admin/order_detail/add"
	    method="POST" 
	    modelAttribute="oder">
	    <div >
	    <label>Thành tiền</label>
	    <input class="form-control" type="text" value="${thanhtien }">
	    </div>
	    
	    
	    <div>
	    <label>Ngày Mua</label>
	    <form:input  type="date" class="form-control" path="createdDate"/>  
	    </div>
		
	    <div>
	    <label>Địa chỉ</label>
	    <form:input class="form-control" path="address"/>  
	    </div>
	    <div>
	    </div>
	    <button class="btn btn-primary mt-2">Thanh toan</button>	
	  	
	    </form:form>
	   </div>
	</div> 
	</div>
	<script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>