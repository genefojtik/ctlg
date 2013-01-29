// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.ContactRecord;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContactRecord_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ContactRecord.entityManager;
    
    public static final EntityManager ContactRecord.entityManager() {
        EntityManager em = new ContactRecord().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ContactRecord.countContactRecords() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ContactRecord o", Long.class).getSingleResult();
    }
    
    public static List<ContactRecord> ContactRecord.findAllContactRecords() {
        return entityManager().createQuery("SELECT o FROM ContactRecord o", ContactRecord.class).getResultList();
    }
    
    public static ContactRecord ContactRecord.findContactRecord(Long id) {
        if (id == null) return null;
        return entityManager().find(ContactRecord.class, id);
    }
    
    public static List<ContactRecord> ContactRecord.findContactRecordEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ContactRecord o", ContactRecord.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ContactRecord.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ContactRecord.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ContactRecord attached = ContactRecord.findContactRecord(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ContactRecord.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ContactRecord.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ContactRecord ContactRecord.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ContactRecord merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
