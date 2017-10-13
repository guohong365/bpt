package com.uc.bpg.domain;

import com.uc.web.domain.EntityBase;
import com.uc.web.domain.WithLongId;

public class DeviceType  extends EntityBase implements WithLongId {
	private Long id;
	private String uuid;
	private String name;
	private Boolean valid;
	private Long showOrder;
	private String product;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getValid() {
		return valid;
	}
	public void setValid(Boolean valid) {
		this.valid = valid;
	}
	public Long getShowOrder() {
		return showOrder;
	}
	public void setShowOrder(Long showOrder) {
		this.showOrder = showOrder;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	
}
