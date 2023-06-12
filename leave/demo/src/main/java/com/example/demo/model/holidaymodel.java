package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="abc")
public class holidaymodel {
	@Id
	private int abc;

	public int getAbc() {
		return abc;
	}

	public void setAbc(int abc) {
		this.abc = abc;
	}

	@Override
	public String toString() {
		return "holidaymodel [abc=" + abc + "]";
	}

	public holidaymodel(int abc) {
		super();
		this.abc = abc;
	}

	public holidaymodel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	 
}
