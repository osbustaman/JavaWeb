package Models;

public class TelefonoColaborador {
    private int id;
    private Colaborador colaborador;
    private String tipoTelefono;
    private String numeroTelefono;

    public TelefonoColaborador(int id, Colaborador colaborador, String tipoTelefono, String numeroTelefono) {
        this.id = id;
        this.colaborador = colaborador;
        this.tipoTelefono = tipoTelefono;
        this.numeroTelefono = numeroTelefono;
    }

    public TelefonoColaborador(Colaborador colaborador, String tipoTelefono, String numeroTelefono) {
        this.colaborador = colaborador;
        this.tipoTelefono = tipoTelefono;
        this.numeroTelefono = numeroTelefono;
    }

    public TelefonoColaborador() {
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

    public String getTipoTelefono() {
        return tipoTelefono;
    }

    public void setTipoTelefono(String tipoTelefono) {
        this.tipoTelefono = tipoTelefono;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    @Override
    public String toString() {
        return "TelefonoColaborador{" + "id=" + id + ", colaborador=" + colaborador + ", tipoTelefono=" + tipoTelefono + ", numeroTelefono=" + numeroTelefono + '}';
    }
    
    
}
