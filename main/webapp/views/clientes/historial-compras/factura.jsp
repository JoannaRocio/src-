<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Factura</title>
	    <style>
	        table {
	        width: 100%;
	        border-collapse: collapse;
	        margin-bottom: 20px;
	        }
	
	        th, td {
	        border: 1px solid #ccc;
	        padding: 8px;
	        text-align: center;
	        }
	
	        .btn {
	        padding: 10px 20px;
	        font-size: 16px;
	        margin-right: 10px;
	        }
	        
	        .container-factura {
	        	padding:10px;
	        	background: white;
	        }
	        
	        .body-factura {
		        display: flex;
			    justify-content: center;
			    align-items: center;
			    font-family: Arial, sans-serif;
			    background-image: url('../images/fondo-squirtle-amarillo.jpg');
			    background-size: cover; /* Ajusta la imagen para que cubra todo el fondo */
			    background-position: center; /* Centra la imagen */
			    background-repeat: no-repeat; /* Evita que la imagen se repita */
			    height: 100vh; /* Asegura que el cuerpo ocupe toda la altura de la ventana */
			    margin: 0; /* Elimina cualquier margen del body */
		    }
	  </style>
	</head>
	<body class="body-factura">
		<div class="container-factura">
		    <h1>FACTURA N° 00007896</h1>
			<form class="form-login" action="tienda" method="post">
			    <table>
			        <thead>
			            <tr>
			                <th>Nro Factura</th>
			                <th>Id Cliente</th>
			                <th>Fecha</th>
			            </tr>
			        </thead>
			        <tbody>
				            <tr>
				                <td><c:out value="${facturaNueva.numeroFactura}"/></td>
				                <td><c:out value="${facturaNueva.idCliente}"/></td>
				                <td><c:out value="${facturaNueva.fecha}"/></td>
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
			        	<c:forEach var="factura" items="${facturaNueva.articulos}">
				            <tr>
				                <td><c:out value="${factura.nombreArticulo}"/></td>
				                <td><c:out value="1"/></td>
				                <td><c:out value="${factura.precio}"/></td>
				            </tr>
				        </c:forEach> 
			        </tbody>
			        <tfoot>
			            <tr>
			                <td colspan="3"><strong>TOTAL: $<c:out value="${total}"/></strong></td>
			            </tr>
			        </tfoot>
			    </table>
			    
	    		<input type="hidden" value="volver-tienda" name="accion"/>
			    <button class="btn" type="submit">VOLVER A LA TIENDA</button>
			</form>
		</div>
	</body>
</html>