package com.wilsonbluong.javaproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wilsonbluong.javaproject.validators.UserValidator;
import com.wilsonbluong.javaproject.models.User;
import com.wilsonbluong.javaproject.services.UserService;


@Controller
public class UsersController {
	
    private UserService userService;
    private final UserValidator userValidator;
    
    public UsersController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    // renders registration and login form
    @GetMapping("/")
    public String registerForm(@ModelAttribute("user") User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "regLogPage.jsp";
    	}
    	else {
    		return "redirect:/home";
    	} 
    }
    
    // register new user
    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
        // if result has errors, return the registration page
    	userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		return ("regLogPage.jsp");
    	}
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
    	else {
    		User u = userService.registerUser(user);
    		session.setAttribute("userId", u.getId());
    		return ("redirect:/home");
    	}
    }
    
    // authenticates user to allow access to events page
    @PostMapping("/login")
    public String loginUser(
    		@RequestParam("email") String email,
    		@RequestParam("password") String password, Model model, HttpSession session) {
        // if the user is authenticated, save their user id in session
    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		return ("redirect:/home");
    	}
        // else, add error messages and return the login page
    	else {
    		session.setAttribute("error", "Invalid Credentials. Please try again.");
    		return "redirect:/";
    	}
    }
    
    // renders home page with user info
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	// if user not in session return redirect to login page
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	// get user from session, save them in the model and return the home page
    	else {
        	Long userId = (Long) session.getAttribute("userId");
        	User user = userService.findUserById(userId);
        	model.addAttribute("user", user);
        	
        	// get all ideas to display on main page

    		return "main.jsp";
    	}
    }
    
    // logs user out
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
    	session.invalidate();
        // redirect to login page
    	return "redirect:/";
    }

}
