<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
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
	  </style>
	</head>
	<body>
	    <h1>FACTURA N° 00007896</h1>
		<form class="form-login" action="auth" method="post">
		    <table>
		        <thead>
		            <tr>
		                <th>Producto</th>
		                <th>Precio</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="articulo" items="${listita}">
			            <tr>
			                <td><c:out value="${articulo.nombreArticulo}"/></td>
			                <td>$<c:out value="${articulo.precio}"/></td>
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
	</body>
</html>