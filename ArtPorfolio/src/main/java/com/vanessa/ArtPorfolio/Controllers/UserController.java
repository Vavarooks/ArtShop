package com.vanessa.ArtPorfolio.Controllers;



import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vanessa.ArtPorfolio.Models.Art;
import com.vanessa.ArtPorfolio.Models.LoginUser;
import com.vanessa.ArtPorfolio.Models.User;
import com.vanessa.ArtPorfolio.Services.ArtService;
import com.vanessa.ArtPorfolio.Services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ArtService artService;

//	Login / Register Page
	@GetMapping("/")
	public String index(Model model) {
//		List<User> users = userService.allUsers();
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
// See All Art
	@RequestMapping("/view/user")
	public String viewUser(HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(id));
		List<Art> arts = artService.allArt();
		model.addAttribute("art", arts);
		return "view.jsp";
	}
	
//	View Other's Art
	@RequestMapping("/view/{id}")
	public String viewArt(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long userid = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(userid));
		Art arts = artService.getArt(id);
		model.addAttribute("art", arts);
		return "art.jsp";
	}
	
//	To View all Self Posted Art
	@RequestMapping("/gallery/{id}")
	public String viewGallery(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long userid = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(userid));
		
		return "gallery.jsp";
	}
	
//	To View someone else's work
	@GetMapping("/display/{id}")
	public String viewDisplay(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long userid = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(userid));
		User oneUser = userService.findUser(id);
		model.addAttribute("oneUser", oneUser);
		return "display.jsp";
	}
	
//	Make Art
	@GetMapping("/make/art")
	public String makeArt(@ModelAttribute("newArt")Art art, HttpSession session,Model model) {
		Long userid = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(userid));
		return "artform.jsp";
	}
	
	@PostMapping("/save")
	public String saveArt(@Valid @ModelAttribute("newArt") Art art, BindingResult result,Model model){
		if(result.hasErrors()) {
			Art arts = new Art();
			model.addAttribute("art", arts);
			return "artform.jsp";
		}
		else {
			artService.makeArt(art);
			return "redirect:/view/user";
		}
	}

	
//	Edit Art
	@RequestMapping("/edit/{id}")
	public String editArt(@PathVariable("id") Long id,HttpSession session, Model model) {
		Long userid = (Long) session.getAttribute("id");
		model.addAttribute("user", userService.findUser(userid));
		Art art = artService.getArt(id);
		model.addAttribute("art", art);
		return "edit.jsp";
	}
	@RequestMapping(value = "/changes/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("art") Art art, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			artService.updateArt(art);
			return "redirect:/gallery/{id}";
		}
	}
	
//	Delete Art
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		artService.deleteArt(id);
		return "redirect:/gallery/{id}";
	}
	

//	Registration
	@PostMapping("/register") 
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {
		// to do some extra validations and create a new user!
		User user = userService.register(newUser, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}

		// No errors!
		session.setAttribute("id", user.getId());
		// in other words, log them in.

		return "redirect:/view/user";
	}

//	     Log in!
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		System.out.println("inside login method------------------");
		// Add once service is implemented:
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			System.out.println("re render the index --------------------");
			return "index.jsp";
		} else {
			// No errors
			session.setAttribute("id", user.getId());
			// in other words, log them in.
			Long id = (Long) session.getAttribute("id");
			model.addAttribute("user", userService.findUser(id));
			return "redirect:/view/user";
		}

	}

//	    Log out
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("id", null);
		return "redirect:/";
	}

}
