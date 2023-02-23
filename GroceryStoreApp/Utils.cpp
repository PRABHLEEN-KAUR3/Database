#include "Utils.h"
#include <iostream>
#include <cstring>

using namespace std;

void displaymenu()
{
	cout << endl << "0- TO EXIT" << endl << "1- TO DISPLAY A SPECIFIC CUSTOMER" << endl << "2- TO DISPLAY ALL CUSTOMERS " << endl << "3- TO DISPLAY A SPECIFIC ORDER" << endl << "4- TO DISPLAY ALL ORDERS" << endl << "5- TO DISPLAY A SPECIFIC PRODUCT" << endl << "6- TO DISPLAY ALL PRODUCTS" << endl << "7- TO DISPLAY A SPECIFIC BILL" << endl << "8- TO DISPLAY ALL BILLS" << endl << endl;
}

bool input(int number)
{
	if (number >= 0 && number <= 8)
		return true;
	else return false;
}

int findcustomer(Connection* conn, int customerNumber)
{
	Statement* stmt = conn->createStatement();
	ResultSet* rs2 = stmt->executeQuery("SELECT * FROM customers_ms2 WHERE cust_UserId  = " + to_string(customerNumber));
	if (rs2->next())
	{
		return 1;
	}
	else
	{
		return 0;

	}
}


int findOrder(Connection* conn, int orderNumber)
{

	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM order_ms2 WHERE ord_orderNumber = " + to_string(orderNumber));
	if (rs->next())
	{
		return 1;
	}
	else
		return 0;
}


int findproduct(Connection* conn, int productNumber)
{

	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM productS_ms2 WHERE ordDls_productCode  = " + to_string(productNumber));
	if (rs->next())
	{
		return 1;
	}
	else
		return 0;
}

int findbill(Connection* conn, int billnumber)
{

	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM bills_ms2 WHERE BillNumber  = " + to_string(billnumber));
	if (rs->next())
	{
		return 1;
	}
	else
		return 0;
}

