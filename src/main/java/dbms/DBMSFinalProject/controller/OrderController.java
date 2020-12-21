package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.model.CardOrdered;
import dbms.DBMSFinalProject.model.Payment;
import dbms.DBMSFinalProject.repository.Bankcardrepository;
import dbms.DBMSFinalProject.repository.CardOrderedRepository;
import dbms.DBMSFinalProject.repository.PaymentRepository;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.TemporalType;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Timer;

@Controller
public class OrderController {

    @Autowired
    private UserService userService;

    @Autowired
    private Bankcardrepository bankcardrepo;

    @Autowired
    private CardOrderedRepository cardOrderedRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @RequestMapping(value = "/order_summary", method = RequestMethod.POST)
    public String orderSummary(Model model, @RequestParam("card_selected_id") int card_selected_id, HttpSession session) {
        if(!userService.userLoggedIn(session))
            return "user_not_logged_in";

        model.addAttribute("selectedCard", bankcardrepo.getCardDetails(card_selected_id));
        model.addAttribute("userLoggedIn", userService.userLoggedIn(session));
        return "order_summary";
    }

    @RequestMapping(value = "/order_confirmed", method = RequestMethod.POST)
    public String orderConfirmed(@RequestParam("ordered_bankcard_id") int ordered_bankcard_id, HttpSession session) {
        if(!userService.userLoggedIn(session))
            return "user_not_logged_in";

        int user_id = userService.loggedInUserId(session);

        Date todayDate = new Date();
        LocalDateTime  currentTime = LocalDateTime.now();

        CardOrdered newCardOrder = new CardOrdered(user_id, ordered_bankcard_id, todayDate, currentTime);
        cardOrderedRepository.save(newCardOrder);

        int order_id = newCardOrder.getOrder_id();
        Payment newPayment = new Payment(order_id, bankcardrepo.getCardPrice(ordered_bankcard_id) * 1.08);
        paymentRepository.save(newPayment);

        return "order_placed_confirmation";
    }

}
