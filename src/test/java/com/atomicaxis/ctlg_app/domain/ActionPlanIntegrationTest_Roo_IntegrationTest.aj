// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atomicaxis.ctlg_app.domain;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ActionPlanDataOnDemand;
import com.atomicaxis.ctlg_app.domain.ActionPlanIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ActionPlanIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ActionPlanIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ActionPlanIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ActionPlanIntegrationTest: @Transactional;
    
    @Autowired
    ActionPlanDataOnDemand ActionPlanIntegrationTest.dod;
    
    @Test
    public void ActionPlanIntegrationTest.testCountActionPlans() {
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", dod.getRandomActionPlan());
        long count = ActionPlan.countActionPlans();
        Assert.assertTrue("Counter for 'ActionPlan' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ActionPlanIntegrationTest.testFindActionPlan() {
        ActionPlan obj = dod.getRandomActionPlan();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to provide an identifier", id);
        obj = ActionPlan.findActionPlan(id);
        Assert.assertNotNull("Find method for 'ActionPlan' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ActionPlan' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ActionPlanIntegrationTest.testFindAllActionPlans() {
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", dod.getRandomActionPlan());
        long count = ActionPlan.countActionPlans();
        Assert.assertTrue("Too expensive to perform a find all test for 'ActionPlan', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ActionPlan> result = ActionPlan.findAllActionPlans();
        Assert.assertNotNull("Find all method for 'ActionPlan' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ActionPlan' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ActionPlanIntegrationTest.testFindActionPlanEntries() {
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", dod.getRandomActionPlan());
        long count = ActionPlan.countActionPlans();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ActionPlan> result = ActionPlan.findActionPlanEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ActionPlan' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ActionPlan' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ActionPlanIntegrationTest.testFlush() {
        ActionPlan obj = dod.getRandomActionPlan();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to provide an identifier", id);
        obj = ActionPlan.findActionPlan(id);
        Assert.assertNotNull("Find method for 'ActionPlan' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyActionPlan(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ActionPlan' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ActionPlanIntegrationTest.testMergeUpdate() {
        ActionPlan obj = dod.getRandomActionPlan();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to provide an identifier", id);
        obj = ActionPlan.findActionPlan(id);
        boolean modified =  dod.modifyActionPlan(obj);
        Integer currentVersion = obj.getVersion();
        ActionPlan merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ActionPlan' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ActionPlanIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", dod.getRandomActionPlan());
        ActionPlan obj = dod.getNewTransientActionPlan(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ActionPlan' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ActionPlan' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ActionPlanIntegrationTest.testRemove() {
        ActionPlan obj = dod.getRandomActionPlan();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActionPlan' failed to provide an identifier", id);
        obj = ActionPlan.findActionPlan(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ActionPlan' with identifier '" + id + "'", ActionPlan.findActionPlan(id));
    }
    
}
