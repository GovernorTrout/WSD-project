/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import uts.wsd.Circle;
import uts.wsd.Rectangle;

/**
 *
 * @author 12962181
 */
@Path("/geometry")
public class GeometryService {

@Path("hello")
@GET
@Produces(MediaType.TEXT_PLAIN)
public String hello() {
 return "Hello World";
}
@Path("rectangle")
@GET
@Produces(MediaType.APPLICATION_XML)
public Rectangle rectangle(@QueryParam("width") double width, @QueryParam("height") double height) {
 return new Rectangle(width, height);
         }
@Path("circle")
@GET
@Produces(MediaType.APPLICATION_XML)
public Circle circle(@QueryParam("radius") double radius) {
 return new Circle(radius);
         }
    
    
}
