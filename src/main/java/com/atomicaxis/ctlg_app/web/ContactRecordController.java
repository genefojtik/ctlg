package com.atomicaxis.ctlg_app.web;

import com.atomicaxis.ctlg_app.domain.ContactRecord;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebJson(jsonObject = ContactRecord.class)
@Controller
@RequestMapping("/contactrecords")
@RooWebScaffold(path = "contactrecords", formBackingObject = ContactRecord.class)
public class ContactRecordController {

}
