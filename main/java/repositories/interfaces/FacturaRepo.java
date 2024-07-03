package repositories.interfaces;

import java.io.IOException;
import java.util.List;

import models.Factura;

public interface FacturaRepo {
    
    public void insertFactura(Factura factura);
    
    public List<Factura> getAllFactura() throws IOException;
    
    public Factura findByIdFactura(int id) throws IOException;
    
    public List<Factura> findByIdClienteFactura(int id) throws IOException;
    
    
    
}
