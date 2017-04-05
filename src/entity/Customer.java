package entity;

import java.io.Serializable;

import javax.servlet.http.HttpServlet;

public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	private String custCode;
	private String custName;
	private String telNo;
	private String postalCode;
	private String address;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customer() {
    }

    public Customer( String custCode, String custName, String telNo, String postalCode, String address ) {
    	this.custCode = custCode;
    	this.custName = custName;
    	this.telNo = telNo;
    	this.postalCode = postalCode;
    	this.address = address;
    }

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode( String custCode ) {
		this.custCode = custCode;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName( String custName ) {
		this.custName = custName;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo( String telNo ) {
		this.telNo = telNo;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode( String postalCode ) {
		this.postalCode = postalCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress( String address ) {
		this.address = address;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
