package com.atomicaxis.ctlg_app;

import com.atomicaxis.ctlg_app.domain.ActionPlan;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = ActionPlan.class)
@Controller
@RequestMapping("/actionplans")
@RooWebScaffold(path = "actionplans", formBackingObject = ActionPlan.class)
public class ActionPlanController {
}
