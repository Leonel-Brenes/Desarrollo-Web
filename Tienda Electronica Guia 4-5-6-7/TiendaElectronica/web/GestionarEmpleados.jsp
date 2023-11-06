<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
    </head>
    <body>
        <h1>Gestion de empleados</h1>
        <h2>Listado de empleados</h2>
        
        <h1>Conexion: ${mensaje_conexion}</h1>
        
            <table border="1">
            <thead>
                <tr>
                    <th>EmpleadoID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>DUI</th>
                    <th>Telefono</th>
                    <th>FechaNac</th>
                    <th>Direccion</th>
                    <th>CargoId</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEmpleados}" var="item">
                    <tr>
                        <td><c:out value="${item.empleadoId}" /></td>
                        <td><c:out value="${item.nombres} ${item.apellidos}" /></td>
                        <td><c:out value="${item.email}" /></td>
                        <td><c:out value="${item.dUI}" /></td>
                        <td><c:out value="${item.telefono}" /></td>
                        <td><c:out value="${item.fechaNac}" /></td>
                        <td><c:out value="${item.direccion}" /></td>
                        <td><c:out value="${item.cargoId}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
