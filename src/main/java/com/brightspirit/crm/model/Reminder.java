package com.brightspirit.crm.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="reminder")
public class Reminder implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @Column
    private int customerId;
    
    @Column
    private Date dueDt;
    
    @Column
    private Boolean ack;
    
    @Column
    private String notes;
   
    @Transient
    private Customer customer;
    
    public String getStatus() {
    	Date now = GregorianCalendar.getInstance().getTime();
    	
    	if(this.dueDt == null || now.before(this.dueDt) || this.ack == true)
    		return "success";
    	
    	if(now.equals(this.dueDt))
    		return "warning";
    	
    	return "danger";
    }
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getDueDt() {
		return dueDt;
	}

	public void setDueDt(Date dueDt) {
		this.dueDt = dueDt;
	}

	public Boolean getAck() {
		return ack;
	}

	public void setAck(Boolean ack) {
		this.ack = ack;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reminder other = (Reminder) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Reminder [id=" + id + ", customerId=" + customerId + ", dueDt="
				+ dueDt + ", ack=" + ack + ", notes=" + notes + "]";
	}
   
	
}
