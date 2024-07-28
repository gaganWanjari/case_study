package model;

public class Passenger {
    private String pnr;
    private String name;
    private String gender;
    private int age;
    private String origin;
    private String destination;
    private double ticketPrice;
    private int trainNumber;

    public Passenger(String pnr, String name, String gender, int age, String origin, String destination, double ticketPrice, int trainNumber) {
        this.pnr = pnr;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.origin = origin;
        this.destination = destination;
        this.ticketPrice = ticketPrice;
        this.trainNumber = trainNumber;
    }

    // Getters and Setters
    public String getPnr() {
        return pnr;
    }

    public void setPnr(String pnr) {
        this.pnr = pnr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(int trainNumber) {
        this.trainNumber = trainNumber;
    }
}
