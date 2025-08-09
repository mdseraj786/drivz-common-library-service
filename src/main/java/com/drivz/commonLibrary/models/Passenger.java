package com.drivz.commonLibrary.models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;

import java.util.List;

@Entity
@Builder
@Getter
@Setter
@AllArgsConstructor
@JsonIgnoreProperties({"HibernateLazyInitializer","handler","bookings"})
@NoArgsConstructor
public class Passenger extends BaseModel {
    @Column(nullable = false)   
    private String name;
    
    @Column(nullable = false,unique = true)
    private String email;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false)
    private String phoneNumber;
    
    @OneToMany(mappedBy = "passenger")
    private List<Booking> bookings ;
    
    @OneToOne
    private Booking activeBooking;

    @DecimalMin(value = "0.00", message = "Rating must be greater or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be lesser or equal to 5.00")
    private double rating;
    
    @OneToOne
    private ExactLocation lastKnownLocation;
    
    @OneToOne
    private ExactLocation home;
}