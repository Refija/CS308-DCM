package com.journaldev.spring;

import java.text.SimpleDateFormat;
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

import com.journaldev.spring.model.Staff;
import com.journaldev.spring.service.StaffService;

@Controller
public class StaffController {
	
	private StaffService staffService;
	
	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService us){
		this.staffService = us;
	}
	
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String listStaff(Model model) {
		model.addAttribute("staff", new Staff());
		model.addAttribute("listStaff", this.staffService.listStaff());
		return "staff";
	}
	
	//For add and update staff both
	@RequestMapping(value= "/staff/add", method = RequestMethod.POST)
	public String addStaff(@ModelAttribute("staff") Staff u){
		
		if(u.getId() == 0){
			//new staff, add it
			this.staffService.addStaff(u);
		}else{
			//existing staff, call update
			this.staffService.updateStaff(u);
		}
		
		return "redirect:/staff";
		
	}
	
	@RequestMapping("/staff/remove/{id}")
    public String removeStaff(@PathVariable("id") int id){
		
        this.staffService.removeStaff(id);
        return "redirect:/staff";
    }
 
    @RequestMapping("/staff/edit/{id}")
    public String editStaff(@PathVariable("id") int id, Model model){
        model.addAttribute("staff", this.staffService.getStaffById(id));
        model.addAttribute("listStaff", this.staffService.listStaff());
        return "staff";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
}
