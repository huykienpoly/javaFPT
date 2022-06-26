<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
<c:if test="${ !empty sessionScope.errors }">
	<div class="alert alert-danger">${ sessionScope.errors }</div>
	<c:remove var="error" scope="session"></c:remove>
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="col-10 offset-1 mt-5">
			<c:if test="${ not empty sessionScope.error }">
				<div class="alert alert-danger">${ sessionScope.error }</div>
				<c:remove var="error" scope="session" />
			</c:if>


			<div class="col-8 offset-1 mt-3">
				<form method="POST"
					action="${ pageContext.request.contextPath }/login">
					<div class="card mt-6">

						<div class="card-body">




							<div class="row mb-3">
								<label for="email" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input  type="email" name="email" id="email" class="form-control" >
								</div>
							</div>
							<div class="row mb-6">
								<label for="password" class="col-sm-2 col-form-label">Password</label>
								<div class="col-sm-10">
									<input type="password" name="password" id="password" class="form-control" >
								</div>
							</div>

							<!-- <div class="form-group mt-3">
									<label for="email">Email</label>
									<input type="email" name="email" id="email" class="form-control" />
								</div>
								<div class="form-group mt-3">
									<label for="password">Password</label>
									<input type="password" name="password" id="password" class="form-control" />
								</div> -->
							<div class="mt-4 ms-6">
								<button class="btn btn-primary">Login</button>
								<button class="btn btn-warning ms-3">Cancel</button>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>