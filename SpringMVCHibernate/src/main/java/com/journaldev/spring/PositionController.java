package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Position;
import com.journaldev.spring.service.PositionService;

@Controller
public class PositionController {
	
	private PositionService positionService;
	
	@Autowired(required=true)
	@Qualifier(value="positionService")
	public void setPositionService(PositionService us){
		this.positionService = us;
	}
	
	@RequestMapping(value = "/positions", method = RequestMethod.GET)
	public String listPositions(Model model) {
		model.addAttribute("position", new Position());
		model.addAttribute("listPositions", this.positionService.listPositions());
		return "position";
	}
	
	//For add and update position both
	@RequestMapping(value= "/position/add", method = RequestMethod.POST)
	public String addPosition(@ModelAttribute("position") Position u){
		
		if(u.getId() == 0){
			//new position, add it
			this.positionService.addPosition(u);
		}else{
			//existing position, call update
			this.positionService.updatePosition(u);
		}
		
		return "redirect:/positions";
		
	}
	
	@RequestMapping("/position/remove/{id}")
    public String removePosition(@PathVariable("id") int id){
		
        this.positionService.removePosition(id);
        return "redirect:/positions";
    }
 
    @RequestMapping("/position/edit/{id}")
    public String editPosition(@PathVariable("id") int id, Model model){
        model.addAttribute("position", this.positionService.getPositionById(id));
        model.addAttribute("listPositions", this.positionService.listPositions());
        return "position";
    }
    
}
