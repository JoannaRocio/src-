<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Poketienda</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
		<title>Poketienda - Carrito de Compras</title>
	    <style>
	        table {
	        border-collapse: collapse;
	        margin-bottom: 20px;
		    background: aliceblue;
	        }
	
	        th, td {
	        border: 1px solid #ccc;
	        padding: 8px;
	        text-align: center;
	        }
	
	        .btn-carrito {
	        padding: 10px 20px;
	        font-size: 16px;
	        margin-right: 10px;
	        }
	  </style>
	</head>
	
	<body class="body-tienda">
	
		<header>
			<div class="botonera-tienda">
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=tienda"><button class="btn">Tienda</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-carrito"><button class="btn">Ver Carrito</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-compras"><button class="btn">Historial de Compras</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/clientes?accion=ver-saldo"><button class="btn">Cuenta</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/clientes?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
		<div class="contenedor-tabla-empleado">
		    <h1 class="saludo-tienda">POKE-CARRITO</h1>
		
		    <table>
		        <thead>
		            <tr>
		                <th>Producto</th>
		                <th>Precio unitario</th>
		                <th>Cantidad</th>
		              	<th>Opcion</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="articulo" items="${listita}">
			            <tr>
			                <td><c:out value="${articulo.nombreArticulo}"/></td>
			                <td>$<c:out value="${articulo.precio}"/></td>
			                <td>1</td>
			                <td><button>Quitar</button></td>
			            </tr>
			        </c:forEach>
		        </tbody>
		        <tfoot>
		            <tr>
		                <td colspan="3"><strong>Total a Pagar:</strong></td>
		                <td><strong>$<c:out value="${total}"/></strong></td>
		               <!--  <th></th> -->
		            </tr>
		        </tfoot>
		    </table>
		    <button class="btn" onclick="history.back()">VOLVER A LA TIENDA</button>
		    <a class="facturas" href="${pageContext.request.contextPath}/tienda?accion=factura"><button class="btn">PAGAR Y FINALIZAR</button></a>
	</body>
</html>