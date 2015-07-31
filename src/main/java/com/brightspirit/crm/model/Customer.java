package com.brightspirit.crm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

@Entity
@Table(name="customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
    
    @Column
	private String firstName;
    
    @Column
	private String lastName;
    
    @Column
	private String address;
    
    @Column
	private String address2;
    
    @Column
	private String city;
    
    @Column
	private String state;
    
    @Column
	private String zip;
    
    @Column
	private String email;
    
    @Column
	private String homePhone;
    
    @Column
	private String cellPhone;
    
    @Column String referredBy;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	
	public String getReferredBy() {
		return referredBy;
	}
	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	
	public String getFullName() {
		if(StringUtils.trimToNull(getLastName()) != null)
			return StringUtils.trimToEmpty(getLastName()) + ", "+  StringUtils.trimToEmpty(getFirstName());
		else 
			return StringUtils.trimToEmpty(getFirstName());
		
		
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", address=" + address
				+ ", address2=" + address2 + ", city=" + city + ", state="
				+ state + ", zip=" + zip + ", email=" + email + ", homePhone="
				+ homePhone + ", cellPhone=" + cellPhone + "]";
	}
	
	
}
