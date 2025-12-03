# Bank Reconciliation SQL Challenge – Portfolio Document

## 1. Introduction

* Overview of bank reconciliation using SQL.
* Tables used: `bank_a_transactions`, `bank_b_transactions`, `settlement`.
* Common SQL commands in PostgreSQL, MySQL, and Oracle.

## 2. Database Schema

### 2.1 Bank A Transactions

CREATE TABLE bank_a_transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_number VARCHAR(20),
    amount NUMERIC(15,2),
    transaction_date DATE,
    description VARCHAR(100),
    reference_number VARCHAR(50) UNIQUE
);

### 2.2 Bank B Transactions

CREATE TABLE bank_b_transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_number VARCHAR(20),
    amount NUMERIC(15,2),
    transaction_date DATE,
    description VARCHAR(100),
    reference_number VARCHAR(50) UNIQUE
);

### 2.3 Settlement Table

CREATE TABLE settlement (
    settlement_id SERIAL PRIMARY KEY,
    reference_number VARCHAR(50) UNIQUE,
    account_number VARCHAR(20),
    bank_name VARCHAR(20),
    amount NUMERIC(15,2),
    settlement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    settlement_status VARCHAR(20) DEFAULT 'Pending',
    remarks VARCHAR(200)
);


2️⃣ Insert Sample Transactions for Bank A
INSERT INTO bank_a_transactions (account_number, amount, transaction_date, description, reference_number)
VALUES
('ACC10001', 1000, '2025-11-01', 'Deposit', 'REF001'),
('ACC10002', 500, '2025-11-02', 'Withdrawal', 'REF002'),
('ACC20001', 1500, '2025-11-01', 'Deposit', 'REF003'),
('ACC30001', 2000, '2025-11-03', 'Transfer', 'REF004'),
('ACC40001', 2500, '2025-11-04', 'Deposit', 'REF005'),
('ACC50001', 3000, '2025-11-05', 'Withdrawal', 'REF006'),
('ACC10001', 1200, '2025-11-06', 'Deposit', 'REF007'),
('ACC10002', 700, '2025-11-07', 'Deposit', 'REF008'),
('ACC20001', 900, '2025-11-08', 'Withdrawal', 'REF009'),
('ACC30001', 1100, '2025-11-09', 'Deposit', 'REF010'),
('ACC40001', 1500, '2025-11-10', 'Withdrawal', 'REF011'),
('ACC50001', 2000, '2025-11-11', 'Deposit', 'REF012'),
('ACC10001', 800, '2025-11-12', 'Transfer', 'REF013'),
('ACC10002', 400, '2025-11-13', 'Deposit', 'REF014'),
('ACC20001', 600, '2025-11-14', 'Withdrawal', 'REF015'),
('ACC30001', 700, '2025-11-15', 'Deposit', 'REF016'),
('ACC40001', 1200, '2025-11-16', 'Withdrawal', 'REF017'),
('ACC50001', 500, '2025-11-17', 'Deposit', 'REF018'),
('ACC10001', 1300, '2025-11-18', 'Deposit', 'REF019'),
('ACC10002', 900, '2025-11-19', 'Withdrawal', 'REF020'),
('ACC20001', 1400, '2025-11-20', 'Deposit', 'REF021'),
('ACC30001', 1600, '2025-11-21', 'Withdrawal', 'REF022'),
('ACC40001', 1100, '2025-11-22', 'Deposit', 'REF023'),
('ACC50001', 1700, '2025-11-23', 'Withdrawal', 'REF024'),
('ACC10001', 800, '2025-11-24', 'Deposit', 'REF025'),
('ACC10002', 600, '2025-11-25', 'Withdrawal', 'REF026'),
('ACC20001', 750, '2025-11-26', 'Deposit', 'REF027'),
('ACC30001', 900, '2025-11-27', 'Withdrawal', 'REF028'),
('ACC40001', 1000, '2025-11-28', 'Deposit', 'REF029'),
('ACC50001', 1300, '2025-11-29', 'Withdrawal', 'REF030');

3️⃣ Insert Sample Transactions for Bank B
INSERT INTO bank_b_transactions (account_number, amount, transaction_date, description, reference_number)
VALUES
('ACC10001', 1000, '2025-11-01', 'Deposit', 'REF001'), -- match
('ACC10002', 500, '2025-11-02', 'Withdrawal', 'REF002'), -- match
('ACC20001', 1500, '2025-11-01', 'Deposit', 'REF003'), -- match
('ACC30001', 2100, '2025-11-03', 'Transfer', 'REF004'), -- mismatch
('ACC40001', 2500, '2025-11-04', 'Deposit', 'REF005'), -- match
('ACC50001', 3000, '2025-11-05', 'Withdrawal', 'REF006'), -- match
('ACC10001', 1200, '2025-11-06', 'Deposit', 'REF007'), -- match
('ACC10002', 700, '2025-11-07', 'Deposit', 'REF008'), -- match
('ACC20001', 950, '2025-11-08', 'Withdrawal', 'REF009'), -- mismatch
('ACC30001', 1100, '2025-11-09', 'Deposit', 'REF010'), -- match
('ACC40001', 1400, '2025-11-10', 'Withdrawal', 'REF011'), -- mismatch
('ACC50001', 2000, '2025-11-11', 'Deposit', 'REF012'), -- match
('ACC10001', 800, '2025-11-12', 'Transfer', 'REF013'), -- match
('ACC10002', 400, '2025-11-13', 'Deposit', 'REF014'), -- match
('ACC20001', 600, '2025-11-14', 'Withdrawal', 'REF015'), -- match
('ACC30001', 750, '2025-11-15', 'Deposit', 'REF016'), -- mismatch
('ACC40001', 1200, '2025-11-16', 'Withdrawal', 'REF017'), -- match
('ACC50001', 500, '2025-11-17', 'Deposit', 'REF018'), -- match
('ACC10001', 1300, '2025-11-18', 'Deposit', 'REF019'), -- match
('ACC10002', 900, '2025-11-19', 'Withdrawal', 'REF020'), -- match
('ACC20001', 1450, '2025-11-20', 'Deposit', 'REF021'), -- mismatch
('ACC30001', 1600, '2025-11-21', 'Withdrawal', 'REF022'), -- match
('ACC40001', 1100, '2025-11-22', 'Deposit', 'REF023'), -- match
('ACC50001', 1800, '2025-11-23', 'Withdrawal', 'REF024'), -- mismatch
('ACC10001', 800, '2025-11-24', 'Deposit', 'REF025'), -- match
('ACC10002', 600, '2025-11-25', 'Withdrawal', 'REF026'), -- match
('ACC20001', 750, '2025-11-26', 'Deposit', 'REF027'), -- match
('ACC30001', 900, '2025-11-27', 'Withdrawal', 'REF028'), -- match
('ACC40001', 1000, '2025-11-28', 'Deposit', 'REF029'), -- match
('ACC50001', 1350, '2025-11-29', 'Withdrawal', 'REF030'); -- mismatch


----- Populate Settlement Table Automatically
--  Matched Transactions

INSERT INTO settlement (
    reference_number, account_number, bank_name, amount, settlement_status, remarks
)
SELECT 
    a.reference_number, 
    a.account_number,
    'Bank A',
    a.amount,
    'Settled',
    'Matched with Bank B'
FROM bank_a_transactions a
JOIN bank_b_transactions b 
    ON a.reference_number = b.reference_number
WHERE a.amount = b.amount;


-- Select Pending / Mismatched Transactions from Bank B (only insert if not already in settlement)
INSERT INTO settlement (
    reference_number, account_number, bank_name, amount, settlement_status, remarks
)
SELECT 
    b.reference_number, 
    b.account_number,
    'Bank B',
    b.amount,
    'Pending',
    CASE 
        WHEN a.reference_number IS NULL THEN 'Missing in Bank A'
        ELSE 'Amount mismatch with Bank A'
    END
FROM bank_b_transactions b
LEFT JOIN bank_a_transactions a 
    ON b.reference_number = a.reference_number
WHERE (a.reference_number IS NULL OR b.amount <> a.amount)
  AND b.reference_number NOT IN (SELECT reference_number FROM settlement);


------------------------------------------------------------------------------
️---### Settlement Queries

-- View all settlements
SELECT * FROM settlement ORDER BY settlement_status DESC, settlement_date;

-----Result:
 settlement_id | reference_number | account_number | bank_name | amount  |      settlement_date       | settlement_status |           remarks
---------------+------------------+----------------+-----------+---------+----------------------------+-------------------+-----------------------------
             1 | REF001           | ACC10001       | Bank A    | 1000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             2 | REF002           | ACC10002       | Bank A    |  500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             3 | REF003           | ACC20001       | Bank A    | 1500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             4 | REF005           | ACC40001       | Bank A    | 2500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             5 | REF006           | ACC50001       | Bank A    | 3000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             6 | REF007           | ACC10001       | Bank A    | 1200.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             7 | REF008           | ACC10002       | Bank A    |  700.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             8 | REF010           | ACC30001       | Bank A    | 1100.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             9 | REF012           | ACC50001       | Bank A    | 2000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            10 | REF013           | ACC10001       | Bank A    |  800.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            11 | REF014           | ACC10002       | Bank A    |  400.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            12 | REF015           | ACC20001       | Bank A    |  600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            13 | REF017           | ACC40001       | Bank A    | 1200.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            14 | REF018           | ACC50001       | Bank A    |  500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            15 | REF019           | ACC10001       | Bank A    | 1300.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            16 | REF020           | ACC10002       | Bank A    |  900.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            17 | REF022           | ACC30001       | Bank A    | 1600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            18 | REF023           | ACC40001       | Bank A    | 1100.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            19 | REF025           | ACC10001       | Bank A    |  800.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            20 | REF026           | ACC10002       | Bank A    |  600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            21 | REF027           | ACC20001       | Bank A    |  750.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            22 | REF028           | ACC30001       | Bank A    |  900.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            23 | REF029           | ACC40001       | Bank A    | 1000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            24 | REF004           | ACC30001       | Bank A    | 2000.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            25 | REF009           | ACC20001       | Bank A    |  900.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            26 | REF011           | ACC40001       | Bank A    | 1500.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            27 | REF016           | ACC30001       | Bank A    |  700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            28 | REF021           | ACC20001       | Bank A    | 1400.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            29 | REF024           | ACC50001       | Bank A    | 1700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            30 | REF030           | ACC50001       | Bank A    | 1300.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
(30 rows)

----Copy selection to local drive
\copy (SELECT * FROM settlement ORDER BY settlement_status DESC, settlement_date)TO 'C:/Users/benja/Portfolio/Bank_Reconciliation_SQL_Challenge.csv' WITH CSV HEADER;

--------------------------------------------------------------------------

5️⃣ Sample Settlement Queries
-- View all settlements
SELECT * FROM settlement ORDER BY amount DESC, settlement_date;

----Result:
 settlement_id | reference_number | account_number | bank_name | amount  |      settlement_date       | settlement_status |           remarks
---------------+------------------+----------------+-----------+---------+----------------------------+-------------------+-----------------------------
             5 | REF006           | ACC50001       | Bank A    | 3000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             4 | REF005           | ACC40001       | Bank A    | 2500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             9 | REF012           | ACC50001       | Bank A    | 2000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            24 | REF004           | ACC30001       | Bank A    | 2000.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            29 | REF024           | ACC50001       | Bank A    | 1700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            17 | REF022           | ACC30001       | Bank A    | 1600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             3 | REF003           | ACC20001       | Bank A    | 1500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            26 | REF011           | ACC40001       | Bank A    | 1500.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            28 | REF021           | ACC20001       | Bank A    | 1400.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            15 | REF019           | ACC10001       | Bank A    | 1300.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            30 | REF030           | ACC50001       | Bank A    | 1300.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
             6 | REF007           | ACC10001       | Bank A    | 1200.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            13 | REF017           | ACC40001       | Bank A    | 1200.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             8 | REF010           | ACC30001       | Bank A    | 1100.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            18 | REF023           | ACC40001       | Bank A    | 1100.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             1 | REF001           | ACC10001       | Bank A    | 1000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            23 | REF029           | ACC40001       | Bank A    | 1000.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            22 | REF028           | ACC30001       | Bank A    |  900.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            16 | REF020           | ACC10002       | Bank A    |  900.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            25 | REF009           | ACC20001       | Bank A    |  900.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            19 | REF025           | ACC10001       | Bank A    |  800.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            10 | REF013           | ACC10001       | Bank A    |  800.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            21 | REF027           | ACC20001       | Bank A    |  750.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             7 | REF008           | ACC10002       | Bank A    |  700.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            27 | REF016           | ACC30001       | Bank A    |  700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            12 | REF015           | ACC20001       | Bank A    |  600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            20 | REF026           | ACC10002       | Bank A    |  600.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            14 | REF018           | ACC50001       | Bank A    |  500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
             2 | REF002           | ACC10002       | Bank A    |  500.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
            11 | REF014           | ACC10002       | Bank A    |  400.00 | 2025-12-02 11:11:09.882436 | Settled           | Matched with Bank B
(30 rows)
----copy to local file
\copy (SELECT * FROM settlement ORDER BY settlement_status ASC, settlement_date) TO 'C:/Users/benja/Portfolio/Bank_Reconciliation_SQL_Challenge2.csv' WITH CSV HEADER;
-----copy and order by amount
\copy (SELECT * FROM settlement ORDER BY amount ASC, settlement_date) TO 'C:/Users/benja/Portfolio/Bank_Reconciliation_SQL_Challenge3.csv' WITH CSV HEADER;


-- Count by settlement status
SELECT settlement_status, COUNT(*) AS total_transactions, SUM(amount) AS total_amount
FROM settlement
GROUP BY settlement_status;

-----Result:
 settlement_status | total_transactions | total_amount
-------------------+--------------------+--------------
 Pending           |                  7 |      9500.00
 Settled           |                 23 |     25950.00
(2 rows)


-- Find mismatched or missing transactions
SELECT * FROM settlement WHERE remarks LIKE '%Amount mismatch%';
----Result:
 settlement_id | reference_number | account_number | bank_name | amount  |      settlement_date       | settlement_status |           remarks
---------------+------------------+----------------+-----------+---------+----------------------------+-------------------+-----------------------------
            24 | REF004           | ACC30001       | Bank A    | 2000.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            25 | REF009           | ACC20001       | Bank A    |  900.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            26 | REF011           | ACC40001       | Bank A    | 1500.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            27 | REF016           | ACC30001       | Bank A    |  700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            28 | REF021           | ACC20001       | Bank A    | 1400.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            29 | REF024           | ACC50001       | Bank A    | 1700.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
            30 | REF030           | ACC50001       | Bank A    | 1300.00 | 2025-12-02 11:11:29.211739 | Pending           | Amount mismatch with Bank B
(7 rows)

SELECT * FROM settlement WHERE remarks = 'Missing in Bank A';
----Result:
 settlement_id | reference_number | account_number | bank_name | amount | settlement_date | settlement_status | remarks
---------------+------------------+----------------+-----------+--------+-----------------+-------------------+---------
(0 rows)

SELECT * FROM settlement WHERE remarks = 'Missing in Bank B';
------Result:
 settlement_id | reference_number | account_number | bank_name | amount | settlement_date | settlement_status | remarks
---------------+------------------+----------------+-----------+--------+-----------------+-------------------+---------
(0 rows)



--Total pending amount per bank
SELECT bank_name, SUM(amount) AS pending_amount
FROM settlement
WHERE settlement_status = 'Pending'
GROUP BY bank_name;

-----Result:
 bank_name | pending_amount
-----------+----------------
 Bank A    |        9500.00
(1 row)


-- Top 5 accounts with highest pending settlement
SELECT account_number, SUM(amount) AS total_pending
FROM settlement
WHERE settlement_status = 'Pending'
GROUP BY account_number
ORDER BY total_pending DESC
LIMIT 5;

---Result:
 account_number | total_pending
----------------+---------------
 ACC50001       |       3000.00
 ACC30001       |       2700.00
 ACC20001       |       2300.00
 ACC40001       |       1500.00
(4 rows)

--Reconcile Bank A vs Bank B
SELECT a.reference_number, a.account_number AS bank_a_account, a.amount AS bank_a_amount,
b.account_number AS bank_b_account, b.amount AS bank_b_amount
FROM bank_a_transactions a
JOIN bank_b_transactions b ON a.reference_number = b.reference_number
WHERE a.amount <> b.amount;

----Result:
 reference_number | bank_a_account | bank_a_amount | bank_b_account | bank_b_amount
------------------+----------------+---------------+----------------+---------------
 REF004           | ACC30001       |       2000.00 | ACC30001       |       2100.00
 REF009           | ACC20001       |        900.00 | ACC20001       |        950.00
 REF011           | ACC40001       |       1500.00 | ACC40001       |       1400.00
 REF016           | ACC30001       |        700.00 | ACC30001       |        750.00
 REF021           | ACC20001       |       1400.00 | ACC20001       |       1450.00
 REF024           | ACC50001       |       1700.00 | ACC50001       |       1800.00
 REF030           | ACC50001       |       1300.00 | ACC50001       |       1350.00
(7 rows)


-- Summary report per account
SELECT account_number,
SUM(CASE WHEN settlement_status='Settled' THEN amount ELSE 0 END) AS total_settled,
SUM(CASE WHEN settlement_status='Pending' THEN amount ELSE 0 END) AS total_pending,
SUM(amount) AS total_amount
FROM settlement
GROUP BY account_number
ORDER BY total_amount DESC;
----Rseult:
 account_number | total_settled | total_pending | total_amount
----------------+---------------+---------------+--------------
 ACC50001       |       5500.00 |       3000.00 |      8500.00
 ACC40001       |       5800.00 |       1500.00 |      7300.00
 ACC30001       |       3600.00 |       2700.00 |      6300.00
 ACC20001       |       2850.00 |       2300.00 |      5150.00
 ACC10001       |       5100.00 |             0 |      5100.00
 ACC10002       |       3100.00 |             0 |      3100.00
(6 rows)

---Identify accounts with both settled and pending transactions
SELECT account_number
FROM settlement
GROUP BY account_number
HAVING COUNT(DISTINCT settlement_status) > 1;

---Result:
 account_number
----------------
 ACC20001
 ACC30001
 ACC40001
 ACC50001
(4 rows)

--Simulate manual settlement
UPDATE settlement
SET settlement_status = 'Settled', remarks = 'Manually verified and settled'
WHERE reference_number = 'REF004';



