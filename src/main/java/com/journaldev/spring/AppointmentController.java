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

import com.journaldev.spring.model.Appointment;
import com.journaldev.spring.service.AppointmentService;
import com.journaldev.spring.service.OperationService;
import com.journaldev.spring.service.StaffService;
import com.journaldev.spring.service.UserService;

@Controller
public class AppointmentController {
	
	@Autowired(required=true)
	@Qualifier(value="appointmentService")
	private AppointmentService appointmentService;
	
	@Autowired(required=true)
	@Qualifier(value="staffService")
	private StaffService staffService;
	
	@Autowired(required=true)
	@Qualifier(value="operationService")
	private OperationService operationService;
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	private UserService userService;
	
	public void setAppointmentService(AppointmentService us, StaffService staffService, OperationService operationService, UserService userService){
		this.appointmentService = us;
		this.staffService = staffService;
		this.operationService = operationService;
		this.userService = userService;
	}
	
	@RequestMapping(value = "/appointments", method = RequestMethod.GET)
	public String listAppointments(Model model) {
		model.addAttribute("appointment", new Appointment());
		model.addAttribute("listAppointments", this.appointmentService.listAppointments());
		model.addAttribute("listStaff", this.staffService.listStaff());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listOperations", this.operationService.listOperations());
		return "appointment";
	}
	
	//For add and update appointment both
	@RequestMapping(value= "/appointment/add", method = RequestMethod.POST)
	public String addAppointment(@ModelAttribute("appointment") Appointment u){
		
		if(u.getId() == 0){
			//new appointment, add it
			this.appointmentService.addAppointment(u);
		}else{
			//existing appointment, call update
			this.appointmentService.updateAppointment(u);
		}
		
		return "redirect:/appointments";
		
	}
	
	@RequestMapping("/appointment/remove/{id}")
    public String removeAppointment(@PathVariable("id") int id){
		
        this.appointmentService.removeAppointment(id);
        return "redirect:/appointments";
    }
 
    @RequestMapping("/appointment/edit/{id}")
    public String editAppointment(@PathVariable("id") int id, Model model){
        model.addAttribute("appointment", this.appointmentService.getAppointmentById(id));
        model.addAttribute("listAppointments", this.appointmentService.listAppointments());
		model.addAttribute("listStaff", this.staffService.listStaff());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listOperations", this.operationService.listOperations());
        return "appointment";
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
    
}
