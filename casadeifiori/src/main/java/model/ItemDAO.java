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

import com.google.gson.JsonElement;

public class ItemDAO implements DaoInterfacce<Item,Integer>{
	
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
	
	private static final String TABLE_NAME = "item";

	@Override
	public synchronized void doSave(Item t) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + ItemDAO.TABLE_NAME
				+ " (id, iva, prezzo, descrizione, nome, tipo, sconto, quantita) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, t.getId());
			preparedStatement.setInt(2, t.getIva());
			preparedStatement.setDouble(3, t.getPrezzo());
			preparedStatement.setString(4, t.getDescrizione());
			preparedStatement.setString(5, t.getNome());
			preparedStatement.setString(6, t.getTipo().toString());
			preparedStatement.setInt(7, t.getSconto());
			preparedStatement.setInt(8, t.getQuantita());

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

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		boolean result ;

		String deleteSQL = "DELETE FROM " + ItemDAO.TABLE_NAME + " WHERE id = ?";

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
	public synchronized Item doRetrieveByKey(Integer code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Item bean = new Item();

		String selectSQL = "SELECT * FROM " + ItemDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
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
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Item bean = new Item();
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
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

	@Override
	public int doUpdate(Item t) throws SQLException {
		// TODO Auto-generated method stub
				Connection connection = null;
				PreparedStatement preparedStatement = null;

				int result ;

				String updateSQL = "UPDATE " + ItemDAO.TABLE_NAME + " SET  "
						+ "iva =  ? ,"
						+ "prezzo = ? ,"
						+ "descrizione = ? ," 
						+ "nome = ? ,"
						+ "tipo = ? ,"
						+ "sconto = ? ," 
						+ "quantita = ? "
						+ " "+ "WHERE id = ? ";

				try {
					connection = ds.getConnection();
					connection.setAutoCommit(false);
					preparedStatement = connection.prepareStatement(updateSQL);
					preparedStatement.setInt(1, t.getIva());
					preparedStatement.setDouble(2, t.getPrezzo());
					preparedStatement.setString(3, t.getDescrizione());
					preparedStatement.setString(4, t.getNome());
					preparedStatement.setString(5, t.getTipo().toString());
					preparedStatement.setInt(6, t.getSconto());
					preparedStatement.setInt(7, t.getQuantita());
					preparedStatement.setInt(8, t.getId());

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
	public int doGetMaxItemId() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int maxID = 0;

		String selectSQL = "SELECT MAX(id) FROM " + ItemDAO.TABLE_NAME ;


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
	public synchronized Collection<Item> doRetrieveByName(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Item> products = new LinkedList<Item>();

		String selectSQL = "SELECT * FROM " + ItemDAO.TABLE_NAME + " WHERE nome LIKE ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code+"%");

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Item bean = new Item();
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
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
	public synchronized Object[] doRetrieveName(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<SearchBean> item=new ArrayList<SearchBean>();

		String selectSQL = "SELECT nome FROM " + ItemDAO.TABLE_NAME + " WHERE nome LIKE ? GROUP BY nome";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code+"%");

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				item.add(new SearchBean(rs.getString("nome")));
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
		return item.toArray();
	}
	public synchronized Object[] doRetrieveNameByTipo(String code, TipoItem t) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<SearchBean> item=new ArrayList<SearchBean>();

		String selectSQL = "SELECT nome FROM " + ItemDAO.TABLE_NAME + " WHERE nome LIKE ? AND tipo = ? GROUP BY nome";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code+"%");
			preparedStatement.setString(2, t.toString());

			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				item.add(new SearchBean(rs.getString("nome")));
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
		return item.toArray();
	}

	public Object[] doRetrieveNameByTagID(String itemq, int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Collection<Item> doRetrieveByNameAndTipo(String code, TipoItem tipoItem) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Item> products = new LinkedList<Item>();

		String selectSQL = "SELECT * FROM " + ItemDAO.TABLE_NAME + " WHERE nome LIKE ? AND tipo = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code+"%");
			System.out.println(tipoItem.toString());
			preparedStatement.setString(2, tipoItem.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			connection.commit();
			while (rs.next()) {
				Item bean = new Item();
				bean.setId(rs.getInt("id"));
				bean.setIva(rs.getInt("iva"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(TipoItem.valueOf(rs.getString("tipo")));
				bean.setSconto(rs.getInt("sconto"));
				bean.setQuantita(rs.getInt("quantita"));
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