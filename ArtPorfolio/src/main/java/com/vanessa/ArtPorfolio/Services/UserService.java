package com.vanessa.ArtPorfolio.Services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.vanessa.ArtPorfolio.Models.LoginUser;
import com.vanessa.ArtPorfolio.Models.User;
import com.vanessa.ArtPorfolio.Repos.UserRepo;

@Service
public class UserService {
	private final UserRepo userRepo;
//	Adding dependency
	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}
	
	 // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
        // TO-DO: Additional validations!
    	
    	// Reject if email is taken (present in database)
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email","Matches","An account with this email already exist!");
    	}
        // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm","Matches","Passwords must match!");
    	}
        // Return null if result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
        // Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
        return userRepo.save(newUser);
    }
    public User login(LoginUser newLogin, BindingResult result) {
        // TO-DO: Additional validations!
    	System.out.println("inside user login SERVICEn ---------------------");
    	// Find user in the DB by email
    	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
    	System.out.println("potentialuser ------>" + potentialUser);
        // Reject if NOT present
    	if(!potentialUser.isPresent()) {
    		System.out.println("not present ------ add errror--------");
    		result.rejectValue("email","Matches","User Not Found.");
    		return null;
    	}
    	User user = potentialUser.get();
        // Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
        // Return null if result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
        // Otherwise, return the user object
    	return user;
    	
    }
    
	
// Get All Users
	public List<User> allUsers(){
		return userRepo.findAll();
	}
	
//	Create One User
	public User createUser(User user){
		return userRepo.save(user);
	}
	
//	View One User
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;
		}
	}
	

}
