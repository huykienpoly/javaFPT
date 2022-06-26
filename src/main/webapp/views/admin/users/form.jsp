<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form method="POST"
	modelAttribute="sv"
	 action="/SOF3021-IT16306/admin/users/store">
<div>
<label>Ho ten</label>
<form:input name="name" path="name"/>
</div>

<div>
<label>email</label>
<form:input name="email" path="email"/>
</div>

 <div>
  <label>GioiTinh</label>
  <form:radiobutton name="marks" path="marks" value="1" label="Nam"/>
    <form:radiobutton name="marks" path="marks" value="0" label="Nu"/>
    </div>
<form:select path="">
<form:option value=""></form:option>
</form:select>


</form:form>
</body>
</html>