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

public class ContenutoOrdineDao implements DaoInterfacce<ContenutoOrdine,Integer>{
	
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
	
	private static final String TABLE_NAME = "contenuto";
	
	@Override
	public void doSave(ContenutoOrdine t) throws SQLException {
				Connection connection = null;
				PreparedStatement preparedStatement = null;
				String insertSQL = "INSERT INTO " + TABLE_NAME
						+ " (ordine, item, quantita, iva_vendita, prezzo_vendita) VALUES (?, ?, ?, ?, ?)";

				try {
					
					connection = ds.getConnection();
					connection.setAutoCommit(false);
					preparedStatement = connection.prepareStatement(insertSQL);
					preparedStatement.setInt(1, t.getOrdine());
					preparedStatement.setInt(2, t.getItem());
					preparedStatement.setInt(3, t.getQuantita());
					preparedStatement.setInt(4, t.getIvaVendita());
					preparedStatement.setDouble(5, t.getPrezzoVendita());
	

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

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE ordine = ?";

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
	public int doUpdate(ContenutoOrdine t) throws SQLException {
		return 0;
	
	}

	
	public ContenutoOrdine doRetrieveByKey(Integer code, Integer item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ContenutoOrdine bean = new ContenutoOrdine();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE ordine = ? and item = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			preparedStatement.setInt(2, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setOrdine(rs.getInt("ordine"));
				bean.setItem(rs.getInt("item"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setIvaVendita(rs.getInt("iva_vendita"));
				bean.setPrezzoVendita(rs.getDouble("prezzo_vendita"));
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
	public Collection<ContenutoOrdine> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ContenutoOrdine> products = new LinkedList<ContenutoOrdine>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

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
				ContenutoOrdine bean = new ContenutoOrdine();
				bean.setOrdine(rs.getInt("ordine"));
				bean.setItem(rs.getInt("item"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setIvaVendita(rs.getInt("iva_vendita"));
				bean.setPrezzoVendita(rs.getDouble("prezzo_vendita"));
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

	@Override
	public ContenutoOrdine doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ContenutoOrdine bean = new ContenutoOrdine();

		String selectSQL = "SELECT * FROM " + ContenutoOrdineDao.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setOrdine(rs.getInt("ordine"));
				bean.setItem(rs.getInt("item"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setIvaVendita(rs.getInt("iva_vendita"));
				bean.setPrezzoVendita(rs.getDouble("prezzo_vendita"));
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

	
	public Collection<ContenutoOrdine> doRetrieveByOrder(Integer order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ContenutoOrdine> products = new ArrayList<ContenutoOrdine>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE ordine = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, order);
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				ContenutoOrdine bean = new ContenutoOrdine();
				bean.setOrdine(rs.getInt("ordine"));
				bean.setItem(rs.getInt("item"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setIvaVendita(rs.getInt("iva_vendita"));
				bean.setPrezzoVendita(rs.getDouble("prezzo_vendita"));
				products.add(bean);
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