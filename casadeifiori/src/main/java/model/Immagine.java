package model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

public class Immagine {
	private int id;
	private String img;
	private String descrizione;
	
	
	public Immagine() {
		super();
	}

	public Immagine(int id, String img, String descrizione) {
		super();
		this.id = id;
		this.img = img;
		this.descrizione = descrizione;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String toBase64(Blob img) throws Exception {
		InputStream in=img.getBinaryStream();
		ByteArrayOutputStream out= new ByteArrayOutputStream();
		byte[] buffer=new byte[4096];
		int bytesRead=-1;
		while ((bytesRead = in.read(buffer)) != -1) {
			out.write(buffer, 0, bytesRead);                  
        }
		byte[] imageBytes = out.toByteArray();
		in.close();
		out.close();
		return Base64.getEncoder().encodeToString(imageBytes);
	}
	public Blob toBlob(String img) throws Exception {
		byte[] imageBytes = Base64.getDecoder().decode(img);
		return new SerialBlob(imageBytes);
	}
}
