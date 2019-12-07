package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import conexion.DBConnection;
import modelo.Contacto;

public class DAOContacto {
	
	private Connection con = null;
	public static DAOContacto instance = null;
	
	public DAOContacto() throws SQLException, ClassNotFoundException {
		con = DBConnection.getConnection();
	}

	public static DAOContacto getInstance() throws SQLException, ClassNotFoundException {
		if (instance == null)
			instance = new DAOContacto();
		return instance;
	}
	
	public void insertarContacto(Contacto c) throws SQLException {
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO tablaContacto (nombre, apellidos, email, tel)" 
				+ "VALUES" + "(?,?,?,?)");
		
		ps.setString(1, c.getNombre());
		ps.setString(2, c.getApellidos());
		ps.setString(3, c.getEmail());
		ps.setInt(4, c.getTel());
		
		ps.executeUpdate();
		ps.close();
	}
	
	public ArrayList<Contacto> listaContactos() throws SQLException {
		ArrayList<Contacto> resultadoLista = new ArrayList<Contacto>();
		
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM tablaContacto");
		ResultSet rs = ps.executeQuery();
			
		while (rs.next()) {
			Contacto c = new Contacto (rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
			resultadoLista.add(c);
		}
		
		rs.close();
		ps.close();
		return resultadoLista;
	}
	
	public Contacto buscarID(int id) throws SQLException {
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM tablaContacto WHERE id = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		Contacto result = null;
		
		if (rs.next()) {
			result = new Contacto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
		}
		
		rs.close();
		ps.close();
		return result;
	}

	public void update(Contacto c) throws SQLException {
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE tablaContacto SET nombre = ?, apellidos = ?,"
				+ " email = ?, tel = ? WHERE id = ?");
		
		ps.setString(1, c.getNombre());
		ps.setString(2, c.getApellidos());
		ps.setString(3, c.getEmail());
		ps.setInt(4, c.getTel());
		ps.setInt(5, c.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	public void delete(int id) throws SQLException {
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM tablaContacto WHERE id = ?");
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
	}
}
