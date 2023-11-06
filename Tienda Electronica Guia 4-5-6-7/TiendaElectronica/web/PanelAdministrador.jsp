<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div><h1>Tienda Electronica</h1></div>
        <%-- Setear la variable usuario con el parametro de la vista e imprimir--%>
        <c:set var="usuario" value="${param.tfUsuario}" />
        <div><h3><strong>¡Bienvenido, <c:out value="${usuario}" />!</strong></h3></div>

        <%-- Directiva Include --%>
        <div><h3>Men&uacute; de opciones</h3></div>
        <div>
            <%@include file="MenuAdministrador.jsp" %>
        </div>
        <div>            
            <%@include file="Footer.html" %>
        </div>  
    </body>
</html>
