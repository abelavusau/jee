package com.jee.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the users database table.
 * 
 */
@Embeddable
public class UserPK implements Serializable {
    // default serial version id, required for serializable classes.
    private static final long serialVersionUID = 1L;
    private int               id;
    private String            username;

    public UserPK() {
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserPK)) {
            return false;
        }
        UserPK castOther = (UserPK) other;
        return (this.id == castOther.id) && this.username.equals(castOther.username);
    }

    public int hashCode() {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.id;
        hash = hash * prime + this.username.hashCode();

        return hash;
    }
}