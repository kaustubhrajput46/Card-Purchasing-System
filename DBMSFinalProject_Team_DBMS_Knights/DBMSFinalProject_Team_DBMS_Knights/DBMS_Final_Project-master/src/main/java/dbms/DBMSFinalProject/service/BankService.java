package dbms.DBMSFinalProject.service;

import dbms.DBMSFinalProject.model.Bank;
import dbms.DBMSFinalProject.model.User;
import dbms.DBMSFinalProject.repository.BankRepository;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class BankService {

    @Autowired
    private BankRepository bankRepo;

    public List<Bank> getAllBankList() {
        List<Bank> banks = new ArrayList<>();
        banks.addAll(bankRepo.findAll());
        return banks;
    }

    public void insertBank(String bank_name, String bank_poster){
        bankRepo.insertBank( bank_name, bank_poster );
    }

    public void updateBank(int bankId, String bankName, String bankImange){
        bankRepo.updateBank(bankId, bankName, bankImange);
    }

    public void deleteBank(Long bank_id){
        bankRepo.deleteBank( bank_id );
    }
}
