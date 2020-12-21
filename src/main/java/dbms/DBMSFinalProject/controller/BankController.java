package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.model.Bank;
import dbms.DBMSFinalProject.repository.BankRepository;
import dbms.DBMSFinalProject.service.BankService;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BankController {

    @Autowired
    private BankRepository bankRepo;

    @Autowired
    private UserService userService;

    @Autowired
    private BankService bankService;

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

    @RequestMapping(value = "/view_banks", method = RequestMethod.POST)
    public String viewBanks(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("banks", bankService.getAllBankList());
        return "view_banks";
    }

    @RequestMapping(value = "/add_bank", method = RequestMethod.POST)
    public String addBank(Model model, HttpServletRequest request) throws Exception {
        Bank bank = new Bank();
        model.addAttribute( "bank", bank);
        model.addAttribute("update_bank", false);
        return "add_bank";
    }

    @RequestMapping(value = "/add_bank_result", method = RequestMethod.POST)
    public String addBankDecision(Model model, @RequestParam("inputBankName") String bankName, @RequestParam("inputBankImage") String bankImange, HttpServletRequest request) throws Exception{
        bankService.insertBank(bankName, bankImange);
        return "redirect:/view_banks";
    }

    @RequestMapping(value = "/update_bank_result", method = RequestMethod.POST)
    public String updateBankDecision(Model model, @RequestParam("bankId") Integer bankId, @RequestParam("inputBankName1") String bankName, @RequestParam("inputBankImage1") String bankImange, HttpServletRequest request) throws Exception{
        bankService.updateBank(bankId, bankName, bankImange);
        return "redirect:/view_banks";
    }

    @RequestMapping(value = "/update_bank", method = RequestMethod.POST)
    public String updateBank(Model model, @RequestParam("bank_id_update") int bank_id, @RequestParam("bank_name_update") String bank_name,
                             @RequestParam("bank_poster_update") String bank_poster,  HttpServletRequest request){
        Bank bank = new Bank();
        bank.setBank_id(bank_id);
        bank.setBank_name(bank_name);
        bank.setBank_poster(bank_poster);
        model.addAttribute("bank", bank);
        model.addAttribute("update_bank", true);
        return "add_bank";
    }

    @RequestMapping(value = "/delete_bank", method = RequestMethod.POST)
    public String deleteBank(Model model, @RequestParam("selected_bank_id_delete") Long bank_id, HttpServletRequest request){
        bankService.deleteBank( bank_id );
        return "redirect:/view_banks";
    }

    @GetMapping("/view_banks")
    public String getViewBank(Model model) {
        model.addAttribute("banks", bankService.getAllBankList());
        return "view_banks";
    }
}
