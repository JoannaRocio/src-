package controllers;

import java.io.IOException;
import java.time.LocalDate;
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
import models.Empleado;
import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ArticuloRepo;
import repositories.interfaces.EmpleadoRepo;

/** 
 * Servlet implementation class EmpleadosController
 */
@WebServlet("/empleados")
public class EmpleadosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EmpleadoRepo empleadosRepo;
       
	private ArticuloRepo articulosRepo;
       

    public EmpleadosController() throws IOException {
    	this.empleadosRepo = EmpleadosRepoSingleton.getInstance(); 
    	this.articulosRepo = EmpleadosRepoSingleton.getInstance(); 
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionDecorator sDec = new SessionDecorator(request.getSession());
		try {
			sDec.getEmpleadoLogueado();

			String accion = request.getParameter("accion");
			accion = Optional.ofNullable(accion).orElse("index");
			System.out.println("EMPLEADOS CONTROLLER " + accion);
			switch (accion) {
				case "index" -> getIndex(request, response);
				case "show" -> getShow(request, response);
				case "edit" -> getEdit(request, response);
				case "create" -> getCreate(request, response);
				case "ver-panel" -> getVerPanel(request, response);
				case "ver-historial" -> getVerHistorial(request, response);
				case "cerrar-sesion" -> getCerrarSesion(request, response);
			default ->
				response.sendError(404);
			}
		} catch (EmpleadoDeslogueadoException e) {
			response.sendRedirect("auth");
			return;
		}
	}

	
	private void getVerPanel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Articulo> listArticulos = articulosRepo.getAllArticulo();
        
        request.setAttribute("listaArticulos", listArticulos);
        
        request.getRequestDispatcher("/views/admin/panel-empleado/index.jsp").forward(request, response);
	}
	
	private void getVerHistorial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/historial-venta/ventas.jsp").forward(request, response);
	}
	
	private void getCerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    SessionDecorator sDec = new SessionDecorator(request.getSession());

	    sDec.getSession().invalidate();
		request.getRequestDispatcher("/views/auth/login-admin.jsp").forward(request, response);
	}


	private void  getCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/empleados/create.jsp").forward(request, response);
	}


	private void  getEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Empleado emple = empleadosRepo.findById(id);
		
		request.setAttribute("empleado", emple);
		
		request.getRequestDispatcher("/views/empleados/edit.jsp").forward(request, response);
		
	}


	private void getShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Empleado emple = empleadosRepo.findById(id);
		
		request.setAttribute("empleado", emple);
		
		request.getRequestDispatcher("/views/admin/panel-empleado/show.jsp").forward(request, response);
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		
		if(accion == null) {
			response.sendError(400, "No se brindó una acción.");
			return;
		}
		
		switch (accion) {
		case "insert" -> postInsert(request, response);
		case "update" -> postUpdate(request, response);
		case "delete" -> postDelete(request, response);
		case "vacaciones" -> postVacaciones(request, response);
		default ->
			response.sendError(404, "No existe la acción " + accion);
		}
	}


	private void postVacaciones(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String sDia = request.getParameter("dia");
		int dia = Integer.parseInt(sDia);
		
		String sMes = request.getParameter("mes");
		int mes = Integer.parseInt(sMes);
		
		String sAnio = request.getParameter("anio");
		int anio = Integer.parseInt(sAnio);
		
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Empleado emple = empleadosRepo.findById(id);
		
		LocalDate fecha = LocalDate.of(anio, mes, dia);
		
		emple.setFechaVueltaVacaciones(fecha);
		
		empleadosRepo.update(emple);
		
		response.sendRedirect("empleados?accion=show&id="+id);
		
	}


	private void postDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		empleadosRepo.delete(id);
		
		response.sendRedirect("empleados");
	}


	private void postUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		String nombre = request.getParameter("nombre");
		
		String sSueldo = request.getParameter("sueldo");
		double sueldo = Double.parseDouble(sSueldo);
	
		String sEdad = request.getParameter("edad");
		int edad = Integer.parseInt(sEdad);
		
		Empleado emple = empleadosRepo.findById(id);
		
		emple.setNombre(nombre);
		emple.setEdad(edad);
		emple.setSueldo(sueldo);
		
		empleadosRepo.update(emple);
		
		response.sendRedirect("empleados");
	} 
 

	private void postInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String nombre = request.getParameter("nombre");
		
		String sSueldo = request.getParameter("sueldo");
		double sueldo = Double.parseDouble(sSueldo);
	
		String sEdad = request.getParameter("edad");
		int edad = Integer.parseInt(sEdad);
		
		Empleado emple = new Empleado(nombre, "", edad, sueldo);
		
		empleadosRepo.insert(emple);
		
		response.sendRedirect("empleados");
//		response.sendError(400, "No implementado");
	} 

}
