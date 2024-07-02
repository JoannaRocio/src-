<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  
<h1>Alta</h1> 

<form action="admin" method="post">
	<!-- <p>ID: <input value="" name="id" /></p> -->
	<input type="hidden" value="insert" name="accion"/>
	<p>Articulo: <input value="" name="nombre" /></p>
	<p>stock: <input value="" name="cantidad" /></p>
	<p>precio: <input value="" name="precio" /></p>
	
	
	<input type="submit" value="Registrar"/>

</form> 

</body>
</html>