<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Poketienda</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
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

	<h1 class="saludo-tienda">Bienvenido/a <c:out value="${sessionScope.cliente.nombre}" default="Desconocido"></c:out> a la PokeTienda</h1>

<div style="text-align: center;">
	<div class="articulos-tienda">

		<c:forEach var="articulo" items="${listita}" varStatus="status">
		    <c:if test="${status.index % 4 == 0}">
		        <tr>
		    </c:if>
		    
		    <td> 
		        <form action="tienda" method="post">
		            <div class="flip-card">
		                <div class="flip-card-inner">
		                    <div class="flip-card-front">
		                        <img class="img-card" 
                                 src="${pageContext.request.contextPath}/images/item-${articulo.nombreArticulo}.jpg" 
                                 alt="Avatar" 
                                 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/item-Nuevo.jpg';">
		                    </div>
		                    <div class="flip-card-back">
		                        <input type="hidden" name="id" value="${articulo.id}"/>
		                        <input type="hidden" name="nombreArticulo" value="${articulo.nombreArticulo}"/>
		                        <input type="hidden" value="agregar-articulo" name="accion"/>
		                        <h1 class="nombre-articulo-tienda"><c:out value="${articulo.nombreArticulo}"/></h1>  
		                        <p class="texto-articulo-tienda">Cantidad en stock: <c:out value="${articulo.cantidad}"/></p> 
		                        <p class="texto-articulo-tienda">Precio: $<c:out value="${articulo.precio}"/></p>
		                        <button class="boton-agregar-carrito-tienda" type="submit">Agregar al carrito</button>
		                    </div>
		                </div>
		            </div>
		        </form>
		    </td>
		    
		    <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
		        </tr>
		    </c:if>
		</c:forEach>
		
	</div>
</div>
</body>
</html>