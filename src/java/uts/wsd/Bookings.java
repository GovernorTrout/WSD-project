/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
/**
 *
 * @author sawicky
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings {
@XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();
 
    public ArrayList<Booking> getList() {
        return list;
    }
    public void addBooking(Booking booking) {
        list.add(booking);
    }
    public void removeBooking(Booking booking) {
        list.remove(booking);
    }
    public Booking getBooking(int id) {
        // For each booking in the list...
        if (id==01) {
            for (Booking booking : list) {
                return booking;
            }  
        }
        for (Booking booking : list) {
            if (booking.getId() == id )
                return booking; // Login correct. Return this booking.
        }
        return null; // Login incorrect. Return null.
    }
}