/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap.client;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.*;
import javax.xml.bind.JAXBException;
import uts.wsd.*;

/**
 *
 * @author sawicky
 */
public class BookingClient {
 
     public static void main(String[] args) throws Exception_Exception, IOException_Exception, JAXBException, JAXBException_Exception{
         
        Student student = null;
        Tutor tutor = null;
        Students students = null;
        Tutors tutors = null;
        BookingApp locator = new BookingApp();
        BookingsSoap bapp = locator.getBookingsSoapPort();
        StudentApplication sapp = bapp.getStudentApp();
        TutorApplication tapp = bapp.getTutorApp();
        Scanner in = new Scanner (System.in);
        System.out.println("Please login");
        while (tutor==null && student==null) 
        {
            System.out.print("Email : ");
            String email = in.nextLine();
            System.out.print("Password :");
            String pass = in.nextLine();
            student = bapp.sLogin(email, pass);
            tutor = bapp.tLogin(email, pass);
        }
        if (tutor!=null || student!=null) {
            if (student!=null) {
                System.out.println("Welcome Student "+student.getName());
            }
            else if (tutor!=null) {
                System.out.println("Welcome Tutor "+tutor.getName());
            }
            System.out.println("Please select an option");
            System.out.println("1. View bookings");
            System.out.println("2. Create a booking");
            System.out.println("3. Cancel a booking");
            System.out.println("4. Cancel account");
            if (tutor!=null) {
                System.out.println("5. Complete a booking");
            }
            System.out.println("0. Exit application");
            Bookings bookings = bapp.displayBookings();
            int input = -1;
            while (input!=0) {
                input = in.nextInt();
                switch(input) {
                    case 1:
                        for (Booking b : bookings.getBooking()) {
                            System.out.println("################## Booking ID: "+b.getId()+ " ##################");
                            System.out.println("Student Email: "+b.getStudentEmail()+"\nStudent Name: "+b.getStudentName()+"\nTutor Email: "+b.getTutorEmail()+"\nTutor Name: "+b.getTutorName()+"\nStatus: "+b.getStatus());
                        }
                        menu(tutor);
                        break;
                    case 2:
                        if (tutor!=null) {
                            System.out.println("Enter a student name to book");
                            String name = in.next();
                            for (Student s : bapp.getStudents().getStudent()) {
                                if (name.equals(s.getName())) {
                                    System.out.println("Found student with the name: "+name);
                                    System.out.println("Students email: "+s.getEmail());
                                    if (tutor.getAvailability().equals("Available")) {
                                        int id = 0;
                                        for (Booking bs : bookings.getBooking()) {
                                            if (id == bs.getId()) {
                                                id++;
                                            }
                                        }
                                        Tutors t = bapp.getTutors();
                                        Bookings b = bapp.displayBookings();
                                        tutor.setAvailability("Unavailable");
                                        bapp.updateTutors(t, tapp.getFilePath());
                                        bapp.updateBookings(b, bapp.getFilePath());
                                    }  else {
                                        System.out.println("You are unavailable!");
                                        System.out.println();
                                        menu(tutor);
                                    }
                                }
                            }
                        } else if (student!=null) {
                            System.out.println("Enter a tutor name to book");
                            String name = in.next();
                            for (Tutor t : bapp.getTutors().getTutor()) {
                                if (name.equals(t.getName())) {
                                    System.out.println("Found tutor with the name: "+name);
                                    System.out.println("Tutors email: "+t.getEmail());
                                    if (tutor.getAvailability().equals("Available")) {
                                        int id = 0;
                                        for (Booking bs : bookings.getBooking()) {
                                            if (id == bs.getId()) {
                                                id++;
                                            }
                                        }
                                        Tutors ts = bapp.getTutors();
                                        Bookings b = bapp.displayBookings();
                                        tutor.setAvailability("Unavailable");
                                        bapp.updateTutors(ts, tapp.getFilePath());
                                        bapp.updateBookings(b, bapp.getFilePath());
                                    }  else {
                                        System.out.println("Tutor is unavailable!");
                                        System.out.println();
                                        menu(tutor);
                                    }  
                                }
                            }
                        }
                        break;
                }
            }
        }
    }
        public static void menu(Tutor t) {
        System.out.println("Please select an option");
        System.out.println("1. View bookings");
        System.out.println("2. Create a booking");
        System.out.println("3. Cancel a booking");
        System.out.println("4. Cancel account");
        if (t!=null) {
            System.out.println("5. Complete a booking");
        }
        System.out.println("0. Exit application");
    }
}
