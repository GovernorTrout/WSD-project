<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bookings.xsl
    Created on : 7 October 2017, 8:49 PM
    Author     : sawicky
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet exclude-results-prefixes="x" xmlns:x="http://www.uts.edu.au/31284/wsdtutor" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
<xsl:param name="bgColor"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                    background-color: lightgrey;
                    padding: 0px;
                    margin: auto;
                    }
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
                    #p2 {
                    font-family: helvetica;
                    font-size: 15px;
                    line-height: 90%;
                    text-align: center;
                    }	
                    table.results{
                    margin-left:auto;
                    margin-right:auto;
                    font-family:helvetica;
                    width: 500px;

                    }	
                    tr.results2{
                    background-color: #4A4A4A;
                    color: white;
                    text-align: center;
                    }			
                </style>
            </head>
            <body>
                <p id ="p2">Students List</p>
                <xsl:apply-templates />                
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="x:students">
        <table class ="results">
            <thead>
                <tr class ="results2">
                    <th>Student Name</th>
                    <th>Student Email</th>
                    <th>DOB</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="x:student">
        <tr class ="results2">

            <td>
                <xsl:value-of select="x:name" />
            </td> 
            <td>
                <xsl:value-of select="x:email" />
            </td> 
            <td>
                <xsl:value-of select="x:dob" />
            </td>             
        </tr>
    </xsl:template>
</xsl:stylesheet>
