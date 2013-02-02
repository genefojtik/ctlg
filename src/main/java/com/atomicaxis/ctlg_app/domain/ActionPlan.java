/*
 * Action Plan Entity
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

import com.atomicaxis.ctlg_app.common.ActionStatus;
import flexjson.JSONSerializer;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findActionPlansByContactRecord" })
public class ActionPlan {

    @ManyToOne
    private ContactRecord contactRecord;

    private String title;

    @Enumerated
    private ActionStatus status;

    @DateTimeFormat(style = "M-")
    private Date created;
    
    @DateTimeFormat(style = "M-")
    private Date updated;
    
    @PreUpdate
    @Column(nullable = false, insertable = false)
    protected void onUpdate() {
       updated = new Date();
    }
    
    @DateTimeFormat(style = "M-")
    private Date dueDate;

    public ActionPlan() {
       java.util.Date date = new java.util.Date();
       this.setCreated(new Timestamp(date.getTime()));
    }

    public static String toJsonArrayShallow(Collection<com.atomicaxis.ctlg_app.domain.ActionPlan> collection) {
        return new JSONSerializer().exclude("*.class", "contactRecord").serialize(collection);
    }
}
