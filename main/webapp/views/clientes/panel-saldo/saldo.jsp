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
		        background-color: #97d1f7;
		        color: white;
		        transform: rotateY(180deg);
		        border-radius: 10px;
		    }
		
		    p {
		        font-weight: bold;
		        color: black;
		        background: coral;
		    }
		
		    input {
		        margin: 10px;
		        width: -webkit-fill-available;
		        border-radius: 4px;
		        text-align: center;
		        font-size: 18px;
		    }
		
		    .formSaldo {
		        padding: 5px;
			    width: 240px;
			    background: ghostwhite;
			    border-radius: 25px;
		    }
		
		    .boton-mid-saldo {
		        width: 200px;
		        height: 40px;
		        font-size: 16px;
		        font-weight: bold;
		        background: cornflowerblue;
		        color: antiquewhite;
		        border-radius: 24px;
		        cursor: pointer;
		    }
		    
		    .boton-mid-saldo:hover {
		    	background: #88aae8;
		    }
		
		    .btn {
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
		    }
		
		    .btn:after, .btn:before {
		        content: " ";
		        width: 10px;
		        height: 10px;
		        position: absolute;
		        border: 0px solid #fff;
		        transition: all 1s;
		    }
		
		    .btn:after {
		        top: -1px;
		        left: -1px;
		        border-top: 5px solid black;
		        border-left: 5px solid black;
		    }
		
		    .btn:before {
		        bottom: -1px;
		        right: -1px;
		        border-bottom: 5px solid black;
		        border-right: 5px solid black;
		    }
		
		    .btn:hover {
		        border-top-right-radius: 0px;
		        border-bottom-left-radius: 0px;
		    }
		
		    .btn:hover:before, .btn:hover:after {
		        width: 100%;
		        height: 100%;
		    }
		    
		    label {
		        font-size: 20px;
			    /* font-weight: bold; */
			    width: 100%;
			    }
		</style>
		
		<title>Poketienda - Saldo</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
	<body class="body-sueldo">
	
		<header>
			<div class="botonera-tienda">
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=tienda"><button class="btn">Tienda</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-carrito"><button class="btn">Ver Carrito</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-compras&id=${cliente.id}"><button class="btn">Historial de Compras</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/clientes?accion=ver-saldo"><button class="btn">Cuenta</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/clientes?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
		
		<h1 class="saludo-tienda" style="color:white;"> Saldo de tu PokeTienda</h1>
		
		<div style="text-align: -webkit-center;">
		    <form class="formSaldo" action="clientes"  method="post">
		        <h3>Saldo en cuenta</h3>
		        <input type="number" name="saldo" readonly value="${cliente.saldo}" />
		        
		        <div></div>
		        
		        <label>Ingresar Dinero: </label>
		        <!-- <input type="hidden" value="ingresar-dinero" name="accion"/> -->
		        <input type="hidden" name="id" value="${cliente.id}"/>
		        <input required type="number" name="dineroAIngresar" />
		        <button type="submit" name="accion" value="ingresar-dinero" class="boton-mid-saldo">Ingresar Dinero</button>
		    </form>  
		    
		    <br>
		    
		    <form class="formSaldo" action="clientes" method="post">
		    
			    <h3>Transferir Dinero</h3>
			    <h4>Seleccionar usuario a quien desea transferirle dinero:</h4>
			    
			    <div>
				    <select class="dropdown-saldo" name="destinatarioId">
				        <c:forEach var="cliente1" items="${clientes}">
				            <c:if test="${cliente1.id != cliente.id}">
				                <option value="${cliente1.id}">${cliente1.nombre}</option>
				            </c:if>
				        </c:forEach>
				    </select>
				</div>
			    <br>
			    
			    <label>Cantidad a transferir:</label>
			    
			    <input type="number" name="cantidad" required />
			    
			    <input type="hidden" name="id" value="${cliente.id}"/>
				<!-- <input type="hidden" value="transferir-dinero" name="accion"/>	 -->
			    <button type="submit" name="accion" value="transferir-dinero" class="boton-mid-saldo">Transferir Dinero</button>
			</form>
			
			<br>
			
		<c:if test="${not empty mensaje}">
		    <div class="mensaje">
		        <c:out value="${mensaje}" />
		    </div>
		</c:if>
				      
		</div>
	
	</body>
</html>