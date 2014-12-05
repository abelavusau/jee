package com.jee.gateways.impl;

import java.io.Serializable;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.jee.gateways.UserGatewayLocal;
import com.jee.model.User;

/**
 * Session Bean implementation class UserGateway
 */
@Stateless
@LocalBean
public class UserGateway implements UserGatewayLocal {

    @PersistenceContext(unitName = "persistense")
    EntityManager em;
    
    private User current;
    
    /**
     * Default constructor.
     */
    public UserGateway() {
    }

    @Override
    public void create(User user) {
        em.persist(user);
        this.current = user;
    }

    @Override
    public void update() {
        em.refresh(this.current);
    }

    @Override
    public void delete(Serializable id) {
        User ref = em.getReference(User.class, id);
        em.remove(ref);
    }

    @Override
    public Class<User> getPersistentClass() {
        return User.class;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> loadAll() {
        return em.createNamedQuery(User.FIND_ALL).getResultList();
    }

    @Override
    public User get(Serializable id) {
        this.current = em.find(User.class, id);
        return this.current;
    }

    @Override
    public User load(Serializable id) {
        this.current = em.getReference(User.class, id);
        return this.current;
    }
    
    public User getCurrent() {
        return this.current;
    }
}