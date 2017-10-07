package uts.wsd;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author sawicky
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(namespace="")
public class Booking implements Serializable {
    @XmlAttribute(name="id")
    private int id;
    @XmlElement(name="studentEmail")
    private String studentEmail;
    @XmlElement(name="studentName")
    private String studentName;
    @XmlElement(name="tutorEmail")
    private String tutorEmail;
    @XmlElement(name="tutorName")
    private String tutorName;    
    @XmlElement(name="subject")
    private String subject;
    @XmlElement(name="status")
    private String status;
    
    public Booking() {
        super();
    }
    public Booking(int id, String studentEmail, String studentName, String tutorEmail, String tutorName, String subject, String status) {
        this.id = id;
        this.studentEmail = studentEmail;
        this.studentName = studentName;
        this.tutorEmail = tutorEmail;
        this.tutorName = tutorName;       
        this.subject = subject;
        this.status = status;
     
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the studentEmail
     */
    public String getStudentEmail() {
        return studentEmail;
    }

    /**
     * @param studentEmail the studentEmail to set
     */
    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    /**
     * @return the studentName
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * @param studentName the studentName to set
     */
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    /**
     * @return the tutorEmail
     */
    public String getTutorEmail() {
        return tutorEmail;
    }

    /**
     * @param tutorEmail the tutorEmail to set
     */
    public void setTutorEmail(String tutorEmail) {
        this.tutorEmail = tutorEmail;
    }

    /**
     * @return the tutorName
     */
    public String getTutorName() {
        return tutorName;
    }

    /**
     * @param tutorName the tutorName to set
     */
    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
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
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
}
