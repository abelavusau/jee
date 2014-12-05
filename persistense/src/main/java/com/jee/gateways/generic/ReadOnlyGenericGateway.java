package com.jee.gateways.generic;

import java.io.Serializable;
import java.util.List;

public interface ReadOnlyGenericGateway<T> {
    Class<T> getPersistentClass();

    T get(Serializable id);

    T load(Serializable id);

    List<T> loadAll();
}
