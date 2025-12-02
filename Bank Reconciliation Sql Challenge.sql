# Bank Reconciliation SQL Challenge – Portfolio Document

## 1. Introduction

* Overview of bank reconciliation using SQL.
* Tables used: `bank_a_transactions`, `bank_b_transactions`, `settlement`.
* Common SQL commands in PostgreSQL, MySQL, and Oracle.

## Database Schema

--Bank A Transactions Table

CREATE TABLE bank_a_transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_number VARCHAR(20),
    amount NUMERIC(15,2),
    transaction_date DATE,
    description VARCHAR(100),
    reference_number VARCHAR(50) UNIQUE
);

---Bank B Transactions table

CREATE TABLE bank_b_transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_number VARCHAR(20),
    amount NUMERIC(15,2),
    transaction_date DATE,
    description VARCHAR(100),
    reference_number VARCHAR(50) UNIQUE
);

---Settlement Table

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


-️---##Insert Sample Transactions for Bank A
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

️---#### Insert Sample Transactions for Bank B
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


-- ## Populate Settlement Table Automatically
-- ---Matched Transactions
INSERT INTO settlement (
    reference_number,account_number,bank_name,amount,settlement_status, remarks
)
SELECT 
    a.reference_number, a.account_number,'Bank A',a.amount,'Settled', 'Matched with Bank B'
FROM 
    bank_a_transactions a
JOIN 
    bank_b_transactions b 
    ON a.reference_number = b.reference_number
WHERE 
    a.amount = b.amount;

----- Mismatched Transactions
INSERT INTO settlement (
    reference_number,account_number,bank_name, amount, settlement_status,remarks
)
SELECT 
    a.reference_number, a.account_number,'Bank A', a.amount, 'Pending',
    CASE 
        WHEN b.reference_number IS NULL THEN 'Missing in Bank B'
        ELSE 'Amount mismatch with Bank B'
    END
FROM 
    bank_a_transactions a
LEFT JOIN 
    bank_b_transactions b 
    ON a.reference_number = b.reference_number
WHERE 
    b.reference_number IS NULL 
    OR a.amount <> b.amount;

------Missing transaction

INSERT INTO settlement (
    reference_number, account_number,bank_name, amount,settlement_status, remarks
)
SELECT 
    b.reference_number, b.account_number,'Bank B',b.amount,'Pending',
    CASE 
        WHEN a.reference_number IS NULL THEN 'Missing in Bank A'
        ELSE 'Amount mismatch with Bank A'
    END
FROM 
    bank_b_transactions b
LEFT JOIN 
    bank_a_transactions a 
    ON b.reference_number = a.reference_number
WHERE 
    a.reference_number IS NULL 
    OR b.amount <> a.amount;


---Missing transactions
INSERT INTO settlement (
    reference_number, account_number,bank_name,amount,settlement_status,remarks
)
SELECT 
    a.reference_number,a.account_number, 'Bank A',a.amount,'Pending',
    CASE 
        WHEN b.reference_number IS NULL THEN 'Missing in Bank B'
        ELSE 'Amount mismatch with Bank B'
    END
FROM 
    bank_a_transactions a
LEFT JOIN 
    bank_b_transactions b 
    ON a.reference_number = b.reference_number
WHERE 
    (b.reference_number IS NULL OR a.amount <> b.amount)
    AND a.transaction_date BETWEEN '2025-11-10' AND CURRENT_DATE;

------------------------------------------------------------------------------
️---### Settlement Queries

-- View all settlements
SELECT * FROM settlement ORDER BY settlement_status DESC, settlement_date;

-- Count by settlement status
SELECT settlement_status, COUNT(*) AS total_transactions, SUM(amount) AS total_amount
FROM settlement
GROUP BY settlement_status;

-- Find mismatched or missing transactions
SELECT * FROM settlement WHERE remarks LIKE '%Amount mismatch%';
SELECT * FROM settlement WHERE remarks = 'Missing in Bank A';
SELECT * FROM settlement WHERE remarks = 'Missing in Bank B';

-- - Find all mismatched transactions
SELECT * FROM settlement WHERE remarks LIKE '%Amount mismatch%';


-- --- Find transactions missing in Bank A
SELECT * FROM settlement WHERE remarks = 'Missing in Bank A';


-----Find transactions missing in Bank B
SELECT * FROM settlement WHERE remarks = 'Missing in Bank B';


----- Count transactions by status
SELECT settlement_status, COUNT(*) AS total_transactions, SUM(amount) AS total_amount
FROM settlement
GROUP BY settlement_status;


-- ---Total pending amount per bank
SELECT bank_name, SUM(amount) AS pending_amount
FROM settlement
WHERE settlement_status = 'Pending'
GROUP BY bank_name;


------Top 5 accounts with highest pending settlement
SELECT account_number, SUM(amount) AS total_pending
FROM settlement
WHERE settlement_status = 'Pending'
GROUP BY account_number
ORDER BY total_pending DESC
LIMIT 5;


----Reconcile Bank A vs Bank B
SELECT a.reference_number, a.account_number AS bank_a_account, a.amount AS bank_a_amount,
b.account_number AS bank_b_account, b.amount AS bank_b_amount
FROM bank_a_transactions a
JOIN bank_b_transactions b ON a.reference_number = b.reference_number
WHERE a.amount <> b.amount;


---Summary report per account
SELECT account_number,
SUM(CASE WHEN settlement_status='Settled' THEN amount ELSE 0 END) AS total_settled,
SUM(CASE WHEN settlement_status='Pending' THEN amount ELSE 0 END) AS total_pending,
SUM(amount) AS total_amount
FROM settlement
GROUP BY account_number
ORDER BY total_amount DESC;


-----Identify accounts with both settled and pending transactions
SELECT account_number
FROM settlement
GROUP BY account_number
HAVING COUNT(DISTINCT settlement_status) > 1;


-----Simulate manual settlement
UPDATE settlement
SET settlement_status = 'Settled', remarks = 'Manually verified and settled'
WHERE reference_number = 'REF004';
 Additional Challenges


️---Aggregate Reports by Bank and Account
-- Total settled and pending amounts per bank and account
SELECT 
    bank_name,
    account_number,
    SUM(CASE WHEN settlement_status = 'Settled' THEN amount ELSE 0 END) AS total_settled,
    SUM(CASE WHEN settlement_status = 'Pending' THEN amount ELSE 0 END) AS total_pending,
    SUM(amount) AS total_amount
FROM settlement
GROUP BY bank_name, account_number
ORDER BY bank_name, total_amount DESC;

----- Detect Duplicates or Exceptions
-- Find duplicate transactions based on reference_number
SELECT reference_number, account_number, COUNT(*) AS duplicate_count
FROM bank_a_transactions
GROUP BY reference_number, account_number
HAVING COUNT(*) > 1;

-- Detect mismatched amounts between Bank A and Bank B
SELECT a.reference_number, a.account_number AS bank_a_account, a.amount AS bank_a_amount,
       b.account_number AS bank_b_account, b.amount AS bank_b_amount
FROM bank_a_transactions a
JOIN bank_b_transactions b ON a.reference_number = b.reference_number
WHERE a.amount <> b.amount;

---- Multi-Account Settlements and Reversal Handling
-- Example: Identify transactions involving multiple accounts with the same reference
SELECT reference_number, COUNT(DISTINCT account_number) AS accounts_involved
FROM settlement
GROUP BY reference_number
HAVING COUNT(DISTINCT account_number) > 1;

-- Mark a transaction as reversed
UPDATE settlement
SET settlement_status = 'Reversed', remarks = 'Transaction reversed due to error'
WHERE reference_number = 'REF004';

-- Adjust settlement amount for a reversal or correction
UPDATE settlement
SET amount = amount - 500, remarks = 'Adjusted for reversal'
WHERE reference_number = 'REF010';


--### Use JOIN and LEFT JOIN for Reconciliation
-- Find transactions in Bank A that match Bank B by reference and amount
SELECT a.reference_number, a.account_number AS bank_a_account, a.amount AS bank_a_amount,
       b.account_number AS bank_b_account, b.amount AS bank_b_amount
FROM bank_a_transactions a
JOIN bank_b_transactions b 
  ON a.reference_number = b.reference_number
WHERE a.amount = b.amount;

-- Find transactions in Bank A that are missing or mismatched in Bank B
SELECT a.reference_number, a.account_number, a.amount, b.amount AS bank_b_amount
FROM bank_a_transactions a
LEFT JOIN bank_b_transactions b
  ON a.reference_number = b.reference_number
WHERE b.reference_number IS NULL OR a.amount <> b.amount;

----### Use GROUP BY and SUM for Totals
-- Total settled and pending amounts per account
SELECT account_number,
       SUM(CASE WHEN settlement_status = 'Settled' THEN amount ELSE 0 END) AS total_settled,
       SUM(CASE WHEN settlement_status = 'Pending' THEN amount ELSE 0 END) AS total_pending,
       SUM(amount) AS total_amount
FROM settlement
GROUP BY account_number
ORDER BY total_amount DESC;

---### Use CASE Statements for Conditional Calculations
-- Classify transactions by amount type
SELECT reference_number,
       account_number,
       amount,
       CASE 
           WHEN amount > 2000 THEN 'High Value'
           WHEN amount BETWEEN 1000 AND 2000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS transaction_category
FROM settlement;

----### Filter Pending Transactions to Identify Mismatches or Missing Records
-- Pending transactions in Bank A
SELECT *
FROM settlement
WHERE settlement_status = 'Pending'
  AND bank_name = 'Bank A';

-- Identify pending transactions with mismatched amounts
SELECT reference_number, account_number, bank_name, amount, remarks
FROM settlement
WHERE settlement_status = 'Pending'
  AND remarks LIKE '%mismatch%';

-- Identify pending transactions missing in Bank B
SELECT reference_number, account_number, amount
FROM settlement
WHERE settlement_status = 'Pending'
  AND remarks = 'Missing in Bank B';
