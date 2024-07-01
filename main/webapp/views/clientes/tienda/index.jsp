<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.flip-card {
	  background-color: transparent;
	  width: 250px;
      height: 250px;
	  perspective: 1000px;
	  padding: 10px;
	  border-radius: 10px;
	}
	
	.img-card {
	  width: 250px;
      height: 250px;
      border-radius: 10px;
	}
	
	.flip-card-inner {
	  position: relative;
	  width: 100%;
	  height: 100%;
	  text-align: center;
	  transition: transform 0.6s;
	  transform-style: preserve-3d;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
	  border-radius: 10px;
	}
	
	.flip-card:hover .flip-card-inner {
	  transform: rotateY(180deg);
	  border: solid 3px #b42b2b;
	  
	}
	
	.flip-card-front, .flip-card-back {
	  position: absolute;
	  width: 100%;
	  height: 100%;
	  -webkit-backface-visibility: hidden;
	  backface-visibility: hidden;
	  border-radius: 10px;
	}
	
	.flip-card-front {
	  background-color: #bbb;
	  color: black;
	  border-radius: 10px;
	}
	
	.flip-card-back {
	  /* background-color: #2980b9; */
	  background-color:#97d1f7;
	  color: white;
	  transform: rotateY(180deg);
	  border-radius: 10px;
	}
	
	body{
	  margin:0;
	  padding:0;
	}
	
	.btn{
	    cursor: pointer;
	    position: relative;
	    padding: 0px 35px;
	    background: white;
	    font-size: 20px;
	    border-top-right-radius: 10px;
	    border-bottom-left-radius: 10px;
	    transition: all 1s;
	    width: -webkit-fill-available;
	    margin-left: 10px;
	    height: 50px;
	    

	  &:after,&:before{
	    content:" ";
	    width:10px;
	    height:10px;
	    position:absolute;
	    border :0px solid #fff;
	    transition:all 1s;
	    }
	  &:after{
	    top:-1px;
	    left:-1px;
	    border-top:5px solid black;
	    border-left:5px solid black;
	  }
	  &:before{
	    bottom:-1px;
	    right:-1px;
	    border-bottom:5px solid black;
	    border-right:5px solid black;
	  }
	  &:hover{
	    border-top-right-radius:0px;
	  border-bottom-left-radius:0px;
	    // background:rgba(0,0,0,.5);
	    // color:white;
	    &:before,&:after{
	      
	      width:100%;
	      height:100%;
	      // border-color:white;
	    }
	  }
	}
	

</style>
	<title>Poketienda</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="body-tienda">

<header>
	<div class="botonera-tienda">
		<a class="a-tienda"><button class="btn">Tienda</button></a>
		<a class="a-tienda"><button class="btn">Ver Carrito</button></a>
		<a class="a-tienda"><button class="btn">Historial de Compras</button></a>
		<a class="a-tienda"><button class="btn">Cuenta</button></a>
		<a class="a-tienda"  href="${pageContext.request.contextPath}/clientes?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
	</div>
</header>

	<h1 class="saludo-tienda">Bienvenido <c:out value="${sessionScope.cliente.nombre}" default="Desconocido"></c:out> a la PokeTienda</h1>

	<div class="articulos-tienda">

		<c:forEach var="articulo" items="${listita}">
			<tr>
				<td> 
					<div class="flip-card">
					  <div class="flip-card-inner">
					    <div class="flip-card-front">
					      <img class="img-card" src="${pageContext.request.contextPath}/images/item-${articulo.nombreArticulo}.jpg" alt="Avatar">
					    </div>
					    <div class="flip-card-back">
					      <h1 class="nombre-articulo-tienda"><c:out value="${articulo.nombreArticulo}"/></h1>  
					      <p class="texto-articulo-tienda">Cantidad en stock: <c:out value="${articulo.cantidad}"/></p> 
					      <p class="texto-articulo-tienda">Precio: $<c:out value="${articulo.precio}"/></p>
					      <button class="boton-agregar-carrito-tienda">Agregar al carrito</button>
					    </div>
					  </div>
					</div>
				</td>
			</tr>
		</c:forEach>
		
	</div>

</body>
</html>