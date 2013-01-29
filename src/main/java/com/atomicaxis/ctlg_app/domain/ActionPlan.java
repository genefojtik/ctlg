package com.atomicaxis.ctlg_app.domain;

import javax.persistence.Column;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class ActionPlan {

    @ManyToOne
    private ContactRecord contactRecord;
    
    @Column(unique=true) String name;
  
}
