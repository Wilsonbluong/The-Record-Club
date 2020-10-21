package com.wilsonbluong.javaproject.controllers;

import java.util.List;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.wilsonbluong.javaproject.models.Song;
import com.wilsonbluong.javaproject.models.User;
import com.wilsonbluong.javaproject.services.SongService;
import com.wilsonbluong.javaproject.services.UserService;

@Controller
public class SongsController {
	
	private final SongService songService;
	private final UserService userService;
	
	public SongsController(SongService songService, UserService userService) {
		this.songService = songService;
		this.userService = userService;
	}
	
	// render add page
	@GetMapping("/add")
	public String showAddPage(@ModelAttribute("addNew") Song song, Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		return "add.jsp";
		} 
		else {
			return "redirect:/";
		}
	}
	
	// add song
	@PostMapping("/add")
	public String addSong(@Valid @ModelAttribute("addNew") Song song, BindingResult result, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
	    if (result.hasErrors()) {
			List<Song> songs = songService.allSongs();
			model.addAttribute("songs", songs);
	        return "add.jsp";
	    }
	    else {
	    	Song newSong = songService.addSong(song);
	    	newSong.setUser(u);
	        songService.addSong(newSong);
	        return "redirect:/collection";
	    }
	}
	
	// render collection page
	@GetMapping("/collection")
	public String showCollectionPage(Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
    	// get all song to display on page
    	model.addAttribute("songs", songService.allSongs());
		return "collection.jsp";
		} 
		else {
			return "redirect:/";
		}
	}
	
	// render YOUR collection page
	@GetMapping("/{user_id}/yourcollection")
	public String showYourCollectionPage(@PathVariable("user_id") Long id, Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
    	// get your song to display on page
		model.addAttribute("songs", userService.findUserById(userId).getSongs());

		return "yourCollection.jsp";
		} 
		else {
			return "redirect:/";
		}
	}
	
	// renders members page
	@GetMapping("/members")
	public String showMembers(Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
		List<User> users = userService.allUsers();
		model.addAttribute("users", users);
		return "members.jsp";
		} 
		else {
			return "redirect:/";
		}
	}
	
	// render song id page
	@GetMapping("/song/{id}")
	public String songPage(@PathVariable("id") Long id, Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "song.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	// render edit page
	@GetMapping("/song/{song_id}/edit")
	public String showEdit(Model model, @ModelAttribute("song") Song song, @PathVariable("song_id") Long songId, HttpSession session) {
		
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);

		Song editSong = songService.findSong(songId);
		
		if (u.getId() == editSong.getUser().getId()) {
			
			model.addAttribute("song", editSong);
			return "edit.jsp";
		}
		else {
			return "redirect:/collection";
		}
	}
	
	// edit song
	@PostMapping("/song/{song_id}/edit")
	public String displayEditPage(@Valid Model model, @ModelAttribute("song") Song song, @PathVariable("song_id") Long songId, HttpSession session, BindingResult result) {


		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			song.setId(songId);
			Song editSong = songService.addSong(song);
			editSong.setUser(u);
			songService.addSong(song);
			
			return "redirect:/collection";
		}
	}
	
	// render members id page
	@GetMapping("/members/{user_id}")
	public String memberPage(@PathVariable("user_id") Long id, Model model, HttpSession session) {
		// if current user is in session then proceed, if not redirect to log-reg page
		if (session.getAttribute("userId") != null) {
			
		// when get user id from session, don't forget to cast data type to Long
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("currentUser", u);
		
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		return "memberId.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	// delete member
	@GetMapping("members/{user_id}/delete")
	public String deleteMember(@PathVariable("user_id") Long id) {
		
		userService.deleteUser(id);
		return "redirect:/members";
	}
	
	// delete song
	@GetMapping("song/{song_id}/{delete}")
	public String deleteSong(@PathVariable("song_id") Long id) {
		songService.deleteSong(id);
		return "redirect:/collection";
	}

}
