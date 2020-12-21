package dbms.DBMSFinalProject.repository;

import dbms.DBMSFinalProject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u.password from User u where u.email=(:user_email)")
    String findStoredPassword(@Param("user_email") String user_email);

    @Query("SELECT u from User u where u.user_id=(:user_id)")
    User findRegisteredUser(@Param("user_id") int user_id);

    @Query("SELECT u.type from User u where u.email=(:user_email)")
    String findUserType(@Param("user_email") String user_email);

    @Query("SELECT u.name from User u where u.email=(:user_email)")
    String findUserName(@Param("user_email") String user_email);

    @Query("SELECT count(u) from User u where u.email=(:email)")
    int findCountByEmailId(@Param("email") String email);

    @Query("SELECT u.user_id from User u where u.email=(:email)")
    int getUserIdWithEmail(@Param("email") String email);

    @Modifying
    @Transactional
    @Query("update User u set u.password_Reset_Token=(:password_Reset_Token) where u.email=(:email)")
    void updatePasswordResetToken(@Param("password_Reset_Token") String password_Reset_Token , @Param("email") String email);

    @Query("SELECT count(u) from User u where u.password_Reset_Token=(:token)")
    int findResetPasswordToken(@Param("token") String token);

    @Query("SELECT u.user_id from User u where u.password_Reset_Token=(:reset_token)")
    int getUserIdWithResetToken(@Param("reset_token") String reset_token);

    @Modifying
    @Transactional
    @Query("update User u set u.password=(:user_password) where u.user_id=(:user_id)")
    void updateUserPasswordByID(@Param("user_password") String user_password, @Param("user_id") int user_id);

    @Modifying
    @Query(value = "insert into card_ordered (user_id, bank_card_id, order_date, order_time) VALUES (:user_id, :bank_card_id, :order_date, :order_time)", nativeQuery = true)
    @Transactional
    void saveUserOrder(@Param("user_id") int user_id, @Param("bank_card_id") int bank_card_id, @Param("order_date") String order_date, @Param("order_time") String order_time);

}
