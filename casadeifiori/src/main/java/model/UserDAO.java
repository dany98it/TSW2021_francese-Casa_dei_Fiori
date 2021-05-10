package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO implements DaoInterfacce<User, Integer> {
	private static DataSource ds;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/database");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "user";
	
	@Override
	public void doSave(User t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + UserDAO.TABLE_NAME
				+ " (`email`, `nome`, `cognome`, `data_di_nascita`, `telefono`, `permessi`, `password`) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, t.getEmail());
			preparedStatement.setString(2, t.getNome());
			preparedStatement.setString(3, t.getCognome());
			preparedStatement.setDate(4, t.getdataNascita());
			preparedStatement.setString(5, t.getTelefono());
			preparedStatement.setString(6, t.getPermessi().toString());
			preparedStatement.setString(7, t.getPassword());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
	}

	@Override
	public boolean doDelete(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + UserDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.execute();
			
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return result;
	}

	@Override
	public int doUpdate(User t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + UserDAO.TABLE_NAME + " SET  "
				+ "email = ? ,"
				+ "nome =  ? ,"
				+ "cognome = ? ,"
				+ "data_di_nascita = ? ," 
				+ "telefono = ? ,"
				+ "permessi = ? ,"
				+ "password = ? ," 
				+ " "+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, t.getEmail());
			preparedStatement.setString(2, t.getNome());
			preparedStatement.setString(3, t.getNome());
			preparedStatement.setString(4, t.getCognome());
			preparedStatement.setDate(5, t.getdataNascita());
			preparedStatement.setString(6, t.getTelefono());
			preparedStatement.setString(7, t.getPermessi().toString());
			preparedStatement.setString(8, t.getPassword());
			preparedStatement.setInt(8, t.getId());
			

			result = preparedStatement.executeUpdate();
			
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return result;
	}

	@Override
	public User doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		User bean = new User();

		String selectSQL = "SELECT * FROM " + UserDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setEmail(rs.getString("email"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setdataNascita(rs.getDate("data_di_nascita"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setPermessi(Permessi.valueOf(rs.getString("permessi")));
				bean.setPassword(rs.getString("password"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public Collection<User> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<User> users = new LinkedList<User>();

		String selectSQL = "SELECT * FROM " + UserDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				User bean = new User();
				bean.setId(rs.getInt("id"));
				bean.setEmail(rs.getString("email"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setdataNascita(rs.getDate("data_di_nascita"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setPermessi(Permessi.valueOf(rs.getString("permessi")));
				bean.setPassword(rs.getString("password"));
				users.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return users;
	}

}
