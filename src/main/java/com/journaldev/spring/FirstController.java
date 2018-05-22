package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FirstController {

	/*@Autowired
    private SecurityService SecurityService;*/

	@RequestMapping(value= "/", method = RequestMethod.GET)
	public String home() {
        return "home";
    }
	
	@RequestMapping(value= "/test", method = RequestMethod.GET)
	public String testmap() {
        return "test";
    }
	/*@RequestMapping(value= "/login", method = RequestMethod.GET)
	public String login() {
        return "login";
    }*/
	/*@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("userForm") User userForm) {
		SecurityService.autologin(userForm.getUsername(), userForm.getPassword());

        return "redirect:/users";
    }*/
	@RequestMapping(value= "/about", method = RequestMethod.GET)
	public String about() {
        return "about";
    }
	
	@RequestMapping(value= "/home", method = RequestMethod.GET)
	public String welcome() {
        return "welcome";
    }
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {

	  ModelAndView model = new ModelAndView();
	  if (error != null) {
		model.addObject("error", "Invalid username and password!");
	  }

	  if (logout != null) {
		model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("login");

	  return model;

	}
	
	@RequestMapping(value = "/403", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView accesssDenied() {

	  ModelAndView model = new ModelAndView();
		
	  //check if user is login
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		model.addObject("username", userDetail.getUsername());
	  }
		
	  model.setViewName("403");
	  return model;

	}
}
