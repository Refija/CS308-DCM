package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.journaldev.spring.model.Report;
import com.journaldev.spring.service.ReportService;

@Controller
public class ReportController {
	
	private ReportService reportService;
	
	@Autowired(required=true)
	@Qualifier(value="reportService")
	public void setReportService(ReportService ps){
		this.reportService = ps;
	}
	
	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String listReports(Model model) {
		model.addAttribute("report", new Report());
		model.addAttribute("listReports", this.reportService.listReports());
		return "report";
	}
	
	//For add and update report both
	@RequestMapping(value= "/report/add", method = RequestMethod.POST)
	public String addReport(@ModelAttribute("report") Report p){
		
		if(p.getId() == 0){
			//new report, add it
			this.reportService.addReport(p);
		}else{
			//existing report, call update
			this.reportService.updateReport(p);
		}
		
		return "redirect:/reports";
		
	}
	
	@RequestMapping("/removereport/{id}")
    public String removeReport(@PathVariable("id") int id){
		
        this.reportService.removeReport(id);
        return "redirect:/reports";
    }
 
    @RequestMapping("/editreport/{id}")
    public String editReport(@PathVariable("id") int id, Model model){
        model.addAttribute("report", this.reportService.getReportById(id));
        model.addAttribute("listReports", this.reportService.listReports());
        return "report";
    }
	
}
