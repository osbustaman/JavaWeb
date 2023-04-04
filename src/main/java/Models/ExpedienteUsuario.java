package Models;

public class ExpedienteUsuario {
    private int id;
    private Colaborador colaborador;
    private String path;
    private String nombreArchivo;

    public ExpedienteUsuario(int id, Colaborador colaborador, String path, String nombreArchivo) {
        this.id = id;
        this.colaborador = colaborador;
        this.path = path;
        this.nombreArchivo = nombreArchivo;
    }

    public ExpedienteUsuario(Colaborador colaborador, String path, String nombreArchivo) {
        this.colaborador = colaborador;
        this.path = path;
        this.nombreArchivo = nombreArchivo;
    }

    public ExpedienteUsuario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Colaborador getColaborador() {
        return colaborador;
    }

    public void setColaborador(Colaborador colaborador) {
        this.colaborador = colaborador;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getNombreArchivo() {
        return nombreArchivo;
    }

    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }

    @Override
    public String toString() {
        return "ExpedienteUsuario{" + "id=" + id + ", colaborador=" + colaborador + ", path=" + path + ", nombreArchivo=" + nombreArchivo + '}';
    }
    
    
}
