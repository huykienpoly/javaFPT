<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel = "stylesheet" href="/SOF3021-IT16306/css/bootstrap.min.css" />
</head>
<body>
 <div class="container">
  <header class="row bg-white" style="height: 400px;">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/SOF3021-IT16306/imgae/banner2.jpg" class="d-block w-100" alt="..." style="height: 400px; ">
                  </div>
                  <div class="carousel-item">
                    <img src="/SOF3021-IT16306/imgae/banner2.jpg" class="d-block w-100" alt="..." style="height: 400px; ">
                  </div>
                  <div class="carousel-item">
                    <img src="https://wowslider.com/sliders/demo-93/data1/images/lake.jpg" class="d-block w-100" alt="..." style="height: 400px; ">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
          
        </header>
        
       <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
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
          <a class="nav-link" href="admin/orders/index_ord">Order</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="admin/order_detail/index_detail">Order_detail</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Đăng kí
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="admin/accounts/create">Đăng kí người dùng</a></li>
            <li><a class="dropdown-item" href="admin/categories/create">Thêm mới loại sản phẩm </a></li>
                  <li><a class="dropdown-item" href="admin/products/create_pro">Thêm mới  sản phẩm </a></li>
                   <li><a class="dropdown-item" href="admin/orders/create_ord">Thêm mới Order </a></li>
                   <li><a class="dropdown-item" href="admin/order_detail/create_detail">Thêm mới  OrdereDetail </a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

	 <article class="col-9 ">
            
            <div class="col-6">
                <div class="row mt-4">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/SOF3021-IT16306/imgae/aticer.jpg" class="d-block w-100" alt="..." style="height: 400px; ">
                  </div>
                  <div class="carousel-item">
                    <img src="/SOF3021-IT16306/imgae/at2.jpg" class="d-block w-100" alt="..." style="height: 400px; ">
                  </div>
                  
                </div>
                </div> 
                </div>
                </div>
            </article>
            
 </div>
	
	
	
	 <footer class="row card pt-3 bg-dark mt-2">
                 
                      <div class=" text-center text-white">
                        <p>FPT Polytechnic & copy 2017. All rights reserved.</p>
                  </div>
              </footer>
              <script src="/SOF3021-IT16306/js/jquery.min.js"></script>
	<script src="/SOF3021-IT16306/js/popper.min.js"></script>
	<script src="/SOF3021-IT16306/js/bootstrap.min.js"></script>
</body>
</html>