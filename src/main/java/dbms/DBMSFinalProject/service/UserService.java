package dbms.DBMSFinalProject.service;

import dbms.DBMSFinalProject.helper.BankSystemConstants;
import dbms.DBMSFinalProject.helper.PasswordAuthenticator;
import dbms.DBMSFinalProject.model.CardOrdered;
import dbms.DBMSFinalProject.model.User;
import dbms.DBMSFinalProject.repository.CardOrderedRepository;
import dbms.DBMSFinalProject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private CardOrderedRepository cardOrderedRepository;

    public int doLogin(User user) throws Exception {
        String storedPassword = userRepo.findStoredPassword(user.getEmail());
        if (!StringUtils.isEmpty(storedPassword) && PasswordAuthenticator.check(user.getPassword(), storedPassword)) {
            return BankSystemConstants.success;
        } else {
            return BankSystemConstants.failure;
        }
    }

    public String getUserType(User user) throws Exception {
        return userRepo.findUserType(user.getEmail());
    }

    public String getUserName(User user) throws Exception {
        return userRepo.findUserName(user.getEmail());
    }

    public int resetPassword(User user) throws Exception {
        String user_Password = PasswordAuthenticator.getSaltedHash(user.getPassword());
        int userId = userRepo.getUserIdWithResetToken(user.getPassword_Reset_Token());
        userRepo.updateUserPasswordByID(user_Password, userId);
        return BankSystemConstants.success;
    }

    public int userExists(String email) {
        return userRepo.findCountByEmailId(email);
    }

    public void updatePasswordResetToken(User user) {
        userRepo.updatePasswordResetToken(user.getPassword_Reset_Token(), user.getEmail());
    }

    public int resetPasswordTokenExists(String token) {
        return userRepo.findResetPasswordToken(token);
    }

    public void createUserSession(User user, HttpServletRequest request) {
        @SuppressWarnings("unchecked")
        List<String> messages = (List<String>) request.getSession().getAttribute("MY_SESSION_MESSAGES");
        if (messages == null) {
            messages = new ArrayList<>();
            request.getSession().setAttribute("MY_SESSION_MESSAGES", messages);
        }
        int foundUserId = userRepo.getUserIdWithEmail(user.getEmail());
        messages.add(String.valueOf(foundUserId));
        request.getSession().setAttribute("MY_SESSION_MESSAGES", messages);
    }

    public boolean userLoggedIn(HttpSession session) {
        List<String> messages = (List<String>) session.getAttribute("MY_SESSION_MESSAGES");
        return messages != null;
    }

    public int loggedInUserId(HttpSession session) {
        List<String> messages = (List<String>) session.getAttribute("MY_SESSION_MESSAGES");
        return Integer.parseInt(messages.get(0));
    }

    public void saveUserOrder(int user_id, int card_id, String date, String time) {
        userRepo.saveUserOrder(user_id, card_id, date, time);
    }

    public List<CardOrdered> getUsersOrderedCards(int user_id) {
        return cardOrderedRepository.getOrderedCards(user_id);
    }

    public int createUser(User user) {
        try {
            int count = userRepo.findCountByEmailId(user.getEmail());
            if (count < 1) {
                String hashed_Password = PasswordAuthenticator.getSaltedHash(user.getPassword());
                user.setPassword(hashed_Password);
                user.setType(BankSystemConstants.customer);
                userRepo.save(user);
                return BankSystemConstants.success;
            } else {
                return BankSystemConstants.emailAlreadyPresent;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return BankSystemConstants.failure;
        }
    }

    public User findRegisteredUser(int user_id) {
        return userRepo.findRegisteredUser(user_id);
    }

}
