<%-- <%@page import="models.Empleado"%>
<%-- <%@page import="models.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="repositories.EmpleadosRepoSingleton"%>
<%@page import="repositories.interfaces.EmpleadoRepo"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
/* 	EmpleadoRepo repo = EmpleadosRepoSingleton.getInstance();
	List<Empleado> listaEmple = repo.getAll();
	
	request.setAttribute("listita", listaEmple); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>

    <h1>Hola Administrador <c:out value="${sessionScope.empleado.nombre}" default="Desconocido"></c:out></h1>
    
    <a href="admin?accion=create">Agregar artículo (ALTA)</a>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Artículo</th>
                <th>Stock</th>     
                 <th>precio</th>   
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        
        <tbody>
            <c:forEach var="articulo" items="${listaArticulos}">
                <tr>
                    <td> <c:out value="${articulo.id}"/> </td>
                    <td> <c:out value="${articulo.nombreArticulo}"/> </td>
                    <td> <c:out value="${articulo.cantidad}"/> </td>
                    <td> <c:out value="${articulo.precio}"/> </td>
                    <td> <a href="admin?accion=show&id=${articulo.id}">Ver detalle</a> </td>
                    <td> <a href="admin?accion=edit&id=${articulo.id}">Editar(EDICIÓN)</a> </td>
                    <td> <a href="admin?accion=delete&id=${articulo.id}">Eliminar (BAJA)</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
