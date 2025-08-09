package com.drivz.commonLibrary.models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
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
}