package com.jee.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
public class Group implements Serializable {
    private static final long serialVersionUID = 1L;
    private int               id;
    private String            desc;
    private String            name;
    private Set<User>         users;

    public Group() {
    }

    public Group(int id) {
        super();
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
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