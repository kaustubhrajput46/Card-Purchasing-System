-- noinspection SqlNoDataSourceInspectionForFile
-- noinspection SqlDialectInspectionForFile
-- source path/dbmsFinalProject.sql

create database bankCardSystem;
use bankCardSystem;

create table BANK (
BANK_ID INT PRIMARY KEY AUTO_INCREMENT,
BANK_NAME VARCHAR(50) NOT NULL,
BANK_POSTER VARCHAR(100) NOT NULL,
UNIQUE (BANK_NAME)
);

create table USER (
USER_ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(200) NOT NULL,
ADDRESS VARCHAR(200) NOT NULL,
TYPE CHAR(1),
PASSWORD_RESET_TOKEN VARCHAR (50),
UNIQUE(EMAIL)
);

create table BANKCARD (
BANKCARD_ID INT PRIMARY KEY AUTO_INCREMENT,
REF_BANK_ID INT NOT NULL,
CARD_NAME VARCHAR(500) NOT NULL,
CARD_TYPE VARCHAR(100) NOT NULL,
CARD_BENEFITS VARCHAR(500),
CARD_RATING INT,
CARD_REWARDS VARCHAR(500),
CARD_POSTER VARCHAR(100),
CARD_PRICE DECIMAL(10,2) NOT NULL,
FOREIGN KEY (REF_BANK_ID) REFERENCES BANK(BANK_ID),
UNIQUE(CARD_NAME)
);

create table CARD_ORDERED (
ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
USER_ID INT NOT NULL,
BANK_CARD_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL,
ORDER_TIME TIME NOT NULL,
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID),
FOREIGN KEY (BANK_CARD_ID) REFERENCES BANKCARD(BANKCARD_ID)
);

create table PAYMENT (
PAYMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
ORDER_ID INT NOT NULL,
AMOUNT DECIMAL(10,2) NOT NULL,
FOREIGN KEY (ORDER_ID) REFERENCES CARD_ORDERED(ORDER_ID)
);

INSERT INTO BANK (BANK_NAME, BANK_POSTER) values
('JPMorgan-Chase', 'bank_1.jpeg'),
('Bank of America', 'bank_1.jpeg'),
('Wells Fargo', 'bank_3.jpeg'),
('Citi', 'bank_4.jpeg'),
('Capital One', 'bank_5.jpeg'),
('Discover', 'bank_5.jpeg'),
('HDFC', 'bank_5.jpeg'),
('SunTrust Banks', 'bank_5.jpeg'),
('American Express' , 'bank_6.jpeg');


-- password: sid1234567
INSERT INTO USER (name, email, password, address, type) values
('Siddhartha Dimania', 'siddimania@gmail.com', 'bJp48xVpIYlJf3oCljwSdvJs5COPphRcR1dfNUYaz+I=$AMiORHZyQGUAvu+xvDNyfx2FleByxy3O9F14mh3i/tk=', '204 Lakeside - Party House, 30605', 'C');
-- password: sid1234567
INSERT INTO USER (name, email, password, type, password_Reset_Token) values
('Kaustubh Rajput', 'kaustubhrajput46@gmail.com', 'bJp48xVpIYlJf3oCljwSdvJs5COPphRcR1dfNUYaz+I=$AMiORHZyQGUAvu+xvDNyfx2FleByxy3O9F14mh3i/tk=', 'A', 'not_defined');

--     Bank Name : JP Morgan- Chase
--     Debit Cards : https://www.chase.com/business/debit-cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Business ATM Card', 'Debit Card', 'Access over 16000 ATMs nationwide. ', 1,' Make withdraws at ATM; Advanced ATM chip enabled technology increases security over traditional magstripe cards.', 'debit_card.png', 5.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Business Associate Card', 'Debit Card', 'Delegate ATM deposits and withdrawal, while maintaining financial control.', 3, 'Set daily limits for point of sale purchases and withdrawal. Save time by not having to make and approve every purchase by yourself', 'debit_card.png', 5.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Business Employee Deposit Card', 'Debit Card', 'Gives Employees ability to make deposits at ATM.', 3, ' Does not allow Employees to withdraw, purchase, access financial information or make any changes to card or account.', 'debit_card.png', 10.5);

--     Credit Cards : https://creditcards.chase.com/
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Freedom Unlimited Credit Card', 'Credit Card', 'Best Freedom bonus offer: $200 cash back', 5,'Earn unlimited cash back. Earn unlimited 1.5% cash back on every purchase. No minimum to redeem for cash back', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Slate Credit Card', 'Credit Card', 'Low intro balance transfer offer.', 4, ' Transfer balances with an introductory fee of $0 during the first 60 days your account is open.60 day introductory balance transfer offer , save on interest and get your free credit score updated weekly with Credit Journey', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Chase Sapphire Preferred Credit Card', 'Credit Card', '60,000 bonus points after you spend $4,000 ', 5, 'Premium travel & dining rewards Earn 2X points on travel and dining at restaurants. ', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Southwest Rapid Rewards Plus Credit Card', 'Credit Card', 'Earn 40,000 points after yos spend $1,000 ', 4,'Earn reward flights with no blackout dates. 3,000 anniversary bonus points. Plus earn 2X points on Southwest purchases and 1X points on all other purchases. ', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Ink Business Cash Credit Card', 'Credit Card', '$500 bonus cash back after you spend $3,000 ', 4, '5% cash back in select business categories plus earn rewards on every purchase made for your business – with this no annual fee credit card', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (1, 'Ink Business Preferred Credit Card', 'Credit Card', '80,000 bonus points after you spend $5,000 ', 5, 'Reward your business with premium travel rewards. Earn 3X points on travel and other select business categories.', 'credit_card.png', 12.0);

--     Bank Name : Bank of America
--     Debit Cards : https://www.bankofamerica.com/deposits/checking/debit-card/
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Bank of America Debit Card', 'Debit Card', 'Using a Mastercard debit card gives you 24/7 access to the funds in your checking account.', 5,'Choose the deals you want in Online and Mobile Banking, pay with your debit card and the cash back gets automatically credited to your account', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Gemstone Debit Card', 'Debit Card', 'Get $60 cashback on domestic flight bookings of $1000', 5,'4 points per $100 spent on domestic and international transactions', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Expressions Debit Card', 'Debit Card', 'Now personalize your Debit Card as you like.', 5,'Complimentary airport lounge address. Earn 4 PAYBACK Points on every $50 spent at any merchant establishment', 'debit_card.png', 12.0);

--     Credit Cards : https://www.bankofamerica.com/credit-cards/#filter
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Bank of America Cash Rewards', 'Credit Card', 'Introductory 0% APR for your first 15 billing cycles for purchases.', 5,' 3% cash back in the category of your choice, 2% cash back at grocery stores and wholesale clubs and unlimited 1% cash back on all other purchases', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Bank of America Travel Rewards', 'Credit Card', 'Introductory 0% APR for your first 12 billing cycles for purchases. ', 4, 'Earn unlimited 1.5 points for every $1 you spend on all purchases everywhere, every time and no expiration on points. No blackout dates or restrictions and points do not expire', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Bank of America Premium Rewards', 'Credit Card', 'Redeem for cash back as a deposit into Bank of America® checking or savings accounts', 5, 'Earn unlimited points, that don''t expire – 2 points for every $1 spent on travel and dining purchases and 1.5 points per $1 on all other purchases. Get up to $200 in combined Airline Incidental and TSA Pre/ Global Entry Statement Credits', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'MLB', 'Credit Card', 'Introductory 0% APR for your first 15 billing cycles for purchases.', 5,'3% cash back in the category of your choice, 2% cash back at grocery stores and wholesale clubs and unlimited 1% cash back on all other purchases . Support a team you love and get a $200 online cash rewards bonus offer.', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'World WildLife Fund', 'Credit Card', 'Introductory 0%† APR for your first 15 billing cycles for purchases.. ', 4, '3% cash back in the category of your choice, 2% cash back at grocery stores and wholesale clubs and unlimited 1% cash back on all other purchases. Help support WWF and get a $200 online cash rewards bonus offer.', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (2, 'Amtrak Guest Rewards World Mastercard', 'Credit Card', 'Cash in with a 20% rebate, in the form of a statement credit', 4, 'Earn 3 Amtrak Guest Rewards® points per $1 spent on Amtrak travel (including onboard purchases), 2 points per $1 spent on other qualifying travel purchases, and 1 point per $1 spent on all other purchases. 20,000 bonus points after qualifying purchases – that’s worth up to $500 in Amtrak travel', 'credit_card.png', 12.0);

--     Bank Name : Wells Fargo
--     Debit Cards : https://www.wellsfargo.com/debit-card/?linkLoc=fn
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Debit Card', 'Debit Card', 'Access your accounts at ATM. ', 5,'Use your debit card for purchases. Add your debit card to a digital wallet.', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Priority Debit Card', 'Debit Card', 'Enjoy 25% discount on Movie tickets ', 5,'1 / 3 points for every $20 spent on domestic / international spends ', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Prestige Debit Card', 'Debit Card', 'Get 3% cashback on your travel and hotel bookings', 5,'2 points for every $30 spent on domestic / international spends', 'debit_card.png', 12.0);

--     Credit Cards : https://www.wellsfargo.com/credit-cards/find-a-credit-card/all/
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Propel American Express Card', 'Credit Card', '30,000 bonus points when you spend $3,000 in purchases in the first 3 months – a $300 cash redemption value', 5,' Earn 3x points on: Eating out and ordering in,Gas stations, ride shares, and transit, Flights, hotels, home stays, and car rentals, Popular streaming services. ', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Cash Wise Visa Card', 'Credit Card', ' lowest possible intro APR on purchases and balance transfers for 15 months', 4, '$150 cash rewards bonus when you spend $500 in purchases in the first 3 months. Unlimited 1.5% cash rewards on purchases', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Rewards Card', 'Credit Card', 'Lowest possible intro APR on balance transfers and purchases', 5, '5x rewards points earned for up to $12,500 spent on gas, grocery, and drugstore purchases for the first 6 months and 1x points on other purchases - enjoy 5 years to use the points you earn', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Cash back College Card', 'Credit Card', 'Build credit history while you’re in college ', 5,'3% cash rewards earned for up to $2,500 spent on gas, grocery, and drugstore purchases for the first 6 months. Enjoy 1% cash rewards for other purchases', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Secured Credit Card', 'Credit Card', 'Establish credit history. ', 4, 'Get started, if approved, with as little as a $300 security deposit.With responsible use you may become eligible for an upgrade to an unsecured Wells Fargo credit card. Not all accounts will qualify.', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (3, 'Wells Fargo Platinum Card', 'Credit Card', 'Lowest Possible Intro APR for 18 months', 4, 'Account protection features such as Zero Liability protection for promptly reported unauthorized transactions, alerts, cell phone protection.', 'credit_card.png', 12.0);

--     Bank Name : Citi Bank
--     Debit Cards : https://online.citi.com/US/JRS/pands/detail.do?ID=ATMCard
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'The Citi Bank Debit Card', 'Debit Card', ' Accepted at millions of merchants worldwide. ', 5,' Citibank Debit Card customers get access to some of the best in live music, sports, dining, family entertainment and more .', 'debit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'Expression Wave Debit Card', 'Debit Card', 'Expressions Paywave NFC Card can enable you to make quick contactless payments', 5,'Get upto 15% off on dining at more than 800 restaurants', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'Business Debit Card', 'Debit Card', ' Zero liability protection', 5,'Gift voucher worth $300 for BestBuy or Walmart', 'debit_card.png', 12.0);

--     Credit Cards : https://www.citi.com/credit-cards/compare-credit-cards/citi.action?ID=view-all-credit-cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'Citi Premier Card', 'Credit Card', 'Purchase Rate: 17.49% - 25.49% variable APR based on your creditworthiness', 5,' Earn 60,000 bonus points after spending $4,000 within the first 3 months of account opening.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'Citi Double Cash Card', 'Credit Card', ' 0% Intro APR on balance transfers for 18 months', 5, 'Earn cash back TWICE. Get 2% on every purchase with 1% cash back when you buy, plus an additional 1% as you pay for those purchases. ', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (4, 'Citi / AAdvantage Platinum Select World Elite Mastercard', 'Credit Card', ' 17.49% - 25.49% variable APR based on your creditworthiness(Fee waived for the first 12 months)', 4, 'Earn 50,000 American Airlines AAdvantage® bonus miles after making $2,500 in purchases within the first 3 months of account opening.', 'credit_card.png', 12.0);

--     Bank Name : Capital One
--     Debit Cards : https://www.capitalone.com/learn-grow/money-management/choosing-with-confidence (didn't not find any info on debit card it shows checking account info and get debit card from that)
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Capital One Visa Debit Card', 'Debit Card', 'Annual Fee: $99 (Fee waived for the first 12 months', 5,'Earn 70,000 American Airlines AAdvantage® bonus miles after spending $4,000 in purchases within the first 4 months of account opening.', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Capital One Mastercard', 'Debit Card', 'No Annual Fee', 4, 'Earn 20,000 Expedia Rewards bonus points after $1,000 in purchases within 3 months of account opening.', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Capital One Power Debit Card', 'Debit Card', 'No Annual Fee ', 4, 'Earn 10,000 Rewards bonus points after $1,000 in purchases within 3 months of account opening.', 'debit_card.png', 10.0);

--     Credit Cards : https://www.capitalone.com/credit-cards/compare/
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Venture Rewards', 'Credit Card', '17.49% - 24.74% variable APR', 5,' Earn unlimited 2X miles per dollar on every purchase, every day Earn 50,000 bonus miles once you spend $3,000 on purchases within the first 3 months from account opening', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Venture One Rewards', 'Credit Card', ' 0% intro APR for 12 months', 4, 'Earn unlimited 1.25 miles per dollar on every purchase, every day. Earn 20,000 bonus miles once you spend $1,000 on purchases within the first 3 months from account opening', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Quick Silver Rewards', 'Credit Card', '3% fee on the amounts transferred within the first 15 months.', 4, 'Earn unlimited 1.5% cash back on every purchase, every day. Earn a one-time $150 cash bonus once you spend $500 on purchases within 3 months from account opening', 'credit_card.png' , 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Savor One Rewards', 'Credit Card', '0% intro APR for 15 months; 15.74% - 25.74% variable APR after that. 3% fee on the amounts transferred within the first 15 months', 5,'Earn unlimited 3% cash back on dining and entertainment, 2% at grocery stores and 1% on all other purchases. Earn a one-time $150 cash bonus once you spend $500 on purchases within the first 3 months from account opening', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Journey Student Rewards', 'Credit Card', '26.99% variable APR; No Transfer Fee. No annual fee ', 4, 'Earn 1% cash back on all your purchases. Pay on time to boost your cash back to a total of 1.25% for that month.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (5, 'Secured Master Card', 'Credit Card', '26.99% variable APR; No Transfer Fee. No annual fee', 4, 'Refundable deposit of $49, $99 or $200 gets you a $200 initial credit line.', 'credit_card.png', 10.0);

-- Bank Name : Discover
-- Credit Cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'Discover it Cash Back card', 'Credit Card', 'Earn 5% Cash Back', 1,'Earn 5% cash back at different places each quarter like gas stations, grocery stores, restaurants, Amazon.com and more, up to the quarterly maximum, each time you activate. Plus, earn unlimited 1% cash back on all other purchases — automatically.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'NHL Discover it Card', 'Credit Card', 'Earn 5% Cash Back', 3, 'Earn 5% cash back at different places each quarter like gas stations, grocery stores, restaurants, Amazon.com and more, up to the quarterly maximum, each time you activate. Plus, earn unlimited 1% cash back on all other purchases — automatically.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'Discover it Gas and Restaurant Card', 'Credit Card', 'Earn 2% Cash Back', 3, 'At gas stations and restaurants on up to $1,000 in combined purchases each quarter. Plus, earn unlimited 1% cash back on all other purchases — automatically.', 'credit_card.png', 10.0);
-- Forex Cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'Contactless Forex card', 'Forex Card', 'Powered by Visa’s payWave technology', 4,' Forex Card will allow you to pay by simply ‘waving’ your card. With a secure, contactless CHIP technology, you will spend less time at the cash counter, thereby giving you the freedom to explore the destination to the fullest.', 'forex_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'Image Forex Card', 'Forex Card', 'You can also design your own Forex Card with a personalised image of your choice', 3, 'Capture the destinations you love, or relive memories from your favourite holidays, it’s all up to you!', 'forex_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (6, 'Coral Travel Card', 'Forex Card', 'Lost card/ Counter card liability coverage of $500', 3, '$300 Uber voucher on buying travel card and loading min. 1000 USD', 'forex_card.png', 10.0);


--     Bank Name : HDFC
--     Debit Cards : https://www.hdfcbank.com/personal/pay/cards/debit-cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'Millenia Debit Card', 'Debit Card', ' 4 Complimentary Domestic Airport Lounge access annually', 5,'2.5% CashBack on all online spends. 1% CashBack on all offline spends and Wallet reloads', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'EasyShop Imperia Platinum Chip Debit Card', 'Debit Card', ' Up to $16000 Personal Accidental Death Cover (rail/ road/ air).', 5,'Upto 1% CashBack on retail and online shopping', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'EasyShop Preffered Platinum ', 'Debit Card', 'Up to $16000 Personal Accidental Death Cover (rail/ road/ air).', 5,'Upto 1% CashBack on retail and online shopping. Daily limit of $1000 for ATM withdrawals and $5000 for retail / online shopping', 'debit_card.png', 12.0);

--     Credit Cards : https://www.hdfcbank.com/personal/pay/cards/credit-cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'Easy EMI Card', 'Credit Card', 'Auto EMI conversion of spends above $100. 1% Fuel charge waiver', 5,'5% CashBack on shopping. 2.5% CashBack on all online spends. 1% CashBack on all offline spends and Wallet reloads.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'Infinia Credit Card', 'Credit Card', ' Unlimited airport lounge access across the globe. Complimentary one-year Club Marriott membership', 5, 'Get 10 times Reward Points on your travel and shopping spends. Get 2 times Reward Points on your Dining spends at stand-alone restaurants', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (7, 'Dinners Club Black Credit Card', 'Credit Card', ' Unlimited complimentary worldwide Airport lounge access for Primary and Add On customers.', 4, 'Earn 10X points on select partners. Earn 2x points on weekend dining spends. Redeem Reward Point for AirMiles across British Airways Executive Club', 'credit_card.png', 12.0);

--     Bank Name : Sun Trust
--     Debit Cards : https://www.suntrust.com/personal-banking/checking/checking-account-features/debit-cards
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'SunTrust Mastercard Classic Debit Card', 'Debit Card', '100% protection from unauthorized purchases. Receive a refund, up to $250', 5,'In the event you are dissatisfied with your item within 60 days of purchase and the store will not accept the item for return.', 'debit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'SunTrust Mastecard Global Debit Card', 'Debit Card', '100% protection from unauthorized purchases. Receive a refund, up to $350 ', 5,'In the event you are dissatisfied with your item within 60 days of purchase and the store will not accept the item for return.', 'debit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'SunTrust Mastercard World Debit Card', 'Debit Card', '100% protection from unauthorized purchases.Receive a refund, up to $500 ', 5,'In the event you are dissatisfied with your item within 60 days of purchase and the store will not accept the item for return.', 'debit_card.png', 12.0);

--     Credit Cards : https://www.suntrust.com/credit-cards?icid=compare_creditcard_ccacq_hero_na_l2_487_487_default#comparisonchart
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'Cash Rewards Credit Card', 'Credit Card', '0.0% intro APR on purchases and balance transfers for 15 months ', 5,'2% Unlimited Cash Back on gas and grocery qualifying purchases after the promotional period ends. 10%, 25% or 50%5, based on your deposit relationship with SunTrust when you redeem rewards directly to a SunTrust Checking, Savings or Money Market account', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'Travel Rewards Credit Card' , 'Credit Card', 'Competitive variable rate, currently 12.74%–22.74% APR, thereafter. Balance Transfer fee of $10 or 3% of the amount of the transfer, whichever is greater will apply.', 5, '$250 Statement Credit after you spend $3,000 on qualifying purchases8 in the first three months after account opening. 3% Unlimited Cash Back on travel qualifying purchases. 2% Unlimited Cash Back on dining qualifying purchases', 'credit_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (8, 'Prime Rewards Credit Card', 'Credit Card', '3 years intro offer at Prime Rate (currently 4.75% variable APR) ', 4, '$100 Statement Credit after you spend $500 on qualifying purchases in the first 3 months after account opening. 1% Unlimited Cash Back on all qualifying purchases', 'credit_card.png', 12.0);

--     Bank Name : American Express
--     Debit Cards : https://www.americanexpress.com/us/prepaid/view-all-cards.html
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Serve', 'Debit Card', ' Includes fraud protection.', 5,'FREE Direct Deposit, FREE Online Bill Pay, plus tools to help you manage your money.', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Serve Free Reloads', 'Debit Card', '  No credit check, FREE to register online, FREE Online Bill Pay, and fraud protection.', 5,'Shop online with your Card virtually anywhere American Express Cards are accepted.All the benefits of Serve, plus FREE Cash Reloads at over 45,000 locations.', 'debit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Serve Cash BAck', 'Debit Card', 'All the benefits of Serve,FREE Direct Deposit, FREE Online Bill Pay, and fraud protection.', 5,' Shop with your Card and get 1% Cash Back added to your Account for use at millions of locations in-store or online.', 'debit_card.png', 10.0);

--     Credit Cards : https://www.americanexpress.com/us/credit-cards/?inav=menu_cards_pc_viewallcards&category=all
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Gold Card', 'Credit Card', 'Enjoy every trip abroad with no foreign transaction fees from American Express with the Gold Card. ', 5,'Earn 4X Membership Rewards points when you dine at restaurants worldwide. Earn 4X Membership Rewards points at US supermarkets on up to $25,000 per calendar year in purchases.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Green Card' , 'Credit Card', ' Use the American Express® Green Card to purchase lounge access through LoungeBuddy ', 5, '3X Membership Rewards points on travel including flights, hotels, transit, taxis, and rides haring services. Earn 3X Membership Rewards points at restaurants worldwide.', 'credit_card.png', 10.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'Amex Everyday Credit card', 'Credit Card', '0% intro APR on purchases and balance transfers for 15 months', 4, 'Use your Card 20 or more times on purchases in a billing period and earn 20% more points on those purchases less returns and credits. At US supermarkets on up to $6,000 per year in purchases. Earn 1X Membership Rewards point for every eligible dollar you spend. ', 'credit_card.png', 12.0);

-- Forex Cards:
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'Personal Gift Cards', 'Forex Card', 'Choose a card design, value and you have got a perfect way to celebrate trip', 5,'Get $1 for each $50 load in card', 'forex_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'Business Gift Cards', 'Forex Card', 'Business Gift Cards come in designs for all occasions. ', 5,'Perfect for everything from a timely team thank you to a motivating sales incentive.', 'forex_card.png', 12.0);
INSERT INTO BANKCARD (REF_BANK_ID, CARD_NAME, CARD_TYPE, CARD_BENEFITS, CARD_RATING, CARD_REWARDS, CARD_POSTER, CARD_PRICE) VALUES (9, 'American Express Platinum Card', 'Forex Card', 'The American Express Global Lounge Collection unlocks access to more than 1,200 airport lounges across 130 countries and counting.', 4, 'Get 5X Membership Rewards points for flights booked directly with airlines or with American Express Travel. Get 5X Membership Rewards points on prepaid hotels booked on amextravel.com.', 'forex_card.png', 12.0);
