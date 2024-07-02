<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Poketienda - Editar</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
	<style>
		p {
			font-weight: bold;
		    color: black;
		    background: #98d8cb;
		}
		
		input {
			width: -webkit-fill-available;
		    border-radius: 4px;
		    height: 22px;
		    text-align: center;
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
			<h1 >Editar</h1>
	
			<form class="input-admin" action="admin" method="post">
				<input type="hidden" value="update" name="accion">
				<p>ID: <input required readonly value="${articulo.id}" name="id" /></p>
				<p>Articulo: <input type="text" required value="${articulo.nombreArticulo}" name="nombre" /></p>
				<p>Stock: <input type="number" required value="${articulo.cantidad}" name="cantidad" /></p>
				<p>Precio: <input type="number" required value="${articulo.precio}" name="precio" /></p>
				
				<input class="boton-mid-admin" type="submit" value="Confirmar"/>
			
			</form>
			
			<div style="margin-top: 10px;">
				<a href="admin?accion=index"><button class="boton-mid-admin">Volver</button></a>
			</div>
				
		</div>
	</body>
</html>