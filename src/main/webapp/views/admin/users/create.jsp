<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16306 - Create User</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
</head>
<body>
<form:form method="POST"
	modelAttribute="user"
 action="/SOF3021-IT16306/admin/users/store">
<div>
<div>
<label>Ho Ten</label>
 <form:input name="hoTen" path="hoTen"/>
 <form:errors path="hoTen"   class="text"></form:errors>
 </div>
 <div>
 <label>Dia Chi</label>
  <form:input name="diaChi" path="diaChi"/>
  <form:errors path="diaChi"  class="text-danger" style="color-red"></form:errors>
  </div>
  <div>
  <label>GioiTinh</label>
  <form:radiobutton name="gioiTinh" path="gioiTinh" value="1" label="Nam"/>
    <form:radiobutton name="gioiTinh" path="gioiTinh" value="0" label="Nu"/>
    </div>
    <div>
  <label>Email</label>
   <form:input type="email" name="email" path="email"/>
   <form:errors path="email"  class="text-danger" style="color-red"></form:errors>
   </div>
   <div>
   <label>Password</label>
   <form:input name="password" path="password" type="password"/>
      <form:errors path="password" class="text-danger" style="color-red"></form:errors>
   </div>
   <div>
   <label>sdt</label>
   <form:input name="sdt" path="sdt"/>
   <form:errors path="sdt"  class="text-danger" style="color-red"></form:errors>
   </div>
   <div>
   <label>avatar</label>
   <form:input name="avatar" path="avatar"/>
   </div>
   <button>Save</button>
   
   
</div>

</form:form>

</body>
</html>