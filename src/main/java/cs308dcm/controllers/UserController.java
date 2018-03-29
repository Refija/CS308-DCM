package cs308dcm.controllers;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import cs308dcm.models.User;
import cs308dcm.services.UserService;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import cs308dcm.models.User;
import cs308dcm.services.UserService;
@Controller
public class UserController {
    @Autowired
	UserService srv;//will inject dao from xml file
    
    /*It displays a form to input data, here "command" is a reserved request attribute
     *which is used to display object data into form
     */
   
	@RequestMapping("/userform")
	public ModelAndView showform(){
		return new ModelAndView("userform","command",new User());
	}
	/*It saves object into database. The @ModelAttribute puts request data
	 *  into model object. You need to mention RequestMethod.POST method 
	 *  because default request is GET*/
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user){
		srv.save(user);
		return new ModelAndView("redirect:/viewemp");//will redirect to viewuser request mapping
	}
	/* It provides list of users in model object */
	@RequestMapping("/viewuser")
	public ModelAndView viewuser(){
		List<User> list=srv.getUsers();
		return new ModelAndView("viewuser","list",list);
	}
	/* It displays object data into form for the given id. 
	 * The @PathVariable puts URL data into variable.*/
	@RequestMapping(value="/edituser/{id}")
	public ModelAndView edit(@PathVariable int id){
		User user=srv.getUserById(id);
		return new ModelAndView("usereditform","command",user);
	}
	/* It updates model object. */
	@RequestMapping(value="/editsave",method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("user") User user){
		srv.update(user);
		return new ModelAndView("redirect:/viewuser");
	}
	/* It deletes record for the given id in URL and redirects to /viewuser */
	@RequestMapping(value="/deleteuser/{id}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int id){
		srv.delete(id);
		return new ModelAndView("redirect:/viewuser");
	}

}