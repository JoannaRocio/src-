<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

	
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Poketienda</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
	
	<style>
	    .tabla-empleado {
	        border-collapse: collapse;
	        margin: 20px 0;
	        font-size: 18px;
	        text-align: left;
	    }
	
	    .tabla-empleado thead tr {
	        background-color: #009879;
	        color: white;
	        text-align: left;
	        font-weight: bold;
	    }
	
	    .tabla-empleado th, .tabla-empleado td {
	        padding: 12px 15px;
	        border: 1px solid #ddd;
	        
	    }
	
	    .tabla-empleado tbody tr:nth-of-type(even) {
	        background: burlywood;
	    }
	
	    .tabla-empleado tbody tr:hover {
	        background-color: #f1f1f1;
	    }
	
	    .tabla-empleado a {
	        color: #009879;
		    text-decoration: none;
		    background-color: #e6e4e4;
		    border-radius: 4px;
	    }
	
	    .tabla-empleado a:hover {
	        text-decoration: underline;
	        background-color: white;
	    }
	</style>
	
	<body class="body-empleado">

		<header>
			<div class="botonera-tienda">
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=ver-panel"><button class="btn">Panel Empleado</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/admin?accion=venta"><button class="btn">Historial de Ventas</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/empleados?accion=cerrar-sesion"><button class="btn">Cerrar sesion</button></a>
			</div>
		</header>

	    <h1 class="saludo-empleado">Hola Administrador <c:out value="${sessionScope.empleado.nombre}" default="Desconocido"></c:out></h1>
	    
	    
	    <div class="contenedor-tabla-empleado">
	    
		    <table class="tabla-empleado" border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Articulo</th>
                <th>Stock</th>     
		        <th>Precio</th>   
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        
        <tbody>
		            <c:if test="${empty listaArticulos}">
                <tr>
			                <td colspan="7" style="text-align: center;">No hay articulos disponibles</td>
			            </tr>
			        </c:if>
		            <c:forEach var="articulo" items="${listaArticulos}">
		                <tr style="background: beige;">
                    <td> <c:out value="${articulo.id}"/> </td>
                    <td> <c:out value="${articulo.nombreArticulo}"/> </td>
                    <td> <c:out value="${articulo.cantidad}"/> </td>
		                    <td> $<c:out value="${articulo.precio}"/> </td>
                    <td> <a href="admin?accion=show&id=${articulo.id}">Ver detalle</a> </td>
		                    <td> <a href="admin?accion=edit&id=${articulo.id}">Editar</a> </td>
		                    <td> <a href="admin?accion=delete&id=${articulo.id}">Eliminar</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
		    
		    <div class="boton-container-admin">
				<a href="admin?accion=create"><button class="boton-alta-admin">Agregar articulo nuevo</button></a>
			</div>
		</div>


</body>
</html>
