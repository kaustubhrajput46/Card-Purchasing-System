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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    @RequestMapping(value = "/view_cards", method = RequestMethod.POST)
    public String viewCards(@RequestParam("selected_bank_id_view") Integer ref_bank_id, Model model) {
        List<Bankcard> bankcards = new ArrayList<>();
        bankcards = bankcardrepo.getBankcard_id1( ref_bank_id );
        model.addAttribute( "bankcards", bankcardrepo.getBankcard_id1( ref_bank_id ) );
        model.addAttribute( "bank_id", ref_bank_id );
        return "view_cards";
    }

    @RequestMapping(value = "/add_card_result", method = RequestMethod.POST)
    public String addCardDecision(Model model, @RequestParam("bankcardName") String bankcardName, @RequestParam("bankcardRewards") String bankcardRewards, @RequestParam("bankcardRating") Float bankcardRating, @RequestParam("bankId") Integer bankId, @RequestParam("bankcardType") String bankcardType, @RequestParam("bankcardBenefits") String bankcardBenefits, @RequestParam("bankcardPoster") String bankcardPoster, @RequestParam("bankcardPrice") double bankcardPrice, HttpServletRequest request) throws Exception{
        bankcardrepo.insertBankCard(bankcardName, bankcardType, bankcardBenefits, bankcardRating, bankcardRewards, bankcardPoster, bankId, bankcardPrice);
        List<Bankcard> bankcards = new ArrayList<>();
        bankcards = bankcardrepo.getBankcard_id1( bankId );
        model.addAttribute( "bankcards", bankcardrepo.getBankcard_id1( bankId ) );
        return "view_cards";
    }

    @RequestMapping(value = "/add_card", method = RequestMethod.POST)
    public String addCard(@RequestParam("selected_bank_id_add_card") Integer ref_bank_id, Model model) {
        model.addAttribute( "bank_id", ref_bank_id );
        model.addAttribute( "update_card", false );
        return "add_card";
    }

    @RequestMapping(value = "/update_card", method = RequestMethod.POST)
    public String updateCard(@RequestParam("card_id_to_update") Integer bankcard_id, @RequestParam("card_name_to_update") String card_name,
                             @RequestParam("card_type_to_update") String card_type, @RequestParam("card_benefits_to_update") String card_benefits,
                             @RequestParam("card_rating_to_update") Float card_rating, @RequestParam("card_rewards_to_update") String card_rewards,
                             @RequestParam("card_poster_to_update") String card_poster, @RequestParam("card_bank_id_to_update") Integer ref_bank_id,
                             @RequestParam("card_price_to_update") double card_price, Model model, HttpServletRequest request){
        Bankcard bankcard = new Bankcard();
        bankcard.setBankcard_id(bankcard_id);
        bankcard.setCard_name(card_name);
        bankcard.setCard_type(card_type);
        bankcard.setCard_benefits(card_benefits);
        bankcard.setCard_rating(card_rating.toString());
        bankcard.setCard_rewards(card_rewards);
        bankcard.setCard_poster(card_poster);
        bankcard.setRef_bank_id(ref_bank_id);
        bankcard.setCard_price(card_price);
        model.addAttribute("bankcard", bankcard);
        model.addAttribute("update_card", true);
        return "add_card";
    }

    @RequestMapping(value = "/update_card_result", method = RequestMethod.POST)
    public String updateCardDecision(Model model, @RequestParam("bankcard_id_update") Integer bankcard_id, @RequestParam("card_name_update") String card_name,
                                     @RequestParam("card_type_update") String card_type, @RequestParam("card_benefits_update") String card_benefits,
                                     @RequestParam("card_rating_update") Float card_rating, @RequestParam("card_rewards_update") String card_rewards,
                                     @RequestParam("card_poster_update") String card_poster, @RequestParam("ref_bank_id_update") Integer ref_bank_id,
                                     @RequestParam("card_price_update") double card_price,  HttpServletRequest request){
        bankcardrepo.updateBankCard(bankcard_id, card_name, card_type, card_benefits, card_rating, card_rewards, card_poster, card_price);
        List<Bankcard> bankcards = new ArrayList<>();
        bankcards = bankcardrepo.getBankcard_id1(ref_bank_id);
        model.addAttribute("bankcards", bankcardrepo.getBankcard_id1(ref_bank_id));
        return "view_cards";
    }

    @RequestMapping(value = "/delete_card", method = RequestMethod.POST)
    public String deleteCard(Model model, @RequestParam("selected_bank_id_delete_card") Integer ref_bank_id, @RequestParam("card_id_to_delete") Long bankcard_id, HttpServletRequest request) throws Exception {
        bankcardrepo.deleteCard(bankcard_id);
        List<Bankcard> bankcards = new ArrayList<>();
        bankcards = bankcardrepo.getBankcard_id1(ref_bank_id);
        model.addAttribute("bankcards", bankcardrepo.getBankcard_id1(ref_bank_id));
        return "view_cards";
    }
}