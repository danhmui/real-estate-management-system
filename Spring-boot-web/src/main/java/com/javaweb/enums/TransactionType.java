package com.javaweb.enums;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem nhà");

    private final String name;
    TransactionType(String name) {
        this.name = name;
    }

    public static Map<String, String> getTransactionTypeMap() {
        Map<String, String> map = new LinkedHashMap<>();
        for (TransactionType type : TransactionType.values()) {
            map.put(type.toString(), type.name());
        }
        return map;
    }
}
