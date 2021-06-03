package model;

import java.io.File;
import java.util.Map;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

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
	public String caricaImmagine(byte[] b) throws Exception {
		Map<?, ?> config = ObjectUtils.asMap(
				  "cloud_name", "hnqb5wfvq",
				  "api_key", "876962418587798",
				  "api_secret", "leFJnkkTvShSQLQTME2AoXsciRY");
		Cloudinary cloudinary = new Cloudinary(config);
		Map<?, ?> result=cloudinary.uploader().upload(b, ObjectUtils.emptyMap());
		return (String) result.get("url");
	}
}
