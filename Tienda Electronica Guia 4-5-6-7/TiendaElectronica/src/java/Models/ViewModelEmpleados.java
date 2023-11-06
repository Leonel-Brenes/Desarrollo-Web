package Models;


import java.util.Date;

public class ViewModelEmpleados {

    /**
     * @return the empleadoId
     */
    public int getEmpleadoId() {
        return empleadoId;
    }

    /**
     * @param empleadoId the empleadoId to set
     */
    public void setEmpleadoId(int empleadoId) {
        this.empleadoId = empleadoId;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the dUI
     */
    public String getdUI() {
        return dUI;
    }

    /**
     * @param dUI the dUI to set
     */
    public void setdUI(String dUI) {
        this.dUI = dUI;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the fechaNac
     */
    public Date getFechaNac() {
        return fechaNac;
    }

    /**
     * @param fechaNac the fechaNac to set
     */
    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the cargoId
     */
    public int getCargoId() {
        return cargoId;
    }

    /**
     * @param cargoId the cargoId to set
     */
    public void setCargoId(int cargoId) {
        this.cargoId = cargoId;
    }

   
    private int empleadoId;
    private String nombres;
    private String apellidos;
    private String email;
    private String dUI;
    private String telefono;
    private Date fechaNac;
    private String direccion;
    private int cargoId;
   

}
