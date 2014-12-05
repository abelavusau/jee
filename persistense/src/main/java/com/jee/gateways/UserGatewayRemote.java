package com.jee.gateways;

import javax.ejb.Remote;

import com.jee.gateways.generic.GenericGateway;
import com.jee.model.User;

@Remote
public interface UserGatewayRemote extends GenericGateway<User> {

}
