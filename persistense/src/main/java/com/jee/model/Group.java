package com.jee.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * The persistent class for the groups database table.
 * 
 */
@Entity
@Table(name = "groups")
@NamedQuery(name = "Group.findAll", query = "SELECT g FROM Group g")
public class Group extends DomainObject {
    private static final long serialVersionUID = 1L;
    private String            desc;
    private String            name;
    private Set<User>         users;

    public Group() {
    }

    public Group(long id) {
        super();
        this.setId(id);
    }

    public String getDesc() {
        return this.desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // bi-directional many-to-many association to User
    @ManyToMany(mappedBy = "groups")
    public Set<User> getUsers() {
        return this.users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

}