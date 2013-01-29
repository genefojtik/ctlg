package com.atomicaxis.ctlg_app;

import com.atomicaxis.ctlg_app.domain.ContactRecord;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = ContactRecord.class)
@Controller
@RequestMapping("/contactrecords")
@RooWebScaffold(path = "contactrecords", formBackingObject = ContactRecord.class)
public class ContactRecordController {
}
