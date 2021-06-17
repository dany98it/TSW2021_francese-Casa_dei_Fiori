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

public class InclusioneTagDAO implements DaoInterfacce<InclusioneTag, InclusioneTag>{
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
	public synchronized void doSave(InclusioneTag t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + InclusioneTagDAO.TABLE_NAME
				+ " (`item`, `tag`) VALUES (?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getItem());
			preparedStatement.setInt(2, t.getTag());

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
	public boolean doDelete(InclusioneTag code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + InclusioneTagDAO.TABLE_NAME + " WHERE item = ? AND tag = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getTag());

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
	public int doUpdate(InclusioneTag t) throws SQLException {
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
	public InclusioneTag doRetrieveByKey(InclusioneTag code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		InclusioneTag bean = new InclusioneTag();

		String selectSQL = "SELECT * FROM " + InclusioneTagDAO.TABLE_NAME + " WHERE item = ? AND tag= ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code.getItem());
			preparedStatement.setInt(2, code.getTag());

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setItem(rs.getInt("item"));
				bean.setTag(rs.getInt("tag"));
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
	public Collection<InclusioneTag> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public Collection<InclusioneTag> doRetrieveAllByItem(Integer item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<InclusioneTag> mostra = new LinkedList<InclusioneTag>();

		String selectSQL = "SELECT * FROM " + InclusioneTagDAO.TABLE_NAME +" WHERE item = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, item);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				InclusioneTag bean = new InclusioneTag();
				bean.setItem(rs.getInt("item"));
				bean.setTag(rs.getInt("tag"));
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
