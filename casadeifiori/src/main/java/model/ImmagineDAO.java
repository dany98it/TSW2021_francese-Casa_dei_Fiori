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

import com.mysql.cj.jdbc.Blob;

public class ImmagineDAO {
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
	private static final String TABLE_NAME = "immagine";

	public synchronized void doSave(ImmagineSave t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + ImmagineDAO.TABLE_NAME
				+ " (`img`, `descrizione`) VALUES (?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setBlob(1, t.getImg());
			preparedStatement.setString(2, t.getDescrizione());
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

	public boolean doDelete(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + ImmagineDAO.TABLE_NAME + " WHERE id = ?";

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

	public int doUpdate(ImmagineSave t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + ImmagineDAO.TABLE_NAME + " SET  "
				+ "img =  ? ,"
				+ "descrizione = ? "
				+ "WHERE "+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setBlob(1, t.getImg());
			preparedStatement.setString(2, t.getDescrizione());
			preparedStatement.setInt(3, t.getId());
			

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

	public ImmagineRetrive doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ImmagineRetrive bean = new ImmagineRetrive();

		String selectSQL = "SELECT * FROM " + ImmagineDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				java.sql.Blob b=rs.getBlob("img");
				bean.setImg(b.getBytes(1, (int) b.length()));
				bean.setDescrizione(rs.getString("descrizione"));
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

	public Collection<ImmagineRetrive> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ImmagineRetrive> immagine = new LinkedList<ImmagineRetrive>();

		String selectSQL = "SELECT * FROM " + ImmagineDAO.TABLE_NAME;

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
				ImmagineRetrive bean = new ImmagineRetrive();
				bean.setId(rs.getInt("id"));
				java.sql.Blob b=rs.getBlob("img");
				bean.setImg(b.getBytes(1, (int) b.length()));
				bean.setDescrizione(rs.getString("descrizione"));
				immagine.add(bean);
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
		return immagine;
	}
	public int doGetMaxItemId() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int maxID = 0;

		String selectSQL = "SELECT MAX(id) FROM " + ImmagineDAO.TABLE_NAME ;


		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
		
			if (rs.next()) {

				maxID = rs.getInt(1);
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
		return maxID;
		
	}
	

}
