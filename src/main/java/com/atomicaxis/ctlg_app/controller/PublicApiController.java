/*
 * PublicApiController
 * 
 * Company: Atomic Axis
 *
 * Author:
 * Gene Fojtik
 *
 * Date:
 * 20120131
 */

package com.atomicaxis.ctlg_app.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ContactRecord;
import flexjson.JSONSerializer;

/**
 * This controller handles all RESTful requests GET/POST/PUT/DELETE on 
 * the ContactRecord Entity, including it's child objects 
 * 
 */
@RequestMapping("/services")
@Controller
public class PublicApiController {

    @RequestMapping
    public String index() {
         	
    	return "service/index"; 
    }
    
    /**
	 * This method returns the a JSONArray of all ContactRecords and it's child objects
	 */
    @RequestMapping(value = "/contactrecord", headers = "Accept=application/json", produces="application/json")
    @ResponseBody
    public ResponseEntity<String> getContactRecord(){
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Access-Control-Allow-Origin", "*");
    	List<ContactRecord> result = ContactRecord.findAllContactRecords();
		return new ResponseEntity<String>(ContactRecord.toJsonArray(result), headers, HttpStatus.OK);
		
    }
    
    /**
	 * This method returns JSON of the specified contactRecordId and it's child objects
	 */
    @RequestMapping(value = "/contactrecord/{id}", headers = "Accept=application/json", produces="application/json")
    @ResponseBody
    public ResponseEntity<String> getContactRecordByID(@PathVariable("id") Long id){
    	ContactRecord contactRecord = ContactRecord.findContactRecord(id);
        HttpHeaders headers = new HttpHeaders();
    	headers.add("Access-Control-Allow-Origin", "*");
    	headers.add("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (contactRecord == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(contactRecord.toJson(), headers, HttpStatus.OK);
    }   
    
    /**
	 * This method accepts POST requests againts the contactRecord to create a new contactRecord
	 */
   
    @RequestMapping(value ="/contactrecord", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createContactRecord(@RequestBody String json) {
        ContactRecord contactRecord = ContactRecord.fromJsonToContactRecord(json);
        contactRecord.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    /**
	 * This method accepts POST requests to create multiple contactRecords
	 */
    @RequestMapping(value = "/contactrecord/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createContactRecordFromJsonArray(@RequestBody String json) {
        for (ContactRecord contactRecord: ContactRecord.fromJsonArrayToContactRecords(json)) {
            contactRecord.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    /**
	 * This method accepts POST requests to get the action plans for a specific contactRecord
	 */
	@RequestMapping(value = "/contactrecord/{id}/actionplans", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> getActionPlansByContactRecordId(@PathVariable("id") Long id) {
    	ContactRecord contactRecord = ContactRecord.findContactRecord(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ActionPlan.toJsonArrayShallow(ActionPlan.findActionPlansByContactRecord(contactRecord).getResultList()), headers, HttpStatus.OK);
    }
	
	/**
	 * This method accepts PUT requests to delete the contractRecord
	 */
    @RequestMapping(value = "/contactrecord/{id}",method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateContactRecord(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
    	ContactRecord contactRecord = ContactRecord.fromJsonToContactRecord(json);
        if (contactRecord.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
	
	
	/**
	 * This method accepts DELETE requests to delete the contractRecord
	 */
	@RequestMapping(value = "/contactrecord/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteFromJson(@PathVariable("id") Long id) {
        ContactRecord contactRecord = ContactRecord.findContactRecord(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (contactRecord == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        contactRecord.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
}
