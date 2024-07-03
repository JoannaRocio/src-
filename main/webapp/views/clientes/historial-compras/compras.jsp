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
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-compras&id=${cliente.id}"><button class="btn">Historial de Compras</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/clientes?accion=ver-saldo"><button class="btn">Cuenta</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/clientes?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
		<div class="contenedor-tabla-empleado">
		    <h2 class="saludo-tienda">Historial de Compras</h2>
		    <c:forEach var="compra" items="${listadoFacturas}">
		    <table border="1">
		        <thead>
		            <tr>
		                <th>ID Factura</th>
		                <th>Cliente</th>
		                <th>Articulo</th>
		            </tr>
		        </thead>
		        
		        <tbody>
		            <tr>
		                <td><c:out value="${compra.numeroFactura}"/></td>
		                <td><c:out value="${compra.idCliente}"/></td>
		                <td><c:out value="${compra.fecha}"/></td>
		            </tr>
		        </tbody>
		        <thead>
		            <tr>
		                <th>Articulo</th>
		                <th>Cantidad</th>
		                <th>Precio</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="articulo" items="${compra.articulos}">
			            <tr>
			                <td><c:out value="${articulo.nombreArticulo}"/></td>
			                <td><c:out value="1"/></td>
			                <td><c:out value="${articulo.precio}"/></td>
			            </tr>
			        </c:forEach> 
		        </tbody>
		        <tfoot>
		            <tr>
		                <td colspan="3"><strong>TOTAL: $<c:out value="${total}"/></strong></td>
		            </tr>
		       </tfoot>
		       
		    </table>
		    <br>
		    </c:forEach> 
		</div>
	</body>
</html>