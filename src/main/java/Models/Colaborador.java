package Models;

public class Colaborador {
    private int id;
    private String rut;
    private Pais pais;
    private Region region;
    private Comuna comuna;
    private String direccion;
    private String estadoCivil;
    private String sexo;
    private Empresa empresa;
    private Cargo cargo;
    private String fechaIngreso;
    private int perfil;
    private String tokenSesion;

    public Colaborador(int id, String rut, Pais pais, Region region, Comuna comuna, String direccion, String estadoCivil, String sexo, Empresa empresa, Cargo cargo, String fechaIngreso, int perfil, String tokenSesion) {
        this.id = id;
        this.rut = rut;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.direccion = direccion;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.empresa = empresa;
        this.cargo = cargo;
        this.fechaIngreso = fechaIngreso;
        this.perfil = perfil;
        this.tokenSesion = tokenSesion;
    }

    public Colaborador(String rut, Pais pais, Region region, Comuna comuna, String direccion, String estadoCivil, String sexo, Empresa empresa, Cargo cargo, String fechaIngreso, int perfil, String tokenSesion) {
        this.rut = rut;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.direccion = direccion;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.empresa = empresa;
        this.cargo = cargo;
        this.fechaIngreso = fechaIngreso;
        this.perfil = perfil;
        this.tokenSesion = tokenSesion;
    }

    public Colaborador() {
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
