package com.atomicaxis.ctlg_app.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ContactRecord;
import flexjson.JSONSerializer;


@RequestMapping("/services/**")
@Controller
public class PublicAPI {

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    @RequestMapping
    public String index() {
        return "service/index";
    }
    
    @RequestMapping(value = "/contactrecord", headers = "Accept=application/json", produces="application/json")
    @ResponseBody
    public ResponseEntity<String> getContactRecord(){
    	HttpHeaders headers = new HttpHeaders();
    	List<ContactRecord> result = ContactRecord.findAllContactRecords();
		return new ResponseEntity<String>(ContactRecord.toJsonArray(result), HttpStatus.OK);
    }
    
}
