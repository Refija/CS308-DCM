package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.journaldev.spring.model.Operation;
import com.journaldev.spring.service.OperationService;

@Controller
public class FirstController {

	@RequestMapping(value= "/", method = RequestMethod.GET)
	public String home() {
        return "home";
    }
	
	@RequestMapping(value= "/test", method = RequestMethod.GET)
	public String testmap() {
        return "test";
    }
	@RequestMapping(value= "/login", method = RequestMethod.GET)
	public String logon() {
        return "login";
    }
	@RequestMapping(value= "/about", method = RequestMethod.GET)
	public String about() {
        return "about";
    }
	
}
