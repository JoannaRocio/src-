<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head>
		<meta charset="UTF-8">
		<title>Poketienda - Historial de Compras</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
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

  	</style>
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
		    <h2 class="saludo-tienda">Historial de Compras</h2>
		    <table border="1">
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>Cliente</th>
		                <th>Articulo</th>
		                <th>Cantidad</th>
		                <th>Precio Total</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="venta" items="${ventas}">
		                <tr>
		                    <td>${venta.id}</td>
		                    <td>${venta.cliente}</td>
		                    <td>${venta.articulo}</td>
		                    <td>${venta.cantidad}</td>
		                    <td>${venta.precioTotal}</td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
	</body>
</html>