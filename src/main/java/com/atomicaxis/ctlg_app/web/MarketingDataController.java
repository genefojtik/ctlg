package com.atomicaxis.ctlg_app.web;

import com.atomicaxis.ctlg_app.domain.MarketingData;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = MarketingData.class)
@Controller
@RequestMapping("/marketingdatas")
@RooWebScaffold(path = "marketingdatas", formBackingObject = MarketingData.class)
public class MarketingDataController {
}
