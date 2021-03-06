package com.journaldev.spring;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Appointment;
import org.springframework.security.core.Authentication;

import com.journaldev.spring.model.User;
import com.journaldev.spring.service.UserService;

@Controller
public class UserController {
	
	private UserService userService;
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService us){
		this.userService = us;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String listUsers(Model model, Authentication authentication) {
		//authentication.getAuthorities();
		/*System.out.println(Arrays.toString(authentication.getAuthorities().toArray()));
		System.out.println(authentication.getAuthorities().toArray()[0]);
		if (authentication.getAuthorities().toArray()[0].toString().compareTo("admin") != 0) {
			throw
		}*/
		model.addAttribute("user", new User());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "user";
	}
	
	//For add and update user both
	@RequestMapping(value= "/user/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User u){
		
		if(u.getId() == 0){
			u.setRole("ROLE_USER");
			//new user, add it
			this.userService.addUser(u);
		}else{
			//existing user, call update
			this.userService.updateUser(u);
		}
		
		return "redirect:/login";
		
	}
	
	@RequestMapping("/user/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
		
        this.userService.removeUser(id);
        return "redirect:/users";
    }
 
    @RequestMapping("/user/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "user";
    }
    @RequestMapping(value= "/user/register", method = RequestMethod.GET)
	public String registerUser(Model model) {
    	model.addAttribute("user", new User());
    	model.addAttribute("listUsers", this.userService.listUsers());
        return "register";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
}
