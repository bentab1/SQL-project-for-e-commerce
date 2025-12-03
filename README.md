SQL Analysis Project – E-commerce & Bank Reconciliation
Overview

This repository contains two major SQL projects designed to demonstrate practical data analysis, financial validation, and real-world SQL problem-solving:

E-commerce SQL Analysis – focused on business analytics, customer insights, product performance, and revenue trends.

Bank Reconciliation SQL Project – focused on validating and reconciling financial transactions across multiple banking data sources.

Both sections include assumptions, schema descriptions, use-case explanations, and SQL queries that reflect real-life analytical workflows.

1. SQL Analysis Project – E-commerce
Introduction

This project showcases applied SQL techniques on an e-commerce dataset.
The goal is to derive meaningful business insights by answering key analytical questions such as:

a. Who are the top-spending customers?

b. Which products generate the highest revenue?

c. How do monthly sales trends evolve over time?

d. What product categories are growing or declining?

e. How strong is customer retention and repeat purchase behavior?

Each SQL query is crafted to support data-driven decision-making, helping stakeholders understand revenue performance, product demand, and customer value.

Database Schema (Assumptions)

The analysis is based on four key tables:

i. orders
Column	Description
order_id	Unique order identifier
customer_id	Links to customers table
order_date	Date the order was placed
total_amount	Total monetary value of the order
ii. order_items
Column	Description
order_item_id	Unique ID for each line item
order_id	Links to orders table
product_id	Links to products table
quantity	Number of units purchased
price	Price per unit
iii. customers
Column	Description
customer_id	Unique customer identifier
name	Customer name
iv. products
Column	Description
product_id	Unique product identifier
name	Product name
category	Product category or classification


2. Bank Reconciliation SQL Project
Introduction

This project demonstrates a real-world SQL-based bank reconciliation process, a core activity in finance and accounting.
Bank reconciliation involves comparing transaction data from two or more sources to ensure:

a. All financial entries are complete

b. No transactions are missing

c. No duplicates or incorrect values exist

d. Records match across systems

This project simulates reconciliation between Bank A and Bank B, and uses SQL to automate the discovery of mismatched, missing, and matched transactions.

Objectives

The main goals of the reconciliation workflow include:

a. Detecting mismatched or missing transactions between banking sources

b. Automating settlement and reconciliation steps to reduce manual errors

c. Generating financial reports that support audits, compliance, and internal review

d. Building practical SQL logic that mirrors real corporate reconciliation pipelines

Database Schema

The reconciliation system uses three primary tables:

1. bank_a_transactions

Contains transaction logs sourced from Bank A.

2. bank_b_transactions

Contains transaction logs sourced from Bank B.

3. settlement

A consolidated table that stores results of the reconciliation process, including:

Status	Meaning
Matched	Both banks recorded the same transaction
Mismatched	Values differ across banks
Pending	Transaction appears in only one bank
What This Section Includes

Sample transaction inserts for both banks

SQL queries to populate the settlement table automatically

Logic to detect:

a. missing transactions

c. mismatched amounts

d. timing differences

c. duplicate entries

Conclusion

This combined project demonstrates:

Strong SQL capability

Practical business and financial data analysis

Ability to build end-to-end analytical workflows

Real-world competency in both e-commerce analytics and bank reconciliation systems
