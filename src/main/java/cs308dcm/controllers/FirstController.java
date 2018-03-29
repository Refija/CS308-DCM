package cs308dcm.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cs308dcm.services.UserService;
import cs308dcm.models.User;

@Controller
public class FirstController implements ErrorController {

	private static final String PATH = "/error";
	
	@Autowired
	private UserService userService;

	@RequestMapping("/home")
	@ResponseBody
	public String welcome() {
		return "Hello World!";
	}
	
	@RequestMapping(value = PATH)
	@ResponseBody
	public String error() {
		return "INVALID MAPPING!";
	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_INDEX");
		return "landing_page";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "landing_page";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.save(user);
		request.setAttribute("mode", "MODE_INDEX");
		return "landing_page";
	}

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.getUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "landing_page";
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		userService.delete(id);
		request.setAttribute("users", userService.getUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "landing_page";
	}

	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("user", userService.getUserById(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "landing_page";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "landing_page";
	}

	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return PATH;
	}

	/*@RequestMapping("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if (userService.findByUsernameAndPassword(user.getUsername(), user.getPassword()) != null) {
			return "landing_page";
		} else {
			request.setAttribute("mode", "MODE_LOGIN");
			return "nopath";

		}
	}
*/
}
