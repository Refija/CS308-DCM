package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Appointment;
import com.journaldev.spring.service.AppointmentService;

@Controller
public class AppointmentController {
	
	private AppointmentService appointmentService;
	
	@Autowired(required=true)
	@Qualifier(value="appointmentService")
	public void setAppointmentService(AppointmentService us){
		this.appointmentService = us;
	}
	
	@RequestMapping(value = "/appointments", method = RequestMethod.GET)
	public String listAppointments(Model model) {
		model.addAttribute("appointment", new Appointment());
		model.addAttribute("listAppointments", this.appointmentService.listAppointments());
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
        return "appointment";
    }
    
}
