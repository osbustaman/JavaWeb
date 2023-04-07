package Models;

public class Colaborador {
    private int id;
    private String rut;
    private String nombres;
    private String apellidos;
    private Pais pais;
    private Region region;
    private Comuna comuna;
    private String direccion;
    private String estadoCivil;
    private String sexo;
    private Empresa empresa;
    private Cargo cargo;
    private String fechaIngreso;
    private String password;
    private int perfil;
    private String tokenSesion;
    private String pathColaborador;
    private String imageColaborador;

    public Colaborador(int id, String rut, String nombres, String apellidos, Pais pais, Region region, Comuna comuna, String direccion, String estadoCivil, String sexo, Empresa empresa, Cargo cargo, String fechaIngreso, String password, int perfil, String tokenSesion, String pathColaborador, String imageColaborador) {
        this.id = id;
        this.rut = rut;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.direccion = direccion;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.empresa = empresa;
        this.cargo = cargo;
        this.fechaIngreso = fechaIngreso;
        this.password = password;
        this.perfil = perfil;
        this.tokenSesion = tokenSesion;
        this.pathColaborador = pathColaborador;
        this.imageColaborador = imageColaborador;
    }

    public Colaborador(String rut, String nombres, String apellidos, Pais pais, Region region, Comuna comuna, String direccion, String estadoCivil, String sexo, Empresa empresa, Cargo cargo, String fechaIngreso, String password, int perfil, String tokenSesion, String pathColaborador, String imageColaborador) {
        this.rut = rut;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.direccion = direccion;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.empresa = empresa;
        this.cargo = cargo;
        this.fechaIngreso = fechaIngreso;
        this.password = password;
        this.perfil = perfil;
        this.tokenSesion = tokenSesion;
        this.pathColaborador = pathColaborador;
        this.imageColaborador = imageColaborador;
    }
    
    public Colaborador(String rut, String nombres, String apellidos, Pais pais, Region region, Comuna comuna, String direccion, String estadoCivil, String sexo, Empresa empresa, Cargo cargo, String fechaIngreso, String password, int perfil, String pathColaborador) {
        this.rut = rut;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.direccion = direccion;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.empresa = empresa;
        this.cargo = cargo;
        this.fechaIngreso = fechaIngreso;
        this.password = password;
        this.perfil = perfil;
        this.pathColaborador = pathColaborador;
    }

    public Colaborador() {
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPathColaborador() {
        return pathColaborador;
    }

    public void setPathColaborador(String pathColaborador) {
        this.pathColaborador = pathColaborador;
    }

    public String getImageColaborador() {
        return imageColaborador;
    }

    public void setImageColaborador(String imageColaborador) {
        this.imageColaborador = imageColaborador;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getPerfil() {
        return perfil;
    }

    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }

    public String getTokenSesion() {
        return tokenSesion;
    }

    public void setTokenSesion(String tokenSesion) {
        this.tokenSesion = tokenSesion;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Comuna getComuna() {
        return comuna;
    }

    public void setComuna(Comuna comuna) {
        this.comuna = comuna;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    @Override
    public String toString() {
        return "Colaborador{" + "id=" + id + ", rut=" + rut + ", pais=" + pais + ", region=" + region + ", comuna=" + comuna + ", direccion=" + direccion + ", estadoCivil=" + estadoCivil + ", sexo=" + sexo + ", empresa=" + empresa + ", cargo=" + cargo + ", fechaIngreso=" + fechaIngreso + '}';
    }
    
    
}
