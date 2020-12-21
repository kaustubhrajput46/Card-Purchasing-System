package dbms.DBMSFinalProject.service;

import dbms.DBMSFinalProject.repository.BankRepository;
import dbms.DBMSFinalProject.repository.Bankcardrepository;
import org.springframework.beans.factory.annotation.Autowired;

public class BankCardService {
    @Autowired
    private Bankcardrepository  bankcardrepository;

    public void insertBankCard(String bankcard_name, String bankcard_type, String bankcard_benefits, Float bankcard_rating, String bankcard_rewards, String bankcard_poster, int ref_bank_id, double card_price){
        bankcardrepository.insertBankCard(bankcard_name, bankcard_type, bankcard_benefits, bankcard_rating, bankcard_rewards, bankcard_poster, ref_bank_id, card_price);
    }

    public void deleteCard(Long bankcard_id){
        bankcardrepository.deleteCard(bankcard_id);
    }
}
