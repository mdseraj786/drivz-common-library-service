package com.drivz.commonLibrary.models;

import jakarta.persistence.*;
import lombok.*;


@Entity

@Table(name = "booking_review")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
//@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Inheritance(strategy = InheritanceType.JOINED)
public class Review extends BaseModel  {

    @Column(nullable = false)
    private String content;

    private Double rating;
    
    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    @JoinColumn(nullable = false) // it is only applicable when you want to make join column specific value-- at here we check nullable is false
    private Booking booking;// we have defined a 1:1 relationship between booking and review

    @Override
    public String toString() {
        return "Review: " + this.content + " " + this.rating + " " + this.createdAt + " "+ this.booking;
    }

}