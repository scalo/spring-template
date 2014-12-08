package com.scalosoft.template.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "PERSON")
public class Person {
	private Integer id;
	private String name;
	private String email;
	private BigDecimal cost;
	private Date startDate;
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	@Id
	@SequenceGenerator(allocationSize = 1, initialValue = 1, sequenceName = "person_id_seq", name = "person_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "person_id_seq")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BigDecimal getCost() {
		return cost;
	}
	
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	
	@Temporal(TemporalType.DATE)
	@Column( name="start_date")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

}
