package com.helloIftekhar.springJwt.dto;

import lombok.Data;

@Data
public class EmployeesByServiceDTO {
    private Long serviceId;
    private String serviceName;
    private Long count;

    public EmployeesByServiceDTO(Long serviceId, String serviceName, Long count) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.count = count;
    }
}