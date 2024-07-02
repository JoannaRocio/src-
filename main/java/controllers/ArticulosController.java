package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import decorators.SessionDecorator;
import exceptions.EmpleadoDeslogueadoException;
import models.Articulo;

import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ArticuloRepo;



@WebServlet("/admin")
public class ArticulosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private ArticuloRepo articulosRepo;
    
    

    public ArticulosController() throws IOException {
    	this.articulosRepo = EmpleadosRepoSingleton.getInstance(); 
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        accion = Optional.ofNullable(accion).orElse("index");
        System.out.println("ARTICULOS CONTROLLER " + accion);
        switch (accion) {
            case "index" -> getIndex(request, response);
            case "show" -> getShow(request, response);
            case "edit" -> getEdit(request, response);
            case "create" -> getCreate(request, response);
            case "delete" -> postDelete(request, response);
            default -> response.sendError(404);
        }
    }
   /* protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionDecorator sDec = new SessionDecorator(request.getSession());
		try {
			sDec.getEmpleadoLogueado();

			String accion = request.getParameter("accion");
			accion = Optional.ofNullable(accion).orElse("index");
			System.out.println("Articulos CONTROLLER " + accion);
			switch (accion) {
				case "index" -> getIndex(request, response);
				case "show" -> getShow(request, response);
				case "edit" -> getEdit(request, response);
				case "create" -> getCreate(request, response);
				case "delete" -> postDelete(request, response);
			default ->
				response.sendError(404);
			}
		} catch (EmpleadoDeslogueadoException e) {
			response.sendRedirect("auth");
			return;
		}
	}
*/
    private void getCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/admin/panel-empleado/create.jsp").forward(request, response);
    }

    private void getEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sId = request.getParameter("id");
        int id = Integer.parseInt(sId);
        
        Articulo articulo = articulosRepo.findByIdArticulo(id);
        
        request.setAttribute("articulo", articulo);
        
        request.getRequestDispatcher("/views/admin/panel-empleado/edit.jsp").forward(request, response);
    }

    private void getShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sId = request.getParameter("id");
        int id = Integer.parseInt(sId);
        
        Articulo articulo = articulosRepo.findByIdArticulo(id);
        
        request.setAttribute("articulo", articulo);
        
        request.getRequestDispatcher("/views/admin/panel-empleado/panel.jsp").forward(request, response);
    }

    private void getIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Articulo> listArticulos = articulosRepo.getAllArticulo();
        
        request.setAttribute("listaArticulos", listArticulos);
        
        request.getRequestDispatcher("/views/admin/panel-empleado/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            response.sendError(400, "No se brindó una acción.");
            return;
        }
        
        switch (accion) {
            case "insert" -> postInsert(request, response);
            case "update" -> postUpdate(request, response);
            case "delete" -> postDelete(request, response);
            default -> response.sendError(404, "No existe la acción " + accion);
        }
    }

    private void postInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        
        String sCantidad = request.getParameter("cantidad");
        int cantidad = Integer.parseInt(sCantidad);
        
        String sPrecio = request.getParameter("precio");
        double precio = Double.parseDouble(sPrecio);
        
        Articulo articulo = new Articulo(nombre, cantidad, precio);
        
       articulosRepo.insertArticulo(articulo);
        
        response.sendRedirect("admin");
    }

    private void postUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sId = request.getParameter("id");
        int id = Integer.parseInt(sId);
        
        String nombre = request.getParameter("nombre");
        
        String sCantidad = request.getParameter("cantidad");
        int cantidad = Integer.parseInt(sCantidad);
        
        String sPrecio = request.getParameter("precio");
        double precio = Double.parseDouble(sPrecio);
        
        Articulo articulo = articulosRepo.findByIdArticulo(id);
        
        articulo.setNombreArticulo(nombre);
        articulo.setCantidad(cantidad);
        articulo.setPrecio(precio);
        
        articulosRepo.updateArticulo(articulo);
        
        response.sendRedirect("admin");
    }

    private void postDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sId = request.getParameter("id");
        int id = Integer.parseInt(sId);
        
        articulosRepo.deleteArticulo(id);
        
        response.sendRedirect("admin");
    }
}
