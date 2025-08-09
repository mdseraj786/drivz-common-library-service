package com.drivz.commonLibrary.models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Color extends BaseModel{
    
    @Column(nullable = false,unique = true)
    private String name;
}
