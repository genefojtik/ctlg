// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.common.ActionStatus;
import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ActionPlanDataOnDemand;
import com.atomicaxis.ctlg_app.domain.ContactRecordDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ActionPlanDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ActionPlanDataOnDemand: @Component;
    
    private Random ActionPlanDataOnDemand.rnd = new SecureRandom();
    
    private List<ActionPlan> ActionPlanDataOnDemand.data;
    
    @Autowired
    ContactRecordDataOnDemand ActionPlanDataOnDemand.contactRecordDataOnDemand;
    
    public ActionPlan ActionPlanDataOnDemand.getNewTransientActionPlan(int index) {
        ActionPlan obj = new ActionPlan();
        setCreated(obj, index);
        setDueDate(obj, index);
        setStatus(obj, index);
        setTitle(obj, index);
        setUpdated(obj, index);
        return obj;
    }
    
    public void ActionPlanDataOnDemand.setCreated(ActionPlan obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }
    
    public void ActionPlanDataOnDemand.setDueDate(ActionPlan obj, int index) {
        Date dueDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDueDate(dueDate);
    }
    
    public void ActionPlanDataOnDemand.setStatus(ActionPlan obj, int index) {
        ActionStatus status = ActionStatus.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public void ActionPlanDataOnDemand.setTitle(ActionPlan obj, int index) {
        String title = "title_" + index;
        obj.setTitle(title);
    }
    
    public void ActionPlanDataOnDemand.setUpdated(ActionPlan obj, int index) {
        Date updated = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdated(updated);
    }
    
    public ActionPlan ActionPlanDataOnDemand.getSpecificActionPlan(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ActionPlan obj = data.get(index);
        Long id = obj.getId();
        return ActionPlan.findActionPlan(id);
    }
    
    public ActionPlan ActionPlanDataOnDemand.getRandomActionPlan() {
        init();
        ActionPlan obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ActionPlan.findActionPlan(id);
    }
    
    public boolean ActionPlanDataOnDemand.modifyActionPlan(ActionPlan obj) {
        return false;
    }
    
    public void ActionPlanDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ActionPlan.findActionPlanEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ActionPlan' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ActionPlan>();
        for (int i = 0; i < 10; i++) {
            ActionPlan obj = getNewTransientActionPlan(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
