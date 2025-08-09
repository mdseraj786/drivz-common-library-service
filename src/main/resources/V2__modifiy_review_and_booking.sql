ALTER TABLE booking
DROP
FOREIGN KEY  booking_ibfk_3;

ALTER TABLE booking_review
    ADD booking_id BIGINT NULL;

ALTER TABLE booking_review
    ADD CONSTRAINT FOREIGN KEY (booking_id) REFERENCES booking (id);

ALTER TABLE booking
DROP
COLUMN review_id;