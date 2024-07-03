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
import models.Ventas;

import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ArticuloRepo;
import repositories.interfaces.VentasRepo;


@WebServlet("/admin")
public class ArticulosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private ArticuloRepo articulosRepo;
    private VentasRepo ventrasrepo;
    

    public ArticulosController() throws IOException {
    	this.articulosRepo = EmpleadosRepoSingleton.getInstance(); 
    	this.ventrasrepo = EmpleadosRepoSingleton.getInstance(); 
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        accion = Optional.ofNullable(accion).orElse("index");
        System.out.println("ARTICULOS CONTROLLER " + accion);
        switch (accion) {
            case "index" -> getIndex(request, response);
            case "venta" -> getHistorial(request, response);
            case "show" -> getShow(request, response);
            case "edit" -> getEdit(request, response);
            case "create" -> getCreate(request, response);
            case "delete" -> postDelete(request, response);
            default -> response.sendError(404);
        }
    }
        
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
        
        request.getRequestDispatcher("/views/admin/panel-empleado/show.jsp").forward(request, response);
    }
    
    
    //MOSTRAR historial

    protected void getHistorial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Ventas> listaVentas = ventrasrepo.getListaVenta();
        request.setAttribute("ventas", listaVentas);
        request.getRequestDispatcher("/views/admin/historial-venta/ventas.jsp").forward(request, response);
    }
    
    private void getIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Articulo> listArticulos = articulosRepo.getAllArticulo();
        
        request.setAttribute("listaArticulos", listArticulos);
        
        request.getRequestDispatcher("/views/admin/panel-empleado/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            response.sendError(400, "No se brind� una acci�n.");
            return;
        }
        
        switch (accion) {
            case "insert" -> postInsert(request, response);
            case "update" -> postUpdate(request, response);
            case "delete" -> postDelete(request, response);
            default -> response.sendError(404, "No existe la acci�n " + accion);
        }
    }

    private void postInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        
        String sCantidad = request.getParameter("cantidad");
        int cantidad = Integer.parseInt(sCantidad);
        
        String sPrecio = request.getParameter("precio");
        double precio = Double.parseDouble(sPrecio);
        
        String sTotal = request.getParameter("precio");
        double total = Double.parseDouble(sTotal);
        
        Articulo articulo = new Articulo(nombre, cantidad, precio, total);
        
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
        
//        String sTotal = request.getParameter("total");
//        double total = Double.parseDouble(sTotal);
        
        Articulo articulo = articulosRepo.findByIdArticulo(id);
        
        articulo.setNombreArticulo(nombre);
        articulo.setCantidad(cantidad);
        articulo.setPrecio(precio);
        
        articulosRepo.updateArticulo(articulo);
        
        response.sendRedirect("admin");
    }
    
//    private void postEditar(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String sId = request.getParameter("id");
//        int id = Integer.parseInt(sId);
//        
//        String nombre = request.getParameter("nombre");
//        
//        String sCantidad = request.getParameter("cantidad");
//        int cantidad = Integer.parseInt(sCantidad);
//        
//        String sPrecio = request.getParameter("precio");
//        double precio = Double.parseDouble(sPrecio);
//        
//        Articulo articulo = articulosRepo.findByIdArticulo(id);
//        
//        articulo.setNombreArticulo(nombre);
//        articulo.setCantidad(cantidad);
//        articulo.setPrecio(precio);
//        
//        articulosRepo.updateArticulo(articulo);
//        
//        response.sendRedirect("admin");
//    }

    private void postDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sId = request.getParameter("id");
        int id = Integer.parseInt(sId);
        
        articulosRepo.deleteArticulo(id);
        
        response.sendRedirect("admin");
    }
}
