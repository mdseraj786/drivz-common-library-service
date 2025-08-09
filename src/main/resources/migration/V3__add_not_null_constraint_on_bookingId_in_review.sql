ALTER table booking_review
    ADD CONSTRAINT un_booking_review_booking_id UNIQUE(booking_id);
    
Alter table booking_review
    Modify booking_id BIGINT not null;