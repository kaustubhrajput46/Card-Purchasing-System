package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.helper.BankSystemConstants;
import dbms.DBMSFinalProject.model.Bankcard;
import dbms.DBMSFinalProject.model.CardOrdered;
import dbms.DBMSFinalProject.model.User;
import dbms.DBMSFinalProject.repository.BankRepository;
import dbms.DBMSFinalProject.repository.Bankcardrepository;
import dbms.DBMSFinalProject.repository.CardOrderedRepository;
import dbms.DBMSFinalProject.service.BankService;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class UserController {

    @Autowired
    private BankService bankService;

    @Autowired
    private UserService userService;

    @Autowired
    private Bankcardrepository bankcardrepository;

    @Autowired
    private CardOrderedRepository cardOrderedRepository;

    @GetMapping("/signin")
    public String signInPage(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "signin";
    }

@RequestMapping(value = "/login", method = RequestMethod.POST)
public String loginUser(@ModelAttribute("user") User user, Model model, HttpServletRequest request) throws Exception {
    int result = userService.doLogin(user);
    String userType = userService.getUserType(user);
    if (result == BankSystemConstants.success && !StringUtils.isEmpty(userType)) {
        userService.createUserSession(user, request);
        if (BankSystemConstants.customer.equalsIgnoreCase(userType)) {
            model.addAttribute("banks", bankService.getAllBankList());
            model.addAttribute("user_loggedIn", true);
            model.addAttribute("user_name", userService.getUserName(user));
            return "home";
        } if(BankSystemConstants.adminUser.equalsIgnoreCase(userType)){
            model.addAttribute( "user_loggedIn", true );
            model.addAttribute( "user_name", userService.getUserName(user));
            return "adminhome";
        }
    } else {
        model.addAttribute("error_i", "The email or password is incorrect");
        return "signin";
    }
    model.addAttribute("error_i", "The email or password is incorrect");
    return "signin";
}

    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("user") User user, Model model) throws Exception {
        int result = userService.createUser(user);
        if (result == BankSystemConstants.success) {
            return "registration_complete";
        } else if (result == BankSystemConstants.failure) {
            return "registration_failed";
        } else if (result == BankSystemConstants.emailAlreadyPresent) {
            model.addAttribute("email_error", "Email address already exists.");
            return "signup";
        } else {
            return "registration_failed";
        }
    }

    @GetMapping("/all_orders")
    public String userAllOrders(Model model, HttpSession session) {
        int user_id = userService.loggedInUserId(session);
        List<Collection> myList = cardOrderedRepository.getAllOrderedListOfUser(user_id);
        model.addAttribute("allOrders", myList);
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        return "all_orders";
    }

    @GetMapping("/user_profile")
    public String userProfile(Model model, HttpSession session) {
        int user_id = userService.loggedInUserId(session);
        model.addAttribute("user", userService.findRegisteredUser(user_id));
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        return "user_profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
