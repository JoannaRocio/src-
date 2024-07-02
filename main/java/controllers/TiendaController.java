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
import models.Empleado;
import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ArticuloRepo;
import repositories.interfaces.EmpleadoRepo;

@WebServlet("/tienda")  
public class TiendaController extends HttpServlet {
	
	private ArticuloRepo articulosRepo;
	
	private ArrayList<Articulo> listadoCarrito = new ArrayList<Articulo>();
    

    public TiendaController() throws IOException {
		this.articulosRepo = EmpleadosRepoSingleton.getInstance(); 
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SessionDecorator sDec = new SessionDecorator(request.getSession());
		
		String accion = request.getParameter("accion");
		accion = Optional.ofNullable(accion).orElse("tienda");
		
		switch (accion) {
			case "tienda" -> getTienda(request, response);
			case "ver-carrito" -> getCarrito(request, response);
			case "ver-compras" -> getCompras(request, response);
//			case "show" -> getShow(request, response);
//			case "edit" -> getEdit(request, response);
//			case "create" -> getCreate(request, response);
		default ->
			response.sendError(404);
		}
		
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            response.sendError(400, "No se brind� una acci�n.");
            return;
        }
        
        switch (accion) {
            case "agregar-articulo" -> agregarItem(request, response);
            default -> response.sendError(404, "No existe la acci�n " + accion);
        }
    }
    
	private void agregarItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Articulo articulo = articulosRepo.findByIdArticulo(id);

		listadoCarrito.add(articulo);
		//System.out.println(listadoCarrito + " que hay en el listado");
		
		response.sendRedirect("tienda");
		
	}
	
	private void getTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Articulo> listArticulos = articulosRepo.getAllArticulo();
		
		request.setAttribute("listita", listArticulos);
		
		request.getRequestDispatcher("/views/clientes/tienda/index.jsp").forward(request, response);
	}

	
	private void getCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("listita", listadoCarrito);
		
		request.getRequestDispatcher("/views/clientes/carrito-compras/carrito.jsp").forward(request, response);
	}

	private void getCompras(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setAttribute("listita", listadoCarrito);
		
		request.getRequestDispatcher("/views/clientes/historial-compras/compras.jsp").forward(request, response);
	}

}
