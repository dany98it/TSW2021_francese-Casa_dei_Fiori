package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TagDAO implements DaoInterfacce<Tag, Integer> {
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
	
	private static final String TABLE_NAME = "tag";
	@Override
	public void doSave(Tag t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + TagDAO.TABLE_NAME
				+ " (`nome`, `descrizione`) VALUES (?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, t.getNome());
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

	@Override
	public boolean doDelete(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + TagDAO.TABLE_NAME + " WHERE id = ?";

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
	public int doUpdate(Tag t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + TagDAO.TABLE_NAME + " SET  "
				+ "nome =  ? ,"
				+ "descrizione = ? ,"
				+ " "+ "id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, t.getNome());
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

	@Override
	public Tag doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Tag bean = new Tag();

		String selectSQL = "SELECT * FROM " + TagDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
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

	@Override
	public Collection<Tag> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Tag> tag = new LinkedList<Tag>();

		String selectSQL = "SELECT * FROM " + TagDAO.TABLE_NAME;

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
				Tag bean = new Tag();
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				tag.add(bean);
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
		return tag;
	}
	public Tag doRetrieveByName (String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Tag bean = new Tag();

		String selectSQL = "SELECT * FROM " + TagDAO.TABLE_NAME + " WHERE nome = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
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
	public synchronized Object[] doRetrieveName(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<SearchBean> tag=new ArrayList<SearchBean>();

		String selectSQL = "SELECT nome FROM " + TagDAO.TABLE_NAME + " WHERE nome LIKE ? GROUP BY nome";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code+"%");

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				tag.add(new SearchBean(rs.getString("nome")));
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
		return tag.toArray();
	}
}
