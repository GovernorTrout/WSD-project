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
public class UserApplication {
    private String filePath;
    private Tutors tutors;
    private Students students;
    public UserApplication(){
        
    }

    /**
     * @return the filePath
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * @param filePath the filePath to set
     */
 public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        // Create the unmarshaller
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        users = (Users)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
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
    
}
