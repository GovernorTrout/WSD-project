/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author sawicky
 */
import java.util.*;
import java.io.*;
import javax.xml.bind.*;
public class UserApplication implements Serializable{
    private String filePathStudent;
    private String filePathTutor;
    private Tutors tutors;
    private Students students;
    private Users users;
    public UserApplication()
    { 
    
    }
    public UserApplication(String filePathTutor, String filePathStudent, Users users){
        super();
        this.filePathTutor = filePathTutor;
        this.filePathStudent = filePathStudent;
        this.users = users;
        
    }

    /**
     * @return the filePath
     */
    public String getFilePathStudent() {
        return filePathStudent;
    }
       public String getFilePathTutor() {
        return filePathTutor;
    }

    /**
     * @param filePath the filePath to set
     */
 public void setFilePathStudent(String filePathStudent) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        this.filePathStudent = filePathStudent;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePathStudent);
        setUsers((Users)u.unmarshal(fin)); // This loads the "shop" object
        fin.close();
    }
  public void setFilePathTutor(String filePathTutor) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        this.filePathTutor = filePathTutor;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePathTutor);
        setUsers((Users)u.unmarshal(fin)); // This loads the "shop" object
        fin.close();
    }
    public void updateTutors(Users users, String filePathTutor) throws Exception {
        this.users = users;
        this.filePathTutor = filePathTutor;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePathTutor);
        m.marshal(users, fout);
        fout.close();
    }
        public void updateStudents(Users users, String filePathStudent) throws Exception {
        this.users = users;
        this.filePathStudent = filePathStudent;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePathStudent);
        m.marshal(users, fout);
        fout.close();
    }
        public void saveUsersStudent(String filePathStudent) throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePathStudent);
        m.marshal(users, fout);
        fout.close();
    }
        public void saveUsersTutor(String filePathTutir) throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePathTutor);
        m.marshal(users, fout);
        fout.close();
    }


    /**
     * @return the tutors
     */
    public Tutors getTutors() {
        return tutors;
    }

    /**
     * @param tutors the tutors to set
     */
    public void setTutors(Tutors tutors) {
        this.tutors = tutors;
    }

    /**
     * @return the students
     */
    public Students getStudents() {
        return students;
    }

    /**
     * @param students the students to set
     */
    public void setStudents(Students students) {
        this.students = students;
    }

    /**
     * @return the users
     */
    public Users getUsers() {
        return users;
    }

    /**
     * @param users the users to set
     */
    public void setUsers(Users users) {
        this.users = users;
    }
    
}
