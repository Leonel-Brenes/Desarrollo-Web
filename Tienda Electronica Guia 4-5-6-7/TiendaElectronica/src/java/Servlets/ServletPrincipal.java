/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import Models.ViewModelEmpleados;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ServletPrincipal extends HttpServlet {

    //AGREGAR ESTO
    private final String usuario = "sa";
    private final String contrasenia = "Salarrue17082002";
    private final String servidor = "localhost:1433";
    private final String bd = "TiendaElectronica";
    
    String url = "jdbc:sqlserver://" 
            + servidor 
            + ";databaseName=" + bd 
            + ";user=" + usuario 
            + ";password=" + contrasenia 
            + ";encrypt=false;trustServerCertificate=false;";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

        public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Empleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEmpleados Empleados = new ViewModelEmpleados();
                    Empleados.setEmpleadoId(rs.getInt("empleadoId"));
                    Empleados.setNombres(rs.getString("nombres"));
                    Empleados.setApellidos(rs.getString("apellidos"));
                    Empleados.setEmail(rs.getString("email"));
                    Empleados.setdUI(rs.getString("dUI"));
                    Empleados.setTelefono(rs.getString("telefono"));
                    Empleados.setFechaNac(rs.getDate("fechaNac"));
                    Empleados.setDireccion(rs.getString("direccion"));
                    Empleados.setCargoId(rs.getInt("cargoId"));
                   
                    listaEmpleados.add(Empleados);
                }               
                request.setAttribute("listaEmpleados", listaEmpleados);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        } else if (accion.equals("RegistroEmpleado")) {
            request.getRequestDispatcher("/RegistroEmpleado.html").forward(request, response);
        } else if (accion.equals("RegistroCliente")) {
            request.getRequestDispatcher("/RegistroCliente.html").forward(request, response);
        } else if (accion.equals("RegistroProductos")) {
            request.getRequestDispatcher("/RegistroProductos.html").forward(request, response);
        } else if (accion.equals("RegistroCategoria")) {
            request.getRequestDispatcher("/RegistroCategoria.html").forward(request, response);
        } //AGREGAR ESTO
        else if (accion.equals("GestionarEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("/GestionarEmpleados.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equals("Login")) {
            String usuario = request.getParameter("tfUsuario");
            String contrasenia = request.getParameter("tfContrasenia");

            try (PrintWriter print = response.getWriter()) {
                if (usuario.equals("admin") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("/PanelAdministrador.jsp").forward(request, response);

                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Tienda Electronica</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h2>Error: La contraseña o el usuario son erróneos</h2>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
