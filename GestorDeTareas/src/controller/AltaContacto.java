package controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import modelo.Contacto;
import modelo.Tarea;

/**
 * Servlet implementation class AltaContacto
 */
@WebServlet("/AltaContacto")
public class AltaContacto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaContacto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		if(request.getParameter("option") != null) {
			if(request.getParameter("option").equals("edit")) {
				RequestDispatcher rd = request.getRequestDispatcher("altaContacto.jsp");
				rd.forward(request, response);
				return;
			}
			
			if(request.getParameter("option").equals("delete")) {
				Contacto c = new Contacto();
				c.buscarID(Integer.parseInt(request.getParameter("id")));
				c.borrar();
				RequestDispatcher rd = request.getRequestDispatcher("listaContactos.jsp");
				rd.forward(request, response);
				return;
			}
		}
		
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String email = request.getParameter("email");
		int tel = Integer.parseInt(request.getParameter("tel"));
		
		Contacto c = new Contacto();
		c.setNombre(nombre);
		c.setApellidos(apellidos);
		c.setEmail(email);
		c.setTel(tel);
		
		if(request.getParameter("id").equals("0")) {
			c.insertar();
			RequestDispatcher rd = request.getRequestDispatcher("listaContactos.jsp");
			rd.forward(request, response);
			return;
		} else {				
			c.setId(Integer.parseInt(request.getParameter("id")));
			c.update();
			RequestDispatcher rd = request.getRequestDispatcher("listaContactos.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
