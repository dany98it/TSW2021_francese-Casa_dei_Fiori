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

public class ConsegnaDAO implements DaoInterfacce<Consegna, Integer> {
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
	
	private static final String TABLE_NAME = "consegna";
	@Override
	public void doSave(Consegna t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + ConsegnaDAO.TABLE_NAME
				+ " (`tipo`, `corriere`, `data_consegna`, `data_inizio_spedizione`, `data_presunta_consegna`, `stato`, `indirizzo`, `ordine`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, t.getTipo().toString());
			preparedStatement.setString(2, t.getCorriere());
			preparedStatement.setDate(3, t.getDataConsegna());
			preparedStatement.setDate(4, t.getDataInizioSpedizione());
			preparedStatement.setDate(5, t.getDataPresuntaConsegna());
			preparedStatement.setString(6, t.getStato().toString());
			preparedStatement.setInt(7, t.getIndirizzo());
			preparedStatement.setInt(8, t.getOrdine());
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

		String deleteSQL = "DELETE FROM " + ConsegnaDAO.TABLE_NAME + " WHERE id = ?";

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
	public int doUpdate(Consegna t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + ConsegnaDAO.TABLE_NAME + " SET  "
				+ "tipo = ? ,"
				+ "corriere =  ? ,"
				+ "data_consegna = ? ,"
				+ "data_inizio_spedizione = ? ," 
				+ "data_presunta_consegna = ? ,"
				+ "stato = ? ,"
				+ "indirizzo = ? ," 
				+ "ordine = ? ," 
				+ " "+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, t.getTipo().toString());
			preparedStatement.setString(2, t.getCorriere());
			preparedStatement.setDate(3, t.getDataConsegna());
			preparedStatement.setDate(4, t.getDataInizioSpedizione());
			preparedStatement.setDate(5, t.getDataPresuntaConsegna());
			preparedStatement.setString(6, t.getStato().toString());
			preparedStatement.setInt(7, t.getIndirizzo());
			preparedStatement.setInt(8, t.getOrdine());
			preparedStatement.setInt(9, t.getId());
			

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
	public Consegna doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Consegna bean = new Consegna();

		String selectSQL = "SELECT * FROM " + ConsegnaDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setTipo(TipoConsegna.valueOf(rs.getString("tipo")));
				bean.setCorriere(rs.getString("corriere"));
				bean.setDataConsegna(rs.getDate("data_consegna"));
				bean.setDataInizioSpedizione(rs.getDate("data_inizio_spedizione"));
				bean.setDataPresuntaConsegna(rs.getDate("data_presunta_consegna"));
				bean.setStato(StatoConsegna.valueOf(rs.getString("stato")));
				bean.setIndirizzo(rs.getInt("indirizzo"));
				bean.setOrdine(rs.getInt("ordine"));
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
	public Collection<Consegna> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Consegna> consegna = new LinkedList<Consegna>();

		String selectSQL = "SELECT * FROM " + ConsegnaDAO.TABLE_NAME;

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
				Consegna bean = new Consegna();
				bean.setId(rs.getInt("id"));
				bean.setTipo(TipoConsegna.valueOf(rs.getString("tipo")));
				bean.setCorriere(rs.getString("corriere"));
				bean.setDataConsegna(rs.getDate("data_consegna"));
				bean.setDataInizioSpedizione(rs.getDate("data_inizio_spedizione"));
				bean.setDataPresuntaConsegna(rs.getDate("data_presunta_consegna"));
				bean.setStato(StatoConsegna.valueOf(rs.getString("stato")));
				bean.setIndirizzo(rs.getInt("indirizzo"));
				bean.setOrdine(rs.getInt("ordine"));
				consegna.add(bean);
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
		return consegna;
	}

}