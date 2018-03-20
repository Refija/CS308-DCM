package cs308dcm.models;

import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="Procedure")
public class Procedure {
	private int id;
	private String procedure;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProcedure() {
		return procedure;
	}
	public void setProcedure(String procedure) {
		this.procedure = procedure;
	}
	
	
}
