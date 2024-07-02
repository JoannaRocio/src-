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
import exceptions.ClienteDeslogueadoException;
import exceptions.EmpleadoDeslogueadoException;
import models.Cliente;
import models.Empleado;
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		accion = Optional.ofNullable(accion).orElse("auth");
		
		switch (accion) {
			case "ingresar-dinero" -> getIngresarDinero(request, response);
			case "transferir-dinero" -> getTransferirDinero(request, response);
			case "cerrar-sesion" -> getCerrarSesion(request, response);
			case "ver-tienda" -> getVerTienda(request, response);
			case "ver-saldo" -> getVerSaldo(request, response);
		default ->
			response.sendError(404);
		}
	}
	
	private void getIngresarDinero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		
		Cliente cliente = clientesRepo.findByIdCliente(id);

	    String sDinero = request.getParameter("dineroAIngresar");
		double dinero = Integer.parseInt(sDinero);
		
		if (cliente != null) {
	        if (dinero <= 100000) { 
	        	
	            double saldoActual = cliente.getSaldo();
	            double nuevoSaldo = saldoActual + dinero;
	            cliente.setSaldo(nuevoSaldo);
	            
	            request.setAttribute("mensaje", "Dinero agregado con exito.");
	        } else {
	            request.setAttribute("mensaje", "El monto ingresado no es valido, solo acepta enteros y el maximo para ingresar dinero es 100.000.");
	        }
	    } else {
	        request.setAttribute("mensaje", "Cliente no encontrado.");
	    }
		
		request.setAttribute("cliente", cliente);
		
		List<Cliente> clientes = clientesRepo.getAllCliente();
		
		request.setAttribute("clientes", clientes);
	    
	    request.getRequestDispatcher("/views/clientes/panel-saldo/saldo.jsp").forward(request, response);
	}
	
	private void getTransferirDinero(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("entra 2");
		String sIdRemitente = request.getParameter("id");
		int idRemitente = Integer.parseInt(sIdRemitente);
		
		System.out.println(sIdRemitente);
		
		Cliente remitente = clientesRepo.findByIdCliente(idRemitente);
		
		String sIdDestinatario = request.getParameter("destinatarioId");
		int idDestinatario = Integer.parseInt(sIdDestinatario);
		
		Cliente destinatario = clientesRepo.findByIdCliente(idDestinatario);
		
		String sCantidad = request.getParameter("cantidad");
		double cantidad = Integer.parseInt(sCantidad);
		
		System.out.println(idRemitente + " " + idDestinatario + " " + cantidad);


        if (remitente != null && destinatario != null) {
            double saldoRemitente = remitente.getSaldo();

            if (saldoRemitente >= cantidad) {
                // Actualizar saldos
                remitente.setSaldo(saldoRemitente - cantidad);
                destinatario.setSaldo(destinatario.getSaldo() + cantidad);

//                // Guardar cambios
//                clientesRepo.save(remitente);
//                clientesRepo.save(destinatario);

                request.setAttribute("mensaje", "Transferencia realizada con exito.");
            } else {
            	request.setAttribute("mensaje", "Saldo insuficiente para realizar la transferencia.");
            }
        } else {
        	request.setAttribute("mensaje", "Error al realizar la transferencia. Cliente no encontrado.");
        }
        
        List<Cliente> clientes = clientesRepo.getAllCliente();
		
		request.setAttribute("clientes", clientes);
		
	    Cliente cliente = clientesRepo.findByIdCliente(idRemitente);
	    
		request.setAttribute("cliente", cliente);
	    
	    request.getRequestDispatcher("/views/clientes/panel-saldo/saldo.jsp").forward(request, response);
	}
	
	private void getCerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("views/empleados/bienvenida.jsp");
	    SessionDecorator sDec = new SessionDecorator(request.getSession());

	    // Invalidar la sesi�n
	    sDec.getSession().invalidate();
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}
	
	private void getVerSaldo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		List<Cliente> clientes = clientesRepo.getAllCliente();
		
		request.setAttribute("clientes", clientes);
		
        request.getRequestDispatcher("/views/clientes/panel-saldo/saldo.jsp").forward(request, response);
    }
	
	private void getVerTienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/clientes/tienda/tienda.jsp").forward(request, response);
    }
}
