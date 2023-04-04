package Models;

public class Cargo {
    private int id;
    private String nombreCargo;

    public Cargo(int id, String nombreCargo) {
        this.id = id;
        this.nombreCargo = nombreCargo;
    }

    public Cargo(String nombreCargo) {
        this.nombreCargo = nombreCargo;
    }

    public Cargo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreCargo() {
        return nombreCargo;
    }

    public void setNombreCargo(String nombreCargo) {
        this.nombreCargo = nombreCargo;
    }

    @Override
    public String toString() {
        return "Cargo{" + "id=" + id + ", nombreCargo=" + nombreCargo + '}';
    }
}
