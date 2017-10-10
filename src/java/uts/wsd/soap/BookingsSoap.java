/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import uts.wsd.*;


@WebService(serviceName = "bookingApp")
public class BookingsSoap {
    private Tutors tutors;
    private Bookings bookings;
    private Students students;
    private String filePath;

    @Resource
    private WebServiceContext context;
   
    private BookingApplication getBookingApp() throws JAXBException, IOException, Exception {
         ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);

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
    public StudentApplication getStudentApp() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            StudentApplication studentApp = (StudentApplication) application.getAttribute("studentApp");
            if (studentApp == null) {
                studentApp = new StudentApplication();
                studentApp.setFilePath(application.getRealPath("WEB-INF/students.xml"));
                application.setAttribute("studentApp", studentApp);
            }
            return studentApp;
        }
    }
    public TutorApplication getTutorApp() throws JAXBException, IOException, Exception {
        ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        synchronized (application) {
            TutorApplication tutorApp = (TutorApplication) application.getAttribute("tutorApp");
            if (tutorApp == null) {
                tutorApp = new TutorApplication();
                tutorApp.setFilePath(application.getRealPath("WEB-INF/tutors.xml"));
                application.setAttribute("tutorApp", tutorApp);
            }
            return tutorApp;
        }
    }
    /**
     * This is a sample web service operation
     * @param txt
     * @return 
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    
    @WebMethod
    public Bookings displayBookings() throws IOException, Exception{
        return getBookingApp().getBookings();
    }
    @WebMethod
    public ArrayList<Booking> getBookingsList() throws IOException, Exception{
        return getBookingApp().getBookings().getList();
    }
    
    @WebMethod
    public String getFilePath() throws IOException, Exception{
        return  getBookingApp().getFilePath();
    }
    @WebMethod
    public Students getStudents() throws IOException, Exception {
        return getStudentApp().getStudents();  
    }
    public Tutors getTutors() throws IOException, Exception {
        return getTutorApp().getTutors();  
    }
    public ArrayList<Tutor> getTutorsList() throws IOException, Exception {
        return getTutorApp().getTutors().getList();  
    }
    @WebMethod
    public Tutor getTutor(@WebParam(name="email")String email) throws Exception {
        // For each tutor in the list...
        for (Tutor tutor : getTutorsList()) {
            if (tutor.getEmail().equals(email) )
                return tutor; // Login correct. Return this tutor.
        }
        return null; // Login incorrect. Return null.
    }
    @WebMethod
    public void updateTutors(@WebParam(name="tutors")Tutors tutors, @WebParam(name="filepath")String filePath) throws Exception {
        this.tutors = tutors;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    @WebMethod
    public void updateStudents(Students students, String filePath) throws Exception {
        this.students = students;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
    @WebMethod
    public Booking createBooking(@WebParam(name="id") int id, String studentEmail, String studentName, String tutorEmail, String tutorName, String subject, String status){
        Booking b = new Booking(id, studentEmail, studentName, tutorEmail, tutorName, subject, status);
        return b;
    }
    @WebMethod
    public void updateBookings(@WebParam(name="bookings")Bookings bookings, @WebParam(name="filepath")String filePath) throws Exception {
        this.bookings = bookings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }
    @WebMethod
    public Student sLogin(String email, String password) throws Exception {
        for (Student student : getStudents().getList()) {
            if (student.getEmail().equals(email) && student.getPassword().equals(password))
                return student; // Login correct. Return this student.
        }
        return null; // Login incorrect. Return null.
    }
    public Tutor tLogin(String email, String password) throws Exception {
        for (Tutor tutor : getTutors().getList()) {
                if (tutor.getEmail().equals(email) && tutor.getPassword().equals(password))
                    return tutor; // Login correct. Return this tutor.
            }
            return null;
    }
    public void logout(Student student, Tutor tutor) {
        student=null;
        tutor=null;
    }
}
