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

public class ItemDAO implements DaoInterfacce<Item,Integer>{
	
	private static DataSource ds;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/casa");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "item";

	@Override
	public synchronized void doSave(Item t) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ItemDAO.TABLE_NAME
				+ " (iva, prezzo, descrizione, nome, tipo, sconto) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getIva());
			preparedStatement.setDouble(2, t.getPrezzo());
			preparedStatement.setString(3, t.getDescrizione());
			preparedStatement.setString(4, t.getNome());
			preparedStatement.setString(5, t.getTipo().toString());
			preparedStatement.setInt(6, t.getSconto());

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
	public synchronized boolean doDelete(Integer code) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ItemDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Item doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Item bean = new Item();

		String selectSQL = "SELECT * FROM " + ItemDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
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
	public synchronized Collection<Item> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Item> products = new LinkedList<Item>();

		String selectSQL = "SELECT * FROM " + ItemDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Item bean = new Item();
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
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
		return products;
	}
}
