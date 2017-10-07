<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bookings.xsl
    Created on : 7 October 2017, 8:49 PM
    Author     : sawicky
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
<xsl:param name="bgColor"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table{
                    width:30%;
                    }
                    th, td {
                    text-align:left;
                    padding: 8px;
                    
                    }
                    th {
                    background-color: #4CAF50;
                    color: white;
                    font-weight:bold;
                    }
                    h2,p{
                    background-color: #4CAF50;
                    width:30%;
                    font-weight:bold;
                    }					
                </style>
            </head>
            <body>
                <p>Bookings List:</p>
                <xsl:apply-templates />                
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="bookings">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student Email</th>
                    <th>Student Name</th>
                    <th>Tutor Email</th>
                    <th>Tutor Name</th>
                    <th>Subject</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="booking">
        <tr>
            <td>
                <xsl:value-of select="@id" />
            </td>
            <td>
                <xsl:value-of select="studentEmail" />
            </td>  
            <td>
                <xsl:value-of select="studentName" />
            </td>  
            <td>
                <xsl:value-of select="tutorEmail" />
            </td> 
            <td>
                <xsl:value-of select="tutorName" />
            </td> 
            <td>
                <xsl:value-of select="subject" />
            </td> 
            <td>
                <xsl:value-of select="status" />
            </td>             
        </tr>
    </xsl:template>
</xsl:stylesheet>
