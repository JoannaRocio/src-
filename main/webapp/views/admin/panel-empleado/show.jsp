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
        table {
            border-collapse: collapse;
		    margin-bottom: 20px;
		    background: aliceblue;
		    width: auto;
		    font-size: 20px;
		    
        }

        th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
        }

  	</style>
	
	<body class="body-empleado">
	
		<header>
			<div class="botonera-tienda">
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=ver-panel"><button class="btn">Panel Empleado</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/admin?accion=venta"><button class="btn">Historial de Ventas</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
	
		<div class="contenedor-tabla-empleado">
			<div style="display:flex; justify-content: center; margin: 10px">
				<div style="margin-right:10px;">
				<h2>Articulo</h2>
					<table class="img-card">
					    <tr>
					        <th></th>
					        <th>Detalles</th>
					    </tr>
					    <tr>
					        <td>ID</td>
					        <td><c:out value="${articulo.id}"/></td>
					    </tr>
					    <tr>
					        <td>Nombre</td>
					        <td><c:out value="${articulo.nombreArticulo}"/></td>
					    </tr>
					    <tr>
					        <td>Stock</td>
					        <td><c:out value="${articulo.cantidad}"/></td>
					    </tr>
					    <tr>
					        <td>Precio</td>
					        <td>$<c:out value="${articulo.precio}"/></td>
					    </tr>
					</table>
				</div>
				
				<div style="margin-left:10px; ">
				<h2>Imagen del producto</h2>
					<div>
	                     <img class="img-card" style="border: 3px solid #0802b3;"
	                         src="${pageContext.request.contextPath}/images/item-${articulo.nombreArticulo}.jpg" 
	                         alt="Avatar" 
	                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/item-Nuevo.jpg';">
	              	</div>
				
				</div>
			</div>

			<div class="boton-container-admin">
				<a href="admin?accion=index"><button class="boton-alta-admin">Volver</button></a>
			</div>
		</div>
		
	</body>
</html>
