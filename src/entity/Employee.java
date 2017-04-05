package entity;

import java.io.Serializable;

public class Employee implements Serializable {

	private static final long serialVersionUID = 1L;

	private String empNo;
	private String empName;
	private String empPass;

	public Employee(){}

	public Employee( String empNo, String empName, String empPass ) {
		this.empNo = empNo;
		this.empName = empName;
		this.empPass = empPass;
	}

	public Employee( String empName ) {
		this.empName = empName;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo( String empNo ) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName( String empName ) {
		this.empName = empName;
	}
	public String getEmpPass() {
		return empPass;
	}
	public void setEmpPass( String empPass ) {
		this.empPass = empPass;
	}

}
