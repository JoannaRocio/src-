<%-- <%@page import="repositories.EmpleadosRepoSingleton"%>
<%@page import="models.Empleado"%>
<%@page import="repositories.interfaces.EmpleadoRepo"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Panel Admin - Articulo</title>
</head>
<body>

<h1>Art�culo</h1>

<p>ID: 
    <c:out value="${articulo.id}"></c:out> 
</p>

<p>Nombre: 
    <c:out value="${articulo.nombreArticulo}"></c:out> 
</p>

<p>Stock: 
    <c:out value="${articulo.cantidad}"></c:out> 
</p>
<p>Precio: 
    <c:out value="${articulo.precio}"></c:out> 
</p>


<h1>Eliminar:</h1>

<form action="admin" method="post">
    <input type="hidden" name="id" value="${articulo.id}">    
    <input type="hidden" name="accion" value="delete">
    <input type="submit" value="Eliminar art�culo">
</form>

</body>
</html>
