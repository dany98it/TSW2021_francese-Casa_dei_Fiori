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

public class IndirizzoDAO implements DaoInterfacce<Indirizzo, Integer>{
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
	
	private static final String TABLE_NAME = "indirizzo";
	@Override
	public void doSave(Indirizzo i) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + IndirizzoDAO.TABLE_NAME
				+ " (`id`,`provincia`,`citta`,`cap`,`via`,`interno`,`numero_civico`,`user`,`nome`,`cognome`) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, i.getId());
			preparedStatement.setString(2, i.getProvincia());
			preparedStatement.setString(3, i.getCittà());
			preparedStatement.setString(4, i.getCap());
			preparedStatement.setString(5, i.getVia());
			preparedStatement.setString(6, i.getInterno());
			preparedStatement.setString(7, i.getNumeroCivico());
			preparedStatement.setInt(8, i.getUser());
			preparedStatement.setString(9, i.getNome());
			preparedStatement.setString(10, i.getCognome());

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

		String deleteSQL = "DELETE FROM " + IndirizzoDAO.TABLE_NAME + " WHERE id = ?";

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
	public int doUpdate(Indirizzo i) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + IndirizzoDAO.TABLE_NAME + " SET  "
				+ "provincia =  ? ,"
				+ "citta = ? ,"
				+ "cap = ? ,"
				+ "via = ? ,"
				+ "interno = ? ,"
				+ "numero_civico = ? ,"
				+ "nome = ? ,"
				+ "cognome = ? ,"
				+ "WHERE "+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, i.getProvincia());
			preparedStatement.setString(2, i.getCittà());
			preparedStatement.setString(3, i.getCap());
			preparedStatement.setString(4, i.getVia());
			preparedStatement.setString(5, i.getInterno());
			preparedStatement.setString(6, i.getNumeroCivico());
			preparedStatement.setString(7, i.getNome());
			preparedStatement.setString(8, i.getCognome());
			preparedStatement.setInt(9, i.getId());

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
	public Indirizzo doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Indirizzo bean = new Indirizzo();

		String selectSQL = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setCittà(rs.getString("citta"));
				bean.setCap(rs.getString("cap"));
				bean.setVia(rs.getString("via"));
				bean.setInterno(rs.getString("interno"));
				bean.setNumeroCivico(rs.getString("numero_civico"));
				bean.setUser(rs.getInt("user"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
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
	public Collection<Indirizzo> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Indirizzo> Indirizzo = new LinkedList<Indirizzo>();

		String selectSQL = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME;

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
				Indirizzo bean = new Indirizzo();
				bean.setId(rs.getInt("id"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setCittà(rs.getString("citta"));
				bean.setCap(rs.getString("cap"));
				bean.setVia(rs.getString("via"));
				bean.setInterno(rs.getString("interno"));
				bean.setNumeroCivico(rs.getString("numero_civico"));
				bean.setUser(rs.getInt("user"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				Indirizzo.add(bean);
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
		return Indirizzo;
	}
	
	public Collection<Indirizzo> doRetrieveAllByUser(Integer user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Indirizzo> Indirizzo = new LinkedList<Indirizzo>();

		String selectSQL = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME + "WHERE user="+user;

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Indirizzo bean = new Indirizzo();
				bean.setId(rs.getInt("id"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setCittà(rs.getString("citta"));
				bean.setCap(rs.getString("cap"));
				bean.setVia(rs.getString("via"));
				bean.setInterno(rs.getString("interno"));
				bean.setNumeroCivico(rs.getString("numero_civico"));
				bean.setUser(rs.getInt("user"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				Indirizzo.add(bean);
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
		return Indirizzo;
	}
	
}
