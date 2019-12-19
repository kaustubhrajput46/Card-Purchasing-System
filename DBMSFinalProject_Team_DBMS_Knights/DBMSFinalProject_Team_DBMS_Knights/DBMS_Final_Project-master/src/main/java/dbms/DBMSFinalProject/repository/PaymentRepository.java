package dbms.DBMSFinalProject.repository;

import dbms.DBMSFinalProject.model.CardOrdered;
import dbms.DBMSFinalProject.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {

}
