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
 * @author sawicky
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Tutor implements Serializable {
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;    
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "type")
    private String type;
    @XmlElement(name = "dob")
    private String dob;
    @XmlElement(name ="subject")
    private String subject;
    @XmlElement(name ="availability")
    private String availability;
    
    public Tutor() {
        super();
    }
    public Tutor(String name, String email, String password, String type, String dob, String subject, String availability) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.type = type;
        this.dob = dob;
        this.subject = subject;
        this.availability = availability;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
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
     * @return the availability
     */
    public String getAvailability() {
        return availability;
    }

    /**
     * @param availability the availability to set
     */
    public void setAvailability(String availability) {
        this.availability = availability;
    }
}
