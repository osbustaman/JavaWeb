package Models;

public class Region {
    private int id;
    private String nombreRegion;
    private Pais pais;

    public Region(int id, String nombreRegion, Pais pais) {
        this.id = id;
        this.nombreRegion = nombreRegion;
        this.pais = pais;
    }

    public Region(String nombreRegion, Pais pais) {
        this.nombreRegion = nombreRegion;
        this.pais = pais;
    }

    public Region(int id, String nombreRegion) {
        this.id = id;
        this.nombreRegion = nombreRegion;
    }
    
    public Region(int id) {
        this.id = id;
    }

    public Region() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreRegion() {
        return nombreRegion;
    }

    public void setNombreRegion(String nombreRegion) {
        this.nombreRegion = nombreRegion;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    @Override
    public String toString() {
        return "Region{" + "id=" + id + ", nombreRegion=" + nombreRegion + ", pais=" + pais + '}';
    }
    
    
    
}
