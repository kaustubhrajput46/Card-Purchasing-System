package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.model.User;
import dbms.DBMSFinalProject.service.BankService;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;

@Controller
//DID I get it right?
public class HomeController {

    @Value("${spring.application.name}")
    String applicationName;

    @Autowired
    private BankService bankService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String homePage(Model model, HttpSession session) {
        model.addAttribute("banks", bankService.getAllBankList());
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        return "home";
    }

    @GetMapping("/signup")
    public String signUpPage(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "signup";
    }

    @GetMapping("/forgot_password")
    public String forgotPassword(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "forgot_password";
    }
}
