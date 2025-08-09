package com.drivz.commonLibrary.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Car extends BaseModel {
    @Column(unique = true,nullable = false)
    private String plateNumber;
    
    private String brand;
    
    @ManyToOne
    private Color color;
    
    private String model;
    
    @Enumerated(value = EnumType.STRING)
    private CarType carType;
    
    @OneToOne
    private Driver driver ;
}
