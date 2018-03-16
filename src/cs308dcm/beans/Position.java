package cs308dcm.beans;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name="Position")
public class Position {
	private int id;
	private String postion;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPostion() {
		return postion;
	}
	public void setPostion(String postion) {
		this.postion = postion;
	}	
}

