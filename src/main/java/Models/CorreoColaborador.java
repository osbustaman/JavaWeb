package Models;

public class CorreoColaborador {
    private int id;
    private Colaborador colaborador;
    private String tipoCorreo;
    private String correo;

    public CorreoColaborador(int id, Colaborador colaborador, String tipoCorreo, String correo) {
        this.id = id;
        this.colaborador = colaborador;
        this.tipoCorreo = tipoCorreo;
        this.correo = correo;
    }

    public CorreoColaborador(Colaborador colaborador, String tipoCorreo, String correo) {
        this.colaborador = colaborador;
        this.tipoCorreo = tipoCorreo;
        this.correo = correo;
    }

    public CorreoColaborador() {
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

    public String getTipoCorreo() {
        return tipoCorreo;
    }

    public void setTipoCorreo(String tipoCorreo) {
        this.tipoCorreo = tipoCorreo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Override
    public String toString() {
        return "CorreoColaborador{" + "id=" + id + ", colaborador=" + colaborador + ", tipoCorreo=" + tipoCorreo + ", correo=" + correo + '}';
    }
}
