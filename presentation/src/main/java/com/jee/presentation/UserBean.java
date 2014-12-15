package com.jee.presentation;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import com.jee.gateways.UserGatewayLocal;
import com.jee.model.Group;
import com.jee.model.User;
import com.jee.model.UserPK;
import com.jee.presentation.util.HashPasswordGenerator;

@ManagedBean(name = "userBean")
@RequestScoped
public class UserBean implements Serializable {
    @EJB
    private UserGatewayLocal  gatewayLocal;

    private static final long serialVersionUID = 1L;

    private String            firstname;
    private String            lastname;
    private String            username;
    private String            password;

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void submit() {
        User user = new User(new UserPK(username), firstname, lastname, HashPasswordGenerator.generateHash(password));
        user.getGroups().add(new Group(1));
        gatewayLocal.create(user);
    }
}
