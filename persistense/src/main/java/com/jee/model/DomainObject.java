package com.jee.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * @author Aliaksandr_Belavusau
 *
 */
@MappedSuperclass
@Access(AccessType.PROPERTY)
public abstract class DomainObject implements Serializable {
    /**
     * Default serial uid.
     */
    private static final long serialVersionUID = 1L;

    private Long              id;
    private Date createDate;
    private Date updateDate;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }
    
    @Column(name = "create_date", nullable = false)
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Column(name = "update_date", nullable = false)
    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((id == null) ? 0 : id.hashCode());
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
	DomainObject other = (DomainObject) obj;
	if (id == null) {
	    if (other.id != null)
		return false;
	} else if (!id.equals(other.id))
	    return false;
	return true;
    }

    @Override
    public String toString() {
	return "DomainObject [id=" + id + "]";
    }
}
