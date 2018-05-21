package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.auth.service.SecurityService;
import com.journaldev.spring.model.Operation;
import com.journaldev.spring.model.User;
import com.journaldev.spring.service.OperationService;

@Controller
public class FirstController {

	@Autowired
    private SecurityService SecurityService;

	@RequestMapping(value= "/", method = RequestMethod.GET)
	public String home() {
        return "home";
    }
	
	@RequestMapping(value= "/test", method = RequestMethod.GET)
	public String testmap() {
        return "test";
    }
	@RequestMapping(value= "/login", method = RequestMethod.GET)
	public String login() {
        return "login";
    }
	@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("userForm") User userForm) {
		SecurityService.autologin(userForm.getUsername(), userForm.getPassword());

        return "redirect:/home";
    }
	@RequestMapping(value= "/about", method = RequestMethod.GET)
	public String about() {
        return "about";
    }
	
}
