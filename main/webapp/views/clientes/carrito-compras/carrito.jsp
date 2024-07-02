<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>CARRITO</title>
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
	  </style>
	</head>
	<body>
	    <h1>POKE-CARRITO</h1>
	
		    <table>
		        <thead>
		            <tr>
		                <th>Producto</th>
		                <th>Precio unitario</th>
		                <th>Cantidad</th>
		                <th>Subtotal</th>
		                <th>Quitar</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="articulo" items="${listita}">
			            <tr>
			                <td><c:out value="${articulo.nombreArticulo}"/></td>
			                <td>$<c:out value="${articulo.precio}"/></td>
			                <td>1</td>
			                <td>SUBTOTAL</td>
			                <td><button>Quitar</button></td>
			            </tr>
			        </c:forEach>
		            <tr>
		                <td>Producto 2</td>
		                <td>$</td>
		                <td>X</td>
		                <td>SUBTOTAL</td>
		                <td><button>Quitar</button></td>
		            </tr>
		        </tbody>
		        <tfoot>
		            <tr>
		                <td colspan="3"><strong>Total:</strong></td>
		                <td><strong>PRECIO TOTAL</strong></td>
		            </tr>
		        </tfoot>
		    </table>
		
		    <button class="btn">VOLVER A LA TIENDA</button>
		    <button class="btn">PAGAR Y FINALIZAR</button>
	</body>
</html>