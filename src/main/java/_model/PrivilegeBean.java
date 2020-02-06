package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Privilege")
public class PrivilegeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer privilegeId;
	private String privilegeName;
	
	public PrivilegeBean() {}
	
	public PrivilegeBean(String privilegeName) {
		this.privilegeName = privilegeName;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getPrivilegeId() {
		return privilegeId;
	}

	public void setPrivilegeId(Integer privilegeId) {
		this.privilegeId = privilegeId;
	}

	public String getPrivilegeName() {
		return privilegeName;
	}

	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}
	
}
