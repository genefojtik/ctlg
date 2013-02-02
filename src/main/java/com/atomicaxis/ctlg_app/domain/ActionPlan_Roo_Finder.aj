// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ContactRecord;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ActionPlan_Roo_Finder {
    
    public static TypedQuery<ActionPlan> ActionPlan.findActionPlansByContactRecord(ContactRecord contactRecord) {
        if (contactRecord == null) throw new IllegalArgumentException("The contactRecord argument is required");
        EntityManager em = ActionPlan.entityManager();
        TypedQuery<ActionPlan> q = em.createQuery("SELECT o FROM ActionPlan AS o WHERE o.contactRecord = :contactRecord", ActionPlan.class);
        q.setParameter("contactRecord", contactRecord);
        return q;
    }
    
}