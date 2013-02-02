package com.atomicaxis.ctlg_app.web;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import com.atomicaxis.ctlg_app.domain.ContactRecord;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RooWebJson(jsonObject = ActionPlan.class)
@Controller
@RequestMapping("/actionplans")
@RooWebScaffold(path = "actionplans", formBackingObject = ActionPlan.class)
public class ActionPlanController {

	@RequestMapping(params = "find=ByContactRecord", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> jsonFindActionPlansByContactRecord(@RequestParam("contactRecord") ContactRecord contactRecord) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(ActionPlan.toJsonArray(ActionPlan.findActionPlansByContactRecord(contactRecord).getResultList()), headers, HttpStatus.OK);
    }
}
