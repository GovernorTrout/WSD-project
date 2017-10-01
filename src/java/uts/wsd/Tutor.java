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
public class Tutor {
    private String name;
    private String email;
    private String password;
    private int dob;
    private String subject;
    
    public Tutor(){
        super();
    }
    public Tutor(String name, String email, String password, int dob, String subject){
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.subject = subject;
    }
    
}
