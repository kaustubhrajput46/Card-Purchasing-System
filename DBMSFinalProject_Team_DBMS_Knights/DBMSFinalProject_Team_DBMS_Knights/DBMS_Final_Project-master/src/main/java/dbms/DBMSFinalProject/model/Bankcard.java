package dbms.DBMSFinalProject.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;

@Entity
public class Bankcard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bankcard_id;
    private String card_name;
    private String card_type;
    private String card_benefits;
    private String card_rating;
    private String card_rewards;
    private String card_poster;
    private int ref_bank_id;
    private double card_price;

    public String getCard_rating() {
        return card_rating;
    }

    public void setCard_rating(String card_rating) {
        this.card_rating = card_rating;
    }

    public String getCard_rewards() {
        return card_rewards;
    }

    public String getCard_name() {
        return card_name;
    }

    public void setCard_name(String card_name) {
        this.card_name = card_name;
    }

    public String getCard_type() {
        return card_type;
    }

    public void setCard_type(String card_type) {
        this.card_type = card_type;
    }

    public void setCard_rewards(String card_rewards) {
        this.card_rewards = card_rewards;
    }

    public String getCard_poster() {
        return card_poster;
    }

    public void setCard_poster(String card_poster) {
        this.card_poster = card_poster;
    }

    public String getCard_benefits() {return card_benefits;}

    public void setCard_benefits(String card_benefits) {
        this.card_benefits = card_benefits;
    }

    public int getRef_bank_id() {
        return ref_bank_id;
    }

    public void setRef_bank_id(int ref_bank_id) {
        this.ref_bank_id = ref_bank_id;
    }

    public int getBankcard_id() {return bankcard_id;}

    public void setBankcard_id(int bankcard_id) {this.bankcard_id = bankcard_id;}

    public double getCard_price() {
        return card_price;
    }

    public void setCard_price(double card_price) {
        this.card_price = card_price;
    }
}