package com.it2299.ffth.reincoast.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="OUTBOUND_DELIVERY")
public class OutboundDelivery {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="outboundDelivery", cascade=CascadeType.PERSIST)
	private List<InboundLineItem> items;
	
	@Column(name="DATE_DELIVERED")
	private Date dateDelivered;
	
	@Column(name="COLLECTION_CENTER")
	private String collectionCenter;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="TOTALPRICE")
	private double totalPrice;

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCollectionCenter() {
		return collectionCenter;
	}

	public void setCollectionCenter(String collectionCenter) {
		this.collectionCenter = collectionCenter;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<InboundLineItem> getItems() {
		return items;
	}

	public void setItems(List<InboundLineItem> items) {
		this.items = items;
	}

	public Date getDateDelivered() {
		return dateDelivered;
	}

	public void setDateDelivered(Date dateDelivered) {
		this.dateDelivered = dateDelivered;
	}

	
	
	
}
