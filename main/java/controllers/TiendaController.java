package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import decorators.SessionDecorator;
import models.Articulo;
import models.Cliente;
import models.Ventas;
import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ArticuloRepo;
import repositories.interfaces.ClienteRepo;
import repositories.interfaces.VentasRepo;

@WebServlet("/tienda")  
public class TiendaController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private ArticuloRepo articulosRepo;
	
	private ArrayList<Articulo> listadoCarrito = new ArrayList<Articulo>();
 
	
	private Double totalPagado = 0.0;
	
	private ClienteRepo clientesRepo;
	
    private VentasRepo ventasRepo;

    public TiendaController() throws IOException {
    	this.articulosRepo = EmpleadosRepoSingleton.getInstance(); 
    	this.clientesRepo = EmpleadosRepoSingleton.getInstance();
    	this.ventasRepo = EmpleadosRepoSingleton.getInstance(); 
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SessionDecorator sDec = new SessionDecorator(request.getSession());
		
		String accion = request.getParameter("accion");
		accion = Optional.ofNullable(accion).orElse("tienda");
		System.out.println(accion + " accionnnnnnnnnnnnnn");
		switch (accion) {
			case "tienda" -> getTienda(request, response);
			case "ver-carrito" -> getCarrito(request, response);
			case "ver-compras" -> getCompras(request, response);
			case "ver-tienda" -> getTienda(request, response);
			case "factura" -> getFactura(request, response);
		default ->
			response.sendError(404, "No existe la accion " + accion);
		}
		
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            response.sendError(400, "No se brindo una accion.");
            return;
        }
        
        switch (accion) {
            case "agregar-articulo" -> agregarItem(request, response);
            case "comprar" -> getFactura(request, response);
            case "volver-tienda" -> getVolverTienda(request, response);
            default -> response.sendError(404, "No existe la accion " + accion);
        }
    }
    
	private void agregarItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Articulo articulo = articulosRepo.findByIdArticulo(id);

		listadoCarrito.add(articulo);
	
		response.sendRedirect("tienda");
		
	}
	
//	private void comprarTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String sId = request.getParameter("id");
//		int id = Integer.parseInt(sId);
//		
//		request.getRequestDispatcher("/views/clientes/tienda/index.jsp").forward(request, response);
//	}
	
	private void getTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Articulo> listArticulos = articulosRepo.getAllArticulo();
		
		request.setAttribute("listita", listArticulos);

		request.getRequestDispatcher("/views/clientes/tienda/index.jsp").forward(request, response);
	}

	
	private void getCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		double totalP = 0.0;
		for (Articulo arti : listadoCarrito) {
            totalP += arti.getPrecio();
            arti.setTotal(totalP);
            totalPagado = totalP;
            
        }
		
		
		request.setAttribute("total", totalP);
		
		request.setAttribute("listita", listadoCarrito);
		
		request.getRequestDispatcher("/views/clientes/carrito-compras/carrito.jsp").forward(request, response);
	}
	
	
	private void getFactura(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);

		Cliente cliente = clientesRepo.findByIdCliente(id);
		
		double saldoActual = cliente.getSaldo();
		System.out.println(saldoActual);
		
		if (cliente != null) {
	        if (saldoActual >= totalPagado) { 
	
	            double nuevoSaldo = saldoActual - totalPagado;
	            cliente.setSaldo(nuevoSaldo);
	            
	    		for (Articulo arti : listadoCarrito) {
	                arti.setCantidad(arti.getCantidad() - 1);      
	            }

	        } else {
	    		request.setAttribute("total", totalPagado);
	    		request.setAttribute("listita", listadoCarrito);
	            request.setAttribute("mensaje", "No posee saldo suficiente para realizar la compra");
	            request.getRequestDispatcher("/views/clientes/carrito-compras/carrito.jsp").forward(request, response);
	        }
	    }

		
		request.setAttribute("total", totalPagado);
		
		request.setAttribute("listita", listadoCarrito);
		
		request.getRequestDispatcher("/views/clientes/historial-compras/factura.jsp").forward(request, response);
		
	}

	private void getCompras(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		System.out.println("entra a get compras");
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		System.out.println("id cliente " + id);
		
		List<Ventas> listadoCompra = ventasRepo.findByIdVentaCliente(id);
        
		request.setAttribute("listadoCompra", listadoCompra);
		
		request.getRequestDispatcher("/views/clientes/historial-compras/compras.jsp").forward(request, response);
	}
		
	private void getVolverTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listadoCarrito.clear();
		response.sendRedirect("tienda");
	}

}
