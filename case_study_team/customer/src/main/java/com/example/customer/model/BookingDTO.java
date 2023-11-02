package com.example.customer.model;

import java.sql.Date;

public class Booking {
    private int bookingId;
    private String bookingCode;
    private Pet pet;
    private Employee employee;
    private Date startTime;
    private Date endTime;
    private Status status;

    public Booking(String bookingCode, Pet pet, Date startTime, Date endTime, Status status) {
        this.bookingCode = bookingCode;
        this.pet = pet;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getBookingCode() {
        return bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
