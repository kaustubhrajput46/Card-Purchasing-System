package dbms.DBMSFinalProject.repository;

import dbms.DBMSFinalProject.model.Bankcard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Bankcardrepository extends JpaRepository<Bankcard, Long> {

    @Query(value = "SELECT b from Bankcard b WHERE b.ref_bank_id =(:ref_bank_id) AND b.card_type =(:card_type)")
    List<Bankcard> getBankCards(@Param("ref_bank_id") int ref_bank_id, @Param("card_type") String card_type);

    @Query(value = "SELECT b from Bankcard b WHERE b.bankcard_id =(:bankcard_id)")
    Bankcard getCardDetails(@Param("bankcard_id") int bankcard_id);

    @Query(value = "SELECT b.card_price from Bankcard b WHERE b.bankcard_id =(:bankcard_id)")
    double getCardPrice(@Param("bankcard_id") int bankcard_id);
}
