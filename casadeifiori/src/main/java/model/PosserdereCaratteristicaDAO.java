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

import com.google.gson.JsonElement;

public class PosserdereCaratteristicaDAO implements DaoInterfacce<PossedereCaratteristica, PossedereCaratteristica>{
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
	
	private static final String TABLE_NAME = "possedere_caratt";
	@Override
	public synchronized void doSave(PossedereCaratteristica t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + PosserdereCaratteristicaDAO.TABLE_NAME
				+ " (item, cratterisitca, valore) VALUES (?, ?,?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getItem());
			preparedStatement.setInt(2, t.getCaratteristica());
			preparedStatement.setString(3, t.getValore());

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
	public boolean doDelete(PossedereCaratteristica code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + PosserdereCaratteristicaDAO.TABLE_NAME + " WHERE item = ? AND cratterisitca = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getCaratteristica());

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
	public int doUpdate(PossedereCaratteristica t) throws SQLException {
		return 0;
		/*Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + MostraDAO.TABLE_NAME + " SET  "
				+ "item =  ? ,"
				+ "immagine = ? ,"
				+ "WHERE"+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			

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
		return result;*/
	}

	@Override
	public PossedereCaratteristica doRetrieveByKey(PossedereCaratteristica code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		PossedereCaratteristica bean = new PossedereCaratteristica();

		String selectSQL = "SELECT * FROM " + PosserdereCaratteristicaDAO.TABLE_NAME + " WHERE item = ? AND cratterisitca= ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getCaratteristica());

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setItem(rs.getInt("item"));
				bean.setCaratteristica(rs.getInt("cratterisitca"));
				bean.setValore(rs.getString("valore"));
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
	public Collection<PossedereCaratteristica> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public Collection<PossedereCaratteristica> doRetrieveAllByItem(Integer item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<PossedereCaratteristica> mostra = new LinkedList<PossedereCaratteristica>();

		String selectSQL = "SELECT * FROM " + PosserdereCaratteristicaDAO.TABLE_NAME +" WHERE item = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, item);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				PossedereCaratteristica bean = new PossedereCaratteristica();
				bean.setItem(rs.getInt("item"));
				bean.setCaratteristica(rs.getInt("cratterisitca"));
				bean.setValore(rs.getString("valore"));
				mostra.add(bean);
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
		return mostra;
	}

	public boolean doDeleteById(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + PosserdereCaratteristicaDAO.TABLE_NAME + " WHERE item = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);

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

	public JsonElement doRetrieveValueByName(String itemq, int id) {
		// TODO Auto-generated method stub
		return null;
	}
}