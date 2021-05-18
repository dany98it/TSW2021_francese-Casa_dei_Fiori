package model;

import java.sql.SQLException;
import java.util.Base64;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImmagineDAO implements DaoInterfacce<Immagine, Integer> {
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
	@Override
	public void doSave(Immagine t) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean doDelete(Integer code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public int doUpdate(Immagine t) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Immagine doRetrieveByKey(Integer code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Collection<Immagine> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
