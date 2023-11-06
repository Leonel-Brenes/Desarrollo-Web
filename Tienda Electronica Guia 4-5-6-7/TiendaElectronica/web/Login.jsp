<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN TIENDA ELECTRONICA</title>
    </head>
    <body>
        <form method="POST" action="/TiendaElectronica/ServletPrincipal?accion=Login" id="formLogin">
            <div id="resultLogin"></div>    
            <div><h1>TIENDA ELECTRONICA</h1></div>           
            <%-- Crear objeto de la clase Date y formatear la fecha --%>
            <c:set var="fechaActual" value="<%= new java.util.Date() %>" />
            <c:set var="formatoFecha" value="dd/MM/YYYY" />         
            <%-- Imprimir fecha --%>            
            <div><label><strong>
                <c:out value="Fecha actual: "/>
                <fmt:formatDate value='${fechaActual}' pattern='${formatoFecha}' />
            </strong></label></div><br>
            <div><label>Usuario:</label></div>            
            <div><input type="text" name="tfUsuario" id="idtfUsuario"></div><br>
            <div><label>Contrase&ntilde;a:</label></div>
            <div><input type="password" name="tfContrasenia" id="idtfContrasenia" ></div><br>
            <div><input type="submit" value="Iniciar Sesi&oacute;n"></div>
        </form>    
    </body>
</html>
