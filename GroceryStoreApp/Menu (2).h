#ifndef SDDS_MENU_H
#define SDDS_MENU_H


#include <iostream>
#include <occi.h>
#include <cstring>

using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;

struct Customer {
	int customerNumber;
	char lastName[50];
	char firstName[50];
	char CustomerName[50];
	char phone[20];
	char Address[100];
	char postalcode[7];
	char State[50];
	char city[50];
	int cardnumber;
};

//	customer TABLE QUERIES.
void displayAllcustomers(Connection *conn);
void displaycustomer(Connection* conn);

// ORDER QUERIES

void displayAllorders(Connection* conn);
void displayorder(Connection* conn);

// PRODUCT QUERIES

void displayAllProducts(Connection *conn);
void displayProduct(Connection *conn);

// BILL QUERIES


void displayAllBills(Connection *conn);
void displaybill(Connection *conn);

#endif // !SDDS_MENU_H

