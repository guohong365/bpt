package com.uc.bpg.domain;

import java.util.Date;
import java.util.List;

import com.uc.web.domain.AbstractUser;
import com.uc.web.domain.WithLongId;

public class UserImpl extends AbstractUser implements WithLongId {
	private String tele;
	private String email;
	private Boolean adminFlag;
	private Long org;
	private Date createTime;
	private Long creater;
	private Date cancelTime;
	private Long cancelater;
	private String description;
	private String orgName;
	private String orgType;
	private String createrName;
	private String cancelaterName;
	private List<RoleAvailable> roles;
	
	public Long getId(){
		return (Long) super.getId();
	}
	
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Boolean getAdminFlag() {
		return adminFlag;
	}
	public void setAdminFlag(Boolean adminFlag) {
		this.adminFlag = adminFlag;
	}
	public Long getOrg() {
		return org;
	}
	public void setOrg(Long org) {
		this.org = org;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getCreater() {
		return creater;
	}
	public void setCreater(Long creater) {
		this.creater = creater;
	}
	public Date getCancelTime() {
		return cancelTime;
	}
	public void setCancelTime(Date cancelTime) {
		this.cancelTime = cancelTime;
	}
	public Long getCancelater() {
		return cancelater;
	}
	public void setCancelater(Long cancelater) {
		this.cancelater = cancelater;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getCancelaterName() {
		return cancelaterName;
	}
	public void setCancelaterName(String cancelaterName) {
		this.cancelaterName = cancelaterName;
	}
	public List<RoleAvailable> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleAvailable> roles) {
		this.roles = roles;
	}
	
	
}