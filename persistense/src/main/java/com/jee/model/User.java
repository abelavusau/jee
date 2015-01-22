package com.jee.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(columnNames = "id"),
        @UniqueConstraint(columnNames = "username")
})
@NamedQuery(name = User.FIND_ALL, query = "SELECT u FROM User u")
public class User extends DomainObject {
    public static final String FIND_ALL = "User.findAll";
    private static final long serialVersionUID = 1L;
    private String            username;
    private String            firstname;
    private String            lastname;
    private String            password;
    private Set<Group>        groups;

    public User() {
    }

    public User(String username, String firstname, String lastname, String password) {
        super();
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    // bi-directional many-to-many association to Group
    @ManyToMany
    @JoinTable(
        name = "users_groups",
        joinColumns = {
                @JoinColumn(name = "user_id", referencedColumnName = "id")
        },
        inverseJoinColumns = {
                @JoinColumn(name = "group_id", referencedColumnName = "id")
        }
    )
    public Set<Group> getGroups() {
        if (this.groups == null) {
            this.groups = new HashSet<Group>();
        }
        
        return this.groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }

}