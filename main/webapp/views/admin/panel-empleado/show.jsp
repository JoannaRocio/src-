<%-- <%@page import="repositories.EmpleadosRepoSingleton"%>
<%@page import="models.Empleado"%>
<%@page import="repositories.interfaces.EmpleadoRepo"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Poketienda - Ver articulo</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
	<style>
		p {
			font-weight: bold;
		    color: black;
		    width: fit-content;
		    font-size: 24px;
		}
		
		input {
		    border-radius: 4px;
		    height: 22px;
    	}
	</style>
	
	<body class="body-empleado">
	
		<header>
			<div class="botonera-tienda">
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=ver-panel"><button class="btn">Panel Empleado</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=ver-historial"><button class="btn">Historial de Ventas</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
	
		<div class="contenedor-tabla-empleado">
		
			<h1>Articulo</h1>
			
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
			    $<c:out value="${articulo.precio}"></c:out> 
			</p>
			
			
			<div class="boton-container-admin">
				<a href="admin?accion=index"><button class="boton-alta-admin">Volver</button></a>
			</div>
		</div>
		
	</body>
</html>
