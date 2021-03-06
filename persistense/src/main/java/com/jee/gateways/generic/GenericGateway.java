package com.jee.gateways.generic;

import java.io.Serializable;

public interface GenericGateway<T> extends ReadOnlyGenericGateway<T> {
    void create(T entity);

    void update(T entity);

    void delete(Serializable id);
}
