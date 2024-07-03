package repositories.interfaces;

import models.Ventas;
import java.io.IOException;
import java.util.List;

public interface VentasRepo {
	
	public List<Ventas> getListaVenta()throws IOException;
    
    public void insertVenta(Ventas venta);
    
    public void updateVenta(Ventas venta) throws IOException;
    
    public List<Ventas> getAllVentas() throws IOException;
    
    public Ventas findByIdVenta(int id) throws IOException;
    
    public List<Ventas> findByIdVentaCliente(int id) throws IOException;
    
    public void deleteVenta(int id) throws IOException;
}
