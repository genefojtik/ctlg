// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.MarketingData;
import com.atomicaxis.ctlg_app.domain.MarketingDataDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect MarketingDataDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MarketingDataDataOnDemand: @Component;
    
    private Random MarketingDataDataOnDemand.rnd = new SecureRandom();
    
    private List<MarketingData> MarketingDataDataOnDemand.data;
    
    public MarketingData MarketingDataDataOnDemand.getNewTransientMarketingData(int index) {
        MarketingData obj = new MarketingData();
        return obj;
    }
    
    public MarketingData MarketingDataDataOnDemand.getSpecificMarketingData(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        MarketingData obj = data.get(index);
        Long id = obj.getId();
        return MarketingData.findMarketingData(id);
    }
    
    public MarketingData MarketingDataDataOnDemand.getRandomMarketingData() {
        init();
        MarketingData obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return MarketingData.findMarketingData(id);
    }
    
    public boolean MarketingDataDataOnDemand.modifyMarketingData(MarketingData obj) {
        return false;
    }
    
    public void MarketingDataDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = MarketingData.findMarketingDataEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'MarketingData' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<MarketingData>();
        for (int i = 0; i < 10; i++) {
            MarketingData obj = getNewTransientMarketingData(i);
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
