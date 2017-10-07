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
public class TutorApplication {
    private String filePath;
    private Tutors tutors;
    
    public TutorApplication(){
        
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
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Unmarshaller u = jc.createUnmarshaller();
 
// Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        tutors = (Tutors)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }
    public void updateTutors(Tutors tutors, String filePath) throws Exception {
        this.tutors = tutors;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
    public void saveTutors() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
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
    
}
