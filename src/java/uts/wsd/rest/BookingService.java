/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.wsd.*;

/**
 *
 * @author sawicky
 */
@WebService(serviceName = "BookingService")
@Path("/bookingApp")
public class BookingService {
    @Context
    private ServletContext application;
    private BookingApplication getBookingApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            BookingApplication bookingApp = (BookingApplication) application.getAttribute("bookingApp");
            if (bookingApp == null) {
                bookingApp = new BookingApplication();
                bookingApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingApp", bookingApp);
            }
            return bookingApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTS";
    }
    
    @Path("bookings")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Bookings getBookings() throws JAXBException, IOException, Exception{
        return getBookingApp().getBookings();
    }
    @Path("bookings/{ID}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Booking getBooking(@QueryParam("id") int ID) throws JAXBException, IOException, Exception{
        return getBookingApp().getBookings().getBooking(ID);
    }
    @Path("bookings//{studentname}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Bookings getBooking(@QueryParam("studentname") String name) throws JAXBException, IOException, Exception{
        Bookings temp = null;
        for (Booking b : getBookingApp().getBookings().getList()) {
            if (name.equals(b.getStudentName())) {
                temp.addBooking(b);    
            }
        }
        return temp;
            
        }
    }

