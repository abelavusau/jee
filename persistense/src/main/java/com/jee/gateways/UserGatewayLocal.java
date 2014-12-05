package com.jee.gateways;

import javax.ejb.Local;

import com.jee.gateways.generic.GenericGateway;
import com.jee.model.User;

@Local
public interface UserGatewayLocal extends GenericGateway<User> {

}
