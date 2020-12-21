package dbms.DBMSFinalProject.helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailHelper {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendMail(String emailID, String subject, String bodyText) {
        try {
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setTo(emailID);
            msg.setSubject(subject);
            msg.setText(bodyText);

            javaMailSender.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
