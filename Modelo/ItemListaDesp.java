
package Modelo;


public class ItemListaDesp {
    private String nit;
    private String nombreEmpresa;

    public ItemListaDesp(String nit, String nombreEmpresa) {
        this.nit = nit;
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    @Override
    public String toString() {
        return getNombreEmpresa();
    }
    
    
    
}
