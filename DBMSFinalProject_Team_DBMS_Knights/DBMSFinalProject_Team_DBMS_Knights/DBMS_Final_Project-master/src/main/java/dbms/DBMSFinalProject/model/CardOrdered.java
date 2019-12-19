package dbms.DBMSFinalProject.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Timer;

@Entity
public class CardOrdered {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int order_id;
    private int user_id;
    private int bank_card_id;

    @Temporal(TemporalType.DATE)
    private Date order_date;

    private LocalDateTime order_time;

    public CardOrdered(int user_id, int bank_card_id, Date order_date, LocalDateTime order_time) {
        this.user_id = user_id;
        this.bank_card_id = bank_card_id;
        this.order_date = order_date;
        this.order_time = order_time;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public LocalDateTime getOrder_time() {
        return order_time;
    }

    public void setOrder_time(LocalDateTime order_time) {
        this.order_time = order_time;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBank_card_id() {
        return bank_card_id;
    }

    public void setBank_card_id(int bank_card_id) {
        this.bank_card_id = bank_card_id;
    }

}