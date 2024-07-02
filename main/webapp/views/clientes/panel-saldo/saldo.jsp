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
		        height: 22px;
		        text-align: center;
		    }
		
		    .formSaldo {
		        display: table-caption;
		    }
		
		    .boton-mid-saldo {
		        width: 200px;
		        height: 40px;
		        font-size: 16px;
		        font-weight: bold;
		        background: cornflowerblue;
		        color: antiquewhite;
		        border-radius: 24px;
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
		</style>
		
		<title>Poketienda - Saldo</title>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
	</head>
	
	<body class="body-sueldo">
	
		<header>
			<div class="botonera-tienda">
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=tienda"><button class="btn">Tienda</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-carrito"><button class="btn">Ver Carrito</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/tienda?accion=ver-compras"><button class="btn">Historial de Compras</button></a>
				<a class="a-tienda" href="${pageContext.request.contextPath}/clientes?accion=ver-saldo"><button class="btn">Cuenta</button></a>
				<a class="a-tienda"  href="${pageContext.request.contextPath}/clientes?accion=cerrar-sesion"><button class="btn">Cerrar sesión</button></a>
			</div>
		</header>
		
		<h1 class="saludo-tienda"> Saldo de tu PokeTienda</h1>
		
		<div style="text-align: -webkit-center;">
		    <form class="formSaldo">
		        <label>Saldo: </label>
		        <input type="number" name="saldo" readonly value="${cliente.saldo}" />
		        
		        <div></div>
		        
		        <label>Ingresar Dinero: </label>
		        <input type="number" name="addSaldo" />
		        <button type="submit" class="boton-mid-saldo">Ingresar Saldo</button>
		        
		        <div></div>
		        
		        <label>Retirar Dinero: </label>
		        <input type="number" name="retirarSaldo" />
		        <button type="button" class="boton-mid-saldo">Retirar Saldo</button>
		    </form>    
		</div>
	
	</body>
</html>