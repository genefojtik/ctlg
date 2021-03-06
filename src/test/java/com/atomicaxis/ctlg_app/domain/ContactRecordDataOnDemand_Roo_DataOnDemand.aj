// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.common.LeadSource;
import com.atomicaxis.ctlg_app.common.LeadStatus;
import com.atomicaxis.ctlg_app.domain.ContactRecord;
import com.atomicaxis.ctlg_app.domain.ContactRecordDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ContactRecordDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContactRecordDataOnDemand: @Component;
    
    private Random ContactRecordDataOnDemand.rnd = new SecureRandom();
    
    private List<ContactRecord> ContactRecordDataOnDemand.data;
    
    public ContactRecord ContactRecordDataOnDemand.getNewTransientContactRecord(int index) {
        ContactRecord obj = new ContactRecord();
        setAddressLine1(obj, index);
        setCellPhone(obj, index);
        setCity(obj, index);
        setFirstName(obj, index);
        setFirstPersonEmailAddress(obj, index);
        setHomePhone(obj, index);
        setLastName(obj, index);
        setLeadSource(obj, index);
        setName(obj, index);
        setPartnerEmailAddress(obj, index);
        setPartnerFirstName(obj, index);
        setPartnerLastName(obj, index);
        setState(obj, index);
        setStatus(obj, index);
        setWorkPhone(obj, index);
        setZip(obj, index);
        return obj;
    }
    
    public void ContactRecordDataOnDemand.setAddressLine1(ContactRecord obj, int index) {
        String addressLine1 = "addressLine1_" + index;
        obj.setAddressLine1(addressLine1);
    }
    
    public void ContactRecordDataOnDemand.setCellPhone(ContactRecord obj, int index) {
        String cellPhone = "cellPhone_" + index;
        obj.setCellPhone(cellPhone);
    }
    
    public void ContactRecordDataOnDemand.setCity(ContactRecord obj, int index) {
        String city = "city_" + index;
        obj.setCity(city);
    }
    
    public void ContactRecordDataOnDemand.setFirstName(ContactRecord obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 30) {
            firstName = firstName.substring(0, 30);
        }
        obj.setFirstName(firstName);
    }
    
    public void ContactRecordDataOnDemand.setFirstPersonEmailAddress(ContactRecord obj, int index) {
        String firstPersonEmailAddress = "foo" + index + "@bar.com";
        obj.setFirstPersonEmailAddress(firstPersonEmailAddress);
    }
    
    public void ContactRecordDataOnDemand.setHomePhone(ContactRecord obj, int index) {
        String homePhone = "homePhone_" + index;
        obj.setHomePhone(homePhone);
    }
    
    public void ContactRecordDataOnDemand.setLastName(ContactRecord obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
    }
    
    public void ContactRecordDataOnDemand.setLeadSource(ContactRecord obj, int index) {
        LeadSource leadSource = LeadSource.class.getEnumConstants()[0];
        obj.setLeadSource(leadSource);
    }
    
    public void ContactRecordDataOnDemand.setName(ContactRecord obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ContactRecordDataOnDemand.setPartnerEmailAddress(ContactRecord obj, int index) {
        String partnerEmailAddress = "foo" + index + "@bar.com";
        obj.setPartnerEmailAddress(partnerEmailAddress);
    }
    
    public void ContactRecordDataOnDemand.setPartnerFirstName(ContactRecord obj, int index) {
        String partnerFirstName = "partnerFirstName_" + index;
        obj.setPartnerFirstName(partnerFirstName);
    }
    
    public void ContactRecordDataOnDemand.setPartnerLastName(ContactRecord obj, int index) {
        String partnerLastName = "partnerLastName_" + index;
        obj.setPartnerLastName(partnerLastName);
    }
    
    public void ContactRecordDataOnDemand.setState(ContactRecord obj, int index) {
        String state = "state_" + index;
        obj.setState(state);
    }
    
    public void ContactRecordDataOnDemand.setStatus(ContactRecord obj, int index) {
        LeadStatus status = LeadStatus.class.getEnumConstants()[0];
        obj.setStatus(status);
    }
    
    public void ContactRecordDataOnDemand.setWorkPhone(ContactRecord obj, int index) {
        String workPhone = "workPhone_" + index;
        obj.setWorkPhone(workPhone);
    }
    
    public void ContactRecordDataOnDemand.setZip(ContactRecord obj, int index) {
        Long zip = new Integer(index).longValue();
        obj.setZip(zip);
    }
    
    public ContactRecord ContactRecordDataOnDemand.getSpecificContactRecord(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ContactRecord obj = data.get(index);
        Long id = obj.getId();
        return ContactRecord.findContactRecord(id);
    }
    
    public ContactRecord ContactRecordDataOnDemand.getRandomContactRecord() {
        init();
        ContactRecord obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ContactRecord.findContactRecord(id);
    }
    
    public boolean ContactRecordDataOnDemand.modifyContactRecord(ContactRecord obj) {
        return false;
    }
    
    public void ContactRecordDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ContactRecord.findContactRecordEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ContactRecord' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ContactRecord>();
        for (int i = 0; i < 10; i++) {
            ContactRecord obj = getNewTransientContactRecord(i);
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
