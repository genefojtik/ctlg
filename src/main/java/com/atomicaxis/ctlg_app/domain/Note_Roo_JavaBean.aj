// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.ContactRecord;
import com.atomicaxis.ctlg_app.domain.Note;
import java.util.Date;

privileged aspect Note_Roo_JavaBean {
    
    public String Note.getNoteText() {
        return this.noteText;
    }
    
    public void Note.setNoteText(String noteText) {
        this.noteText = noteText;
    }
    
    public String Note.getAuthor() {
        return this.author;
    }
    
    public Date Note.getCreateDateTime() {
        return this.createDateTime;
    }
    
    public ContactRecord Note.getContactRecord() {
        return this.contactRecord;
    }
    
    public void Note.setContactRecord(ContactRecord contactRecord) {
        this.contactRecord = contactRecord;
    }
    
}
