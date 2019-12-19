package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.model.Bankcard;
import dbms.DBMSFinalProject.repository.Bankcardrepository;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;

@Controller
public class BankCardController {

    @Autowired
    private Bankcardrepository bankcardrepo;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/Bank_selected", method = RequestMethod.POST)
    public String bankcard1(Model model, @RequestParam("selected_bank_id") int selected_bank_id, HttpSession session) {
        model.addAttribute("credit_cards", bankcardrepo.getBankCards(selected_bank_id, "Credit Card"));
        model.addAttribute("debit_cards", bankcardrepo.getBankCards(selected_bank_id, "Debit Card"));
        model.addAttribute("forex_cards", bankcardrepo.getBankCards(selected_bank_id, "Forex Card"));
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        return "Bank_selected";
    }

}
