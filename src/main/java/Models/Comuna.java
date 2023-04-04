package Models;

public class Comuna {
    private int id;
    private String nombreComuna;
    private Region region;

    public Comuna(int id, String nombreComuna, Region region) {
        this.id = id;
        this.nombreComuna = nombreComuna;
        this.region = region;
    }

    public Comuna(String nombreComuna, Region region) {
        this.nombreComuna = nombreComuna;
        this.region = region;
    }

    public Comuna() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreComuna() {
        return nombreComuna;
    }

    public void setNombreComuna(String nombreComuna) {
        this.nombreComuna = nombreComuna;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    @Override
    public String toString() {
        return "Comuna{" + "id=" + id + ", nombreComuna=" + nombreComuna + ", region=" + region + '}';
    }
}