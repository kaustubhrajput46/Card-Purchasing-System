package dbms.DBMSFinalProject.model;
import javax.persistence.*;

@Entity
public class Bank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bank_id;
    private String bank_name;
    private String bank_poster;

    public Bank() {
    }

    public int getBank_id() {
        return bank_id;
    }

    public void setBank_id(int bank_id) {
        this.bank_id = bank_id;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getBank_poster() {
        return bank_poster;
    }

    public void setBank_poster(String bank_poster) {
        this.bank_poster = bank_poster;
    }

}
