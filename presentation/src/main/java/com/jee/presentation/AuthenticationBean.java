package com.jee.presentation;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@ManagedBean(name = "authenticationBean")
@RequestScoped
public class AuthenticationBean implements Serializable {
    private static final long serialVersionUID = 1L;

    public String logout() {
        String result = "/login?faces-redirect=true";

        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();

        try {
            request.logout();
        } catch (ServletException e) {
            result = "/loginerror?faces-redirect=true";
        }

        return result;
    }
}