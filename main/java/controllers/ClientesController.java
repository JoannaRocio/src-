package controllers;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import decorators.SessionDecorator;
import exceptions.ClienteDeslogueadoException;
import exceptions.EmpleadoDeslogueadoException;
import repositories.EmpleadosRepoSingleton;
import repositories.interfaces.ClienteRepo;

@WebServlet("/clientes")
public class ClientesController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private ClienteRepo clientesRepo;
       

    public ClientesController() throws IOException {
    	this.clientesRepo = EmpleadosRepoSingleton.getInstance(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionDecorator sDec = new SessionDecorator(request.getSession());
		try {
			sDec.getClienteLogeado();

			String accion = request.getParameter("accion");
			accion = Optional.ofNullable(accion).orElse("index");
			switch (accion) {
				case "cerrar-sesion" -> getCerrarSesion(request, response);
				case "ver-tienda" -> getVerTienda(request, response);
				case "ver-saldo" -> getVerSaldo(request, response);
			default ->
				response.sendError(404);
			}
		} catch (ClienteDeslogueadoException e) {
			response.sendRedirect("auth");
			return;
		}
	}
	
	private void getCerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("views/empleados/bienvenida.jsp");
	    SessionDecorator sDec = new SessionDecorator(request.getSession());

	    // Invalidar la sesi�n
	    sDec.getSession().invalidate();
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}
	
	private void getVerSaldo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/clientes/panel-saldo/saldo.jsp").forward(request, response);
    }
	
	private void getVerTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/clientes/tienda/tienda.jsp").forward(request, response);
    }
}
