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
public class OperationController {
	
	private OperationService operationService;
	
	@Autowired(required=true)
	@Qualifier(value="operationService")
	public void setOperationService(OperationService us){
		this.operationService = us;
	}
	
	@RequestMapping(value = "/operations", method = RequestMethod.GET)
	public String listOperations(Model model) {
		model.addAttribute("operation", new Operation());
		model.addAttribute("listOperations", this.operationService.listOperations());
		return "operation";
	}
	
	//For add and update operation both
	@RequestMapping(value= "/operation/add", method = RequestMethod.POST)
	public String addOperation(@ModelAttribute("operation") Operation u){
		
		if(u.getId() == 0){
			//new operation, add it
			this.operationService.addOperation(u);
		}else{
			//existing operation, call update
			this.operationService.updateOperation(u);
		}
		
		return "redirect:/operations";
		
	}
	
	@RequestMapping("/operation/remove/{id}")
    public String removeOperation(@PathVariable("id") int id){
		
        this.operationService.removeOperation(id);
        return "redirect:/operations";
    }
 
    @RequestMapping("/operation/edit/{id}")
    public String editOperation(@PathVariable("id") int id, Model model){
        model.addAttribute("operation", this.operationService.getOperationById(id));
        model.addAttribute("listOperations", this.operationService.listOperations());
        return "operation";
    }
    
}
