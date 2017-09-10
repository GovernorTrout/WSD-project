/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.wsd;
import javax.xml.bind.annotation.*;
 
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
/**
 *
 * @author 12962181
 */
public class Circle {
    private double radius;
    private double diameter;
    private double area;
    private double circumference;

    /**
     * @return the radius
     */
    public Circle(){
        super();
    }
    public Circle(double radius){
        this.radius = radius;
    }
    public double getRadius() {
        return radius;
    }

    /**
     * @param radius the radius to set
     */
    public void setRadius(double radius) {
        this.radius = radius;
    }

    /**
     * @return the diameter
     */
    public double getDiameter() {
        return radius*2;
    }

    /**
     * @param diameter the diameter to set
     */
    public void setDiameter(double diameter) {
        this.diameter = diameter;
    }

    /**
     * @return the area
     */
    public double getArea() {
        return Math.PI * radius*radius;
    }

    /**
     * @param area the area to set
     */
    public void setArea(double area) {
        this.area = area;
    }

    /**
     * @return the circumference
     */
    public double getCircumference() {
        return 2*Math.PI*radius;
    }

    /**
     * @param circumference the circumference to set
     */
    public void setCircumference(double circumference) {
        this.circumference = circumference;
    }
    
}
