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

public class OrdineDAO implements DaoInterfacce<Ordine, Integer> {

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
	
	private static final String TABLE_NAME = "ordine";
	@Override
	public void doSave(Ordine t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + OrdineDAO.TABLE_NAME
				+ " (`id`, `tipo`, `tipo_di_pagamento`, `prezzo_totale`, `data`, `user`) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getId());
			preparedStatement.setString(2, t.getTipoOrdine().toString());
			preparedStatement.setString(3, t.getTipoPagamento().toString());
			preparedStatement.setDouble(4, t.getPrezzoTotale());
			preparedStatement.setTimestamp(5, t.getDataOrdine());
			preparedStatement.setInt(6, t.getUser());

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

		String deleteSQL = "DELETE FROM " + OrdineDAO.TABLE_NAME + " WHERE id = ?";

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
	public int doUpdate(Ordine t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result ;

		String updateSQL = "UPDATE " + OrdineDAO.TABLE_NAME + " SET  "
				+ "tipo =  ? ,"
				+ "tipo_di_pagamento = ? ,"
				+ "prezzo_totale = ? ,"
				+ "data = ? ,"
				+ "user = ? ," 
				+ " "+ "WHERE id = ? ";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, t.getTipoOrdine().toString());
			preparedStatement.setString(2, t.getTipoPagamento().toString());
			preparedStatement.setTimestamp(3, t.getDataOrdine());
			preparedStatement.setDouble(4, t.getPrezzoTotale());
			preparedStatement.setInt(5, t.getUser());
			preparedStatement.setInt(6, t.getId());

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
	public Ordine doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Ordine bean = new Ordine();

		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setTipoOrdine(TipoOrdine.valueOf(rs.getString("tipo")));
				bean.setTipoPagamento(TipoPagamento.valueOf(rs.getString("tipo_di_pagamento")));
				bean.setPrezzoTotale(rs.getDouble("prezzo_totale"));
				bean.setDataOrdine(rs.getTimestamp("data"));
				bean.setUser(rs.getInt("user"));
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
	public Collection<Ordine> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Ordine> ordini = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME;

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
				Ordine bean = new Ordine();
				bean.setId(rs.getInt("id"));
				bean.setTipoOrdine(TipoOrdine.valueOf(rs.getString("tipo")));
				bean.setTipoPagamento(TipoPagamento.valueOf(rs.getString("tipo_di_pagamento")));
				bean.setPrezzoTotale(rs.getDouble("prezzo_totale"));
				bean.setDataOrdine(rs.getTimestamp("data"));
				bean.setUser(rs.getInt("user"));
				ordini.add(bean);
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
		return ordini;
	}
	
	public Collection<Ordine> doRetrieveByUser(int user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Ordine> ordini = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE user = ?";


		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, user);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Ordine bean = new Ordine();
				bean.setId(rs.getInt("id"));
				bean.setTipoOrdine(TipoOrdine.valueOf(rs.getString("tipo")));
				bean.setTipoPagamento(TipoPagamento.valueOf(rs.getString("tipo_di_pagamento")));
				bean.setPrezzoTotale(rs.getDouble("prezzo_totale"));
				bean.setDataOrdine(rs.getTimestamp("data"));
				bean.setUser(rs.getInt("user"));
				ordini.add(bean);
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
		return ordini;
	}
	
	public int doGetMaxOrderId() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int maxID = 0;

		String selectSQL = "SELECT MAX(id) FROM " + OrdineDAO.TABLE_NAME ;


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
