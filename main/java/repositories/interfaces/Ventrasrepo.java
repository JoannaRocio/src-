package repositories.interfaces;

import models.ventas;
import java.io.IOException;
import java.util.List;

public interface Ventrasrepo {
    List<ventas> getListaVenta()throws IOException;
    void insertVenta(ventas venta);
    void updateVenta(ventas venta) throws IOException;
    List<ventas> getAllVentas() throws IOException;
    ventas findByIdVenta(int id) throws IOException;
    void deleteVenta(int id) throws IOException;
}
