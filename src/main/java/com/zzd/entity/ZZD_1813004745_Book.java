package com.zzd.entity;

import java.io.Serializable;
import java.util.Map;

public class ZZD_1813004745_Book implements Serializable {
	private Integer id;
	private String name;
	private Double price;
	private String cover;

	public ZZD_1813004745_Book(Integer id, String name, Double price, String cover) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.cover = cover;
	}

	public ZZD_1813004745_Book() {
	}

	public ZZD_1813004745_Book(Integer id, String name, Double price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}

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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	@Override
	public String toString() {
		return "ZZD_1813004745_Book{" +
				"id=" + id +
				", name='" + name + '\'' +
				", price=" + price +
				", cover=" + cover +
				'}';
	}
}
