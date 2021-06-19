package model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Password {
	
	private static final String ALGORITHM = "SHA-256";
	
	public static String criptaPassword(String password) 
	{
		try {
			MessageDigest md = MessageDigest.getInstance( ALGORITHM );
			md.update( password.getBytes("UTF-8") );
			return toHex(md.digest());
		}
		catch (UnsupportedEncodingException e) {
			return null;
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}
 
	public static boolean isCorrect ( String password, String hash ) {
		if (hash!=null) {
			return hash.equals( criptaPassword( password ) );
		}
		return false;
	}

	private static String toHex(byte[] data)  {
		StringBuffer sb = new StringBuffer();
		for (byte b : data) {
			String digit = Integer.toString(b & 0xFF, 16);
 
			if (digit.length() == 1) {
				sb.append("0");
			}
			sb.append(digit);
		}
		return sb.toString();
	}
}