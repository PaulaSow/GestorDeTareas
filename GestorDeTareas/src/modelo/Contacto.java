package modelo;

import dao.DAOContacto;

public class Contacto {
	
	private int id;
	private String nombre;
	private String apellidos;
	private String email;
	private int tel;
	
	public Contacto() {
		nombre = "";
		apellidos = "";
		email = "";
	}

	public Contacto(int id, String nombre, String apellidos, String email, int tel) {
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.tel = tel;
	}
	
	public Contacto(String nombre, String apellidos, String email, int tel) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.tel = tel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public void insertar() {
		try {
			DAOContacto.getInstance().insertarContacto(this);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void buscarID(int id) {
		Contacto c = null;
		
		try {
			c = DAOContacto.getInstance().buscarID(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		if (c != null) {
			this.id = c.getId();
			this.nombre = c.getNombre();
			this.apellidos = c.getApellidos();
			this.email = c.getEmail();
			this.tel = c.getTel();
		}
	}
	
	public String imprimirTabla() {
		
		String txt = "";
		
		txt += "<tr><td>"+ getId() +"</td>";
		txt += "<td>"+ getNombre() +"</td>";
		txt += "<td>"+ getApellidos() +"</td>";
		txt += "<td>"+ getEmail() +"</td>";
		txt += "<td>"+ getTel() +"</td>";
		txt += "<td><a href=\"AltaContacto?option=edit&id="+this.id+"\">Editar</a></td>";
		txt += "<td><a href=\"AltaContacto?option=delete&id="+this.id+"\">Borrar</a></td>";
		
		return txt;
	}
	
	public void update() {
		try {
			DAOContacto.getInstance().update(this);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void borrar() {
		try {
			DAOContacto.getInstance().delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String toString() {
		return "Contacto [nombre=" + nombre + ", apellidos=" + apellidos + ", email=" + email + ", tel=" + tel + "]";
	}

}