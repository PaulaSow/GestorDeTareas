package modelo;

import java.util.ArrayList;

import dao.DAOContacto;

public class ListaContactos {
	
	private ArrayList<Contacto> lista;
		
		public ListaContactos() {}
		
		public ArrayList<Contacto> obtenerContactos() {
			try {
				lista = DAOContacto.getInstance().listaContactos();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return lista;
		}
		
		public String imprimirListas() {
			String impresionListas = "";
			impresionListas = "<tr><th>Id</th><th>Nombre</th><th>Apellidos</th><th>Email</th><th>Teléfono</th>"
					+ "<th></th><th></th></tr>";
			for(Contacto c : lista) {
				impresionListas += c.imprimirTabla();
			}
			return impresionListas;
		}
}
