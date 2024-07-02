package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import decorators.SessionDecorator;
import models.Cliente;
import models.Empleado;
import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ClienteRepo;
import repositories.interfaces.EmpleadoRepo;

@WebServlet("/auth")  
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	private EmpleadoRepo empleadosRepo;
	
	private ClienteRepo clientesRepo;
       
    public AuthController() throws IOException {
    	this.empleadosRepo = EmpleadosRepoSingleton.getInstance(); 
    	this.clientesRepo = EmpleadosRepoSingleton.getInstance();
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Empleado> empleados = empleadosRepo.getAll();
		
		request.setAttribute("empleados", empleados);
		
		String accion = request.getParameter("accion");
		
		if (accion == null) {
			request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
			return;
		}
		
		
		//System.out.println(accion);
		//accion = Optional.ofNullable(accion).orElse("/auth");
		
		switch (accion) {
			case "login" -> getLogin(request, response);
			case "login-admin" -> getLoginAdmin(request, response);
		default ->
			response.sendError(404);
		}
		
//		List<Empleado> empleados = empleadosRepo.getAll();
//				
//		request.setAttribute("empleados", empleados);
//		
//		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		accion = Optional.ofNullable(accion).orElse("auth");
		
		switch (accion) {
			case "login" -> getLogin(request, response);
			case "login-admin" -> getLoginAdmin(request, response);
			case "panel-admin" -> getPanelAdmin(request ,response);
			case "panel-cliente" -> getPanelCliente(request, response);
		default ->
			response.sendError(404);
		}
		
//		String username = request.getParameter("username");
//		String pass = request.getParameter("pass");
//
//		Empleado _username = empleadosRepo.findByUsername(username, pass);
//
//		if(_username != null) {
//
//			HttpSession session = request.getSession();
//			
//			SessionDecorator sessionDe = new SessionDecorator(session);
//			
//			sessionDe.setEmpleadoLogueado(_username);
//			
//			response.sendRedirect("empleados");
//		}
//		
//		else {
//			response.sendRedirect("auth");
//		}
		
		
		
		
//		String sId = request.getParameter("empleado_id");
//		int id = Integer.parseInt(sId);
//		
//		Empleado emple = empleadosRepo.findById(id);
//		
//		HttpSession session = request.getSession();
//		
//		SessionDecorator sessionDe = new SessionDecorator(session);
//		
//		sessionDe.setEmpleadoLogueado(emple);
//		
//		response.sendRedirect("empleados");
	}
	
	private void getLoginAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("views/empleados/bienvenida.jsp");
		request.getRequestDispatcher("/views/auth/login-admin.jsp").forward(request, response);
	}
	
	private void getPanelAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");

		Empleado _username = empleadosRepo.findByUsername(username, pass);

		if(_username != null) {
			HttpSession session = request.getSession();
			
			SessionDecorator sessionDe = new SessionDecorator(session);
			
			sessionDe.setEmpleadoLogueado(_username);
			
			response.sendRedirect("admin");
		}
		
		else {
			getLoginAdmin(request, response);
		}
	}
	
	private void getPanelCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");

		Cliente _username = clientesRepo.findByUsernameCliente(username, pass);

		if(_username != null) {
			System.out.println("Username " + _username);
			HttpSession session = request.getSession();
			
			SessionDecorator sessionDe = new SessionDecorator(session);
			
			sessionDe.setClienteLogueado(_username);
			
			response.sendRedirect("tienda");
		}
		
		else {
			getLogin(request, response);
		}
	}
	
	private void getLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
		
	}

}
