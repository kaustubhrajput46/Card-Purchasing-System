package dbms.DBMSFinalProject.controller;

import dbms.DBMSFinalProject.helper.BankSystemConstants;
import dbms.DBMSFinalProject.helper.EmailHelper;
import dbms.DBMSFinalProject.model.User;
import dbms.DBMSFinalProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class ResetPasswordController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailHelper emailHelper;

    @RequestMapping(value = "/processForgotPassword", method = RequestMethod.POST)
    public String processForgotPasswordForm(@ModelAttribute("user") User user, Model model) throws Exception {

        int count = userService.userExists(user.getEmail());
        if (count < 1) {
            // we didn't find any account
//            System.out.println("we're not able to fine the email id");
            model.addAttribute("error_forgot_password", "The email doesn't exits");
            return "forgot_password";
        } else {
            user.setPassword_Reset_Token(UUID.randomUUID().toString());
            // Save token to database
            userService.updatePasswordResetToken(user);
            // Email message
            String subject = "Reset Password Email";
            String message = "To reset your password, click the link below:\n"
                + "http://localhost:8087/resetPasswordVerification/?token="
                + user.getPassword_Reset_Token();
            emailHelper.sendMail(user.getEmail(), subject, message);
        }
        return "forgot_password_sent_mail_confirmation";
    }

    @RequestMapping(value = "/resetPasswordVerification", method = RequestMethod.GET)
    public String displayResetPasswordPage(@RequestParam("token") String token, Model model) {
        int count = userService.resetPasswordTokenExists(token);
        if (count < 1) {
            return "reset_password_failed";
        } else {
            User user = new User();
            user.setPassword_Reset_Token(token);
            model.addAttribute("user", user);
            model.addAttribute("reset_token", token);
            return "reset_password";
        }
    }

    @RequestMapping(value = "/resetPasswordForm", method = RequestMethod.POST)
    public String setNewPassword(@ModelAttribute("user") User user) throws Exception {
        int result = userService.resetPassword(user);
        if (result == BankSystemConstants.success) {
            return "password_updated";
        } else {
            return "reset_password_failed";
        }
    }

}
