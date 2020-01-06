package _model;

public class Privilege {
	private Integer privilegeId;
	private String privilegeName;
	
	public Privilege() {}
	
	public Privilege(String privilegeName) {
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
