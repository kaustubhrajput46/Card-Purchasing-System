package dbms.DBMSFinalProject.repository;

import dbms.DBMSFinalProject.model.Bankcard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Bankcardrepository extends JpaRepository<Bankcard, Long> {

    //Kaustubh Start
//    @Query( value = "SELECT b from Bankcard b WHERE b.bank_id =(:bank_id)")
//    List<Bankcard> getBankcard_id1(@Param("bank_id") int bank_id);
    @Query( value = "SELECT b from Bankcard b WHERE b.ref_bank_id =(:ref_bank_id)")
    List<Bankcard> getBankcard_id1(@Param("ref_bank_id") int ref_bank_id);
    //Kaustubh End

    @Query(value = "SELECT b from Bankcard b WHERE b.ref_bank_id =(:ref_bank_id) AND b.card_type =(:card_type)")
    List<Bankcard> getBankCards(@Param("ref_bank_id") int ref_bank_id, @Param("card_type") String card_type);

    @Query(value = "SELECT b from Bankcard b WHERE b.bankcard_id =(:bankcard_id)")
    Bankcard getCardDetails(@Param("bankcard_id") int bankcard_id);

    @Query(value = "SELECT b.card_price from Bankcard b WHERE b.bankcard_id =(:bankcard_id)")
    double getCardPrice(@Param("bankcard_id") int bankcard_id);

    //Kaustubh start
    @Modifying
    @Query(value = "insert into bankcard (card_name, card_type, card_benefits, card_rating, card_rewards, card_poster, ref_bank_id, card_price) " +
            "VALUES (:card_name, :card_type, :card_benefits, :card_rating, :card_rewards, :card_poster, :ref_bank_id, :card_price)", nativeQuery = true)
    @Transactional
    void insertBankCard(@Param("card_name") String card_name, @Param("card_type") String card_type, @Param( "card_benefits" ) String card_benefits,
                        @Param("card_rating") Float card_rating, @Param( "card_rewards" ) String card_rewards,
                        @Param( "card_poster" ) String card_poster, @Param( "ref_bank_id" ) int ref_bank_id, @Param("card_price")double bankcardPrice);

    @Modifying
    @Query(value = "delete from Bankcard b where b.bankcard_id=(:bankcard_id)", nativeQuery = true)
    @Transactional
    void deleteCard (@Param( "bankcard_id") Long bankcard_id );
    //Kaustubh End
}
