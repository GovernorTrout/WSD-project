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
 * @author Proma
 */
public class StudentApplication {
    private String filePath;
    private Students students;
    
    public StudentApplication(){
        
    }
    /**
     * @return the filepath
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
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        students = (Students)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
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
    public void saveStudents() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
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
