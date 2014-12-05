package com.jee.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQuery(name=User.FIND_ALL, query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "User.findAll";
	private UserPK id;
	private byte enabled;
	private String firstname;
	private String lastname;
	private String password;
	private Set<Role> roles;

	public User() {
	}


	@EmbeddedId
	public UserPK getId() {
		return this.id;
	}

	public void setId(UserPK id) {
		this.id = id;
	}


	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}


	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	//bi-directional many-to-many association to Role
	@ManyToMany
	@JoinTable(
		name="user_role"
		, joinColumns={
			@JoinColumn(name="user_id", referencedColumnName="id"),
			@JoinColumn(name="user_id", referencedColumnName="username"),
			}
		, inverseJoinColumns={
			@JoinColumn(name="role_id")
			}
		)
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}