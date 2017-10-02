/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Proma
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable {
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name; 
    @XmlElement(name = "password")
    private String password;  
    @XmlElement(name = "dob")
    private String dob;
    @XmlElement(name = "type")
    private String type;
    @XmlElement(name ="subject")
    private String subject;


    
    
     
    public User(){
       
    }
        public User(String email, String name, String password, String dob, String type) {
        
        this.email = email;
        this.name = name;
        this.password = password;
        this.type = type;
        this.dob = dob;
    }

    public User(String email, String name, String password, String dob, String type, String subject) {
        
        this.email = email;
        this.name = name;
        this.password = password;
        this.type = type;
        this.subject = subject; 
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

}

