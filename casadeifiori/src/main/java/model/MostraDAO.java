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

public class MostraDAO implements DaoInterfacce<Mostra, Mostra>{
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
	
	private static final String TABLE_NAME = "mostra_img";
	@Override
	public synchronized void doSave(Mostra t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + MostraDAO.TABLE_NAME
				+ " (`item`, `immagine`) VALUES (?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getItem());
			preparedStatement.setInt(2, t.getImmagine());

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
	public boolean doDelete(Mostra code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + MostraDAO.TABLE_NAME + " WHERE item = ? AND immagine = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getImmagine());

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
	public int doUpdate(Mostra t) throws SQLException {
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
	public Mostra doRetrieveByKey(Mostra code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Mostra bean = new Mostra();

		String selectSQL = "SELECT * FROM " + MostraDAO.TABLE_NAME + " WHERE item = ? AND immagine= ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getImmagine());

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setItem(rs.getInt("item"));
				bean.setImmagine(rs.getInt("immagine"));
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
	public Collection<Mostra> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public Collection<Mostra> doRetrieveAllByItem(Integer item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Mostra> mostra = new LinkedList<Mostra>();

		String selectSQL = "SELECT * FROM " + MostraDAO.TABLE_NAME +" WHERE item = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, item);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Mostra bean = new Mostra();
				bean.setItem(rs.getInt("item"));
				bean.setImmagine(rs.getInt("immagine"));
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


}
