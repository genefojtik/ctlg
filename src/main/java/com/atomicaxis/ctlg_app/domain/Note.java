/*
 * Note Entity
 * 
 * Company: Atomic Axis
 *
 * Author:
 * Gene Fojtik
 *
 * Date:
 * 20120131
 */


package com.atomicaxis.ctlg_app.domain;

import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Note {

    @NotNull
    private String noteText;

    @NotNull
    private String author;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createDateTime;

    @ManyToOne
    private ContactRecord contactRecord;
    
    public Note(){
    	
    	//Set the note creation time
    	java.util.Date date= new java.util.Date();
    	this.setCreateDateTime(new Timestamp(date.getTime()));
    	
    	//Set the author (hard coded for now)
    	this.setAuthor("Gene Fojtik");
    	
    }
    
	public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

	public void setAuthor(String author) {
        this.author = author;
    }
}
