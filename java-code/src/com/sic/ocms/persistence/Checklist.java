package com.sic.ocms.persistence;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Checklist {



	private int checklistId;
	private String name;
	private double percentage;
	private Set<Item> items;

	@Id
	@GeneratedValue
	public int getChecklistId() {
		return checklistId;
	}
	public void setChecklistId(int checklistId) {
		this.checklistId = checklistId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public Set<Item> getItems() {
		return items;
	}
	public void setItems(Set<Item> items) {
		this.items = items;
	}

}