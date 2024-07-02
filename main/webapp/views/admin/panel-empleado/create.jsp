<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Poketienda - Nuevo articulo</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
	<style>
		p {
			font-weight: bold;
		    color: black;
		    background: coral;
		}
		
		input {
			width: -webkit-fill-available;
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
			<h1>Alta</h1> 
			
			<form class="input-admin" action="admin" method="post">
				<!-- <p>ID: <input value="" name="id" /></p> -->
				<input type="hidden" value="insert" name="accion"/>
				<p>Articulo: <input type="text" required value="" name="nombre" /></p>
				<p>Stock: <input type="number" required value="" name="cantidad" /></p>
				<p>Precio: <input type="number" required value="" name="precio" /></p>
				
				
				<input class="boton-mid-admin" type="submit" value="Registrar"/>
			
				
			</form> 
			
			<div style="margin-top: 10px;">
					<a href="admin?accion=index"><button class="boton-mid-admin">Volver</button></a>
				</div>
			</div>
	</body>
</html>