package _model;

import java.io.Serializable;

public class PrivilegeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer privilegeId;
	private String privilegeName;
	
	public PrivilegeBean() {}
	
	public PrivilegeBean(String privilegeName) {
		this.privilegeName = privilegeName;
	}

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
