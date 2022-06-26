<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Hello ${ message }</h1>
<form action="/SOF3021-IT16306/hello" method="GET">
<input type="text" name="ho_ten">
<button> Submit</button>
</form>
</body>
</html>