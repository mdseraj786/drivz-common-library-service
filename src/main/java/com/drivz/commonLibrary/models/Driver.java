package com.drivz.commonLibrary.models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"HibernateLazyInitializer","handler","bookings"}) // ignore infinite json response
public class Driver extends BaseModel {

    private String name;

    @Column(nullable = false, unique = true)
    private String licenseNumber;
    
    private String phoneNumber;
    
    private String aadharNumber;
    
    
    @Enumerated(EnumType.STRING)
    private DriverApprovalStatus driverApprovalStatus;
    
    @OneToOne
    private ExactLocation lastKnownLocation;   
    
    @OneToOne
    private ExactLocation home;
    
    private String activeCity;
    
    @DecimalMin(value = "0.00", message = "Rating must be greater or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be lesser or equal to 5.00")
    private double rating;
    
    private boolean isAvailable;
    
    // 1 : n , Driver : Booking
    @OneToMany(mappedBy = "driver", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<Booking> bookings;
}