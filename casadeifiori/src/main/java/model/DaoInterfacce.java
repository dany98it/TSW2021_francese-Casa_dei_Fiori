package model;

import java.sql.SQLException;
import java.util.Collection;

public interface DaoInterfacce<T,E> {
	public void doSave(T t) throws SQLException;

	public boolean doDelete(E code) throws SQLException;

	public T doRetrieveByKey(E code) throws SQLException;
	
	public Collection<T> doRetrieveAll() throws SQLException;
}
