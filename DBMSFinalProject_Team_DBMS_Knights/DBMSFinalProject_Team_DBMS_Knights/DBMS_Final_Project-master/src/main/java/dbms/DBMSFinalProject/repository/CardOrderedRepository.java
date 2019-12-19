package dbms.DBMSFinalProject.repository;

import dbms.DBMSFinalProject.model.CardOrdered;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

@Repository
public interface CardOrderedRepository extends JpaRepository<CardOrdered, Long> {

    @Query(value = "SELECT co from CardOrdered co WHERE co.user_id =(:user_id)")
    List<CardOrdered> getOrderedCards(@Param("user_id") int user_id);

    @Query(value = "SELECT co.order_date, co.order_time, bc.card_name, bc.card_type, bc.card_benefits, bc.card_rating, bc.card_rewards, bc.card_poster, b.bank_name  from card_ordered co inner join bankcard bc on bc.bankcard_id = co.bank_card_id inner join bank b on b.bank_id = bc.ref_bank_id WHERE co.user_id =(:user_id)", nativeQuery = true)
    List<Collection> getAllOrderedListOfUser(@Param("user_id") int user_id);

}
