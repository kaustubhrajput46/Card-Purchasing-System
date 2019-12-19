package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.model.Bank;
import dbms.DBMSFinalProject.repository.BankRepository;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BankController {

    @Autowired
    private BankRepository bankRepo;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/search_bank_by_name", method = RequestMethod.POST)
    public String homePage(Model model, @RequestParam("bankSearch") String bankSearch, HttpSession session) throws Exception {
        List<Bank> banks = new ArrayList<>();
        for (Bank bank : bankRepo.findAll()) {
            if (bank.getBank_name().toLowerCase().contains(bankSearch.toLowerCase().strip())) {
                banks.add(bank);
            }
        }
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        model.addAttribute("banks", banks);
        return "home";
    }
}
