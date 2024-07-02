<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- <%@page import="repositories.EmpleadosRepoSingleton"%>
<%@page import="models.Empleado"%>
<%@page import="repositories.interfaces.EmpleadoRepo"%> --%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
/* 	EmpleadoRepo repo = EmpleadosRepoSingleton.getInstance();

	Empleado emple = repo.findById(2);
	
	request.setAttribute("empleado", emple); */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar</title>
</head>
<body>
<h1>Editar</h1>

<form action="admin" method="post">
	<input type="hidden" value="update" name="accion">
	<p>ID: <input value="${Articulo.id}" name="id" /></p>
	<p>Articulo: <input value="${Articulo.nombreArticulo}" name="nombre" /></p>
	<p>Stock: <input value="${Articulo.cantidad}" name="cantidad" /></p>
	<p>Precio: <input value="${Articulo.precio}" name="precio" /></p>
	
	<input type="submit" value="Confirmar"/>

</form>

</body>
</html>