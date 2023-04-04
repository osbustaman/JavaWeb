package Models;

public class Empresa {
    private int id;
    private String rut;
    private String nombreEmpresa;
    private String giro;
    private String direccion;
    private Pais pais;
    private Region region;
    private Comuna comuna;
    private String rutRepresentante;
    private String nombreRepresentante;

    public Empresa(int id, String rut, String nombreEmpresa, String giro, String direccion, Pais pais, Region region, Comuna comuna, String rutRepresentante, String nombreRepresentante) {
        this.id = id;
        this.rut = rut;
        this.nombreEmpresa = nombreEmpresa;
        this.giro = giro;
        this.direccion = direccion;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.rutRepresentante = rutRepresentante;
        this.nombreRepresentante = nombreRepresentante;
    }

    public Empresa(String rut, String nombreEmpresa, String giro, String direccion, Pais pais, Region region, Comuna comuna, String rutRepresentante, String nombreRepresentante) {
        this.rut = rut;
        this.nombreEmpresa = nombreEmpresa;
        this.giro = giro;
        this.direccion = direccion;
        this.pais = pais;
        this.region = region;
        this.comuna = comuna;
        this.rutRepresentante = rutRepresentante;
        this.nombreRepresentante = nombreRepresentante;
    }

    public Empresa() {
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

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getGiro() {
        return giro;
    }

    public void setGiro(String giro) {
        this.giro = giro;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
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

    public String getRutRepresentante() {
        return rutRepresentante;
    }

    public void setRutRepresentante(String rutRepresentante) {
        this.rutRepresentante = rutRepresentante;
    }

    public String getNombreRepresentante() {
        return nombreRepresentante;
    }

    public void setNombreRepresentante(String nombreRepresentante) {
        this.nombreRepresentante = nombreRepresentante;
    }

    @Override
    public String toString() {
        return "Empresa{" + "id=" + id + ", rut=" + rut + ", nombreEmpresa=" + nombreEmpresa + ", giro=" + giro + ", direccion=" + direccion + ", pais=" + pais + ", region=" + region + ", comuna=" + comuna + ", rutRepresentante=" + rutRepresentante + ", nombreRepresentante=" + nombreRepresentante + '}';
    }
    
    
}
