/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;

/**
 *
 * @author sawicky
 */
public class BookingApplication {
    private String filePath;
    private Bookings bookings;
    
    public BookingApplication() {
        
    }

    /**
     * @return the filePath
     */
    public String getFilePath() {
        return filePath;
    }
   /**
     * @param filePath
     * @throws javax.xml.bind.JAXBException
     * @throws java.io.FileNotFoundException
     */
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
    public void updateBookings(Bookings bookings, String filePath) throws Exception {
        this.bookings = bookings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }
    public void saveBookings() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }

    /**
     * @return the bookings
     */
    public Bookings getBookings() {
        return bookings;
    }

    /**
     * @param bookings the bookings to set
     */
    public void setBookings(Bookings bookings) {
        this.bookings = bookings;
    }
    
    
}
