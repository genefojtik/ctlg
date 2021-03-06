// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.MarketingData;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MarketingData_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager MarketingData.entityManager;
    
    public static final EntityManager MarketingData.entityManager() {
        EntityManager em = new MarketingData().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MarketingData.countMarketingDatas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MarketingData o", Long.class).getSingleResult();
    }
    
    public static List<MarketingData> MarketingData.findAllMarketingDatas() {
        return entityManager().createQuery("SELECT o FROM MarketingData o", MarketingData.class).getResultList();
    }
    
    public static MarketingData MarketingData.findMarketingData(Long id) {
        if (id == null) return null;
        return entityManager().find(MarketingData.class, id);
    }
    
    public static List<MarketingData> MarketingData.findMarketingDataEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MarketingData o", MarketingData.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void MarketingData.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MarketingData.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MarketingData attached = MarketingData.findMarketingData(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MarketingData.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void MarketingData.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public MarketingData MarketingData.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MarketingData merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
