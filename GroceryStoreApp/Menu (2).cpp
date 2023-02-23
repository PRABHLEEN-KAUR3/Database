#include "Menu.h"
#include <iostream>
#include <occi.h>
#include <cstring>
#include "Utils.h"

using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;


// customer QUERIES


void displayAllcustomers(Connection* conn)
{
	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM customers_MS2");
	cout << "Information of customer: " << endl;
	cout << "Customer Number Card Number    Name                     LastName       FirstName      Phone          Address                             City           PostalCode     State          Cauntry" << endl;

	while (rs->next()) {
		int customernum = rs->getInt(1);
		int cardnum = rs->getInt(2);
		string name = rs->getString(3);
		string lastname = rs->getString(4);
		string firstname = rs->getString(5);
		string phone = rs->getString(6);
		string address = rs->getString(7);
		string city = rs->getString(8);
		string postalcode = rs->getString(9);
		string state = rs->getString(10);
		string cauntry = rs->getString(11);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << customernum << " ";
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << cardnum;
		cout.unsetf(ios::left);
		cout.width(25);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << name;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << lastname;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << firstname;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << phone;
		cout.unsetf(ios::left);
		cout.width(36);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << address;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << city;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << postalcode;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << state;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << cauntry << endl;
		cout.unsetf(ios::left);
	}
}
void displaycustomer(Connection* conn)
{
	int customernumber; 
	cout << "Enter the Customer Id: ";
	cin >> customernumber;
	if (!findcustomer(conn, customernumber))
		cout << "CUSTOMER ID NOT FOUND" << endl;
	else
	{
		Statement* stmt = conn->createStatement();
		ResultSet* rs = stmt->executeQuery("SELECT * FROM customers_ms2 WHERE cust_UserId = " + to_string(customernumber));
		cout << "Information of customer: " << endl;
		while (rs->next()) {
			int customernum = rs->getInt(1);
			int cardnum = rs->getInt(2);
			string name = rs->getString(3);
			string lastname = rs->getString(4);
			string firstname = rs->getString(5);
			string phone = rs->getString(6);
			string address = rs->getString(7);
			string city = rs->getString(8);
			string postalcode = rs->getString(9);
			string state = rs->getString(10);
			string cauntry = rs->getString(11);
			cout << "Customer Name: " << name << endl << "Customer Id: " << customernum << endl << "LastName:  " << lastname << endl << "FirstName: " << firstname << endl << "Phone: " << phone << endl << "CardNumber: " << cardnum << endl << "Address: " << address << endl << "City: " << city << endl << " PostalCode: " << postalcode << endl << "State: " << state << endl << "Country: " << cauntry << endl;
		}
	}
}

// ORDER QUERIES


void displayAllorders(Connection* conn)
{
	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM orders_ms2");
	cout << "Information of order: " << endl;
	cout << "Order Number    Customer Id    Order Date     Required Date  Shipped Date        Order Status" << endl;

	while (rs->next()) {
		int ordernum = rs->getInt(1);
		int customerid = rs->getInt(2);
		string orderdate = rs->getString(3);
		string requireddate = rs->getString(4);
		string shippeddate = rs->getString(5);
		string orderstatus = rs->getString(6);
		
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << ordernum << " ";
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << customerid;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << orderdate;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << requireddate;
		cout.unsetf(ios::left);
		cout.width(20);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << shippeddate;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << orderstatus<<endl;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
	}
}
void displayorder(Connection* conn)
{

	int ordernumber;
	cout<<"Enter Order Number ";
	cin >> ordernumber;
	if (!findOrder(conn, ordernumber))
		cout << "ORDER NUMBER NOT FOUND" << endl;
	else
	{
		Statement* stmt = conn->createStatement();
		ResultSet* rs = stmt->executeQuery("SELECT * FROM orders_ms2 WHERE ord_orderNumber = " + to_string(ordernumber));
		cout << "Information of Order: " << endl;


		while (rs->next()) {
			int ordernum = rs->getInt(1);
			int customerid = rs->getInt(2);
			string orderdate = rs->getString(3);
			string requireddate = rs->getString(4);
			string shippeddate = rs->getString(5);
			string orderstatus = rs->getString(6);

			cout << "Order Number: " << ordernum << endl << "Customer Id: " << customerid << endl << "OrderDate:  " << orderdate << endl << "Required Date: " << requireddate << endl << "Shipped Date: " << shippeddate << endl << "Order Status: " << orderstatus << endl;

		}
	}
}

// PRODUCT QUERIES


void displayAllProducts(Connection* conn)
{
	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM products_ms2");
	cout << "Information of Products: " << endl;
	cout << "Product Code  Product line             Name                          Quantity       Product Sale   Description                                                                     BuyPrice       MSRP" << endl;

	while (rs->next()) {
		string productcode = rs->getString(1);
		string productline = rs->getString(2);
		string productname = rs->getString(3);
		int quantityinstock = rs->getInt(4);
		string productsale = rs->getString(5);
		string productdescription = rs->getString(6);
		double buyprice = rs->getDouble(7);
		double msrp = rs->getDouble(8);

		cout.width(13);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << productcode << " ";
		cout.unsetf(ios::left);
		cout.width(25);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << productline;
		cout.unsetf(ios::left);
		cout.width(30);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << productname;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << quantityinstock;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << productsale;
		cout.unsetf(ios::left);
		cout.width(80);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << productdescription;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << buyprice;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << msrp << endl;
	}
}
void displayProduct(Connection* conn)
{

	int productnumber;
	cout<<"Enter Product Number: ";
	cin >> productnumber;
	if (!findproduct(conn, productnumber))
		cout << "PRODUCT NUMBER NOT FOUND" << endl;
	else
	{
		Statement* stmt = conn->createStatement();
		ResultSet* rs = stmt->executeQuery("SELECT * FROM products_ms2 WHERE ordDls_productCode = " + to_string(productnumber));
		cout << "Information of Order: " << endl;

		while (rs->next()) {
			string productcode = rs->getString(1);
			string productline = rs->getString(2);
			string productname = rs->getString(3);
			int quantityinstock = rs->getInt(4);
			string productsale = rs->getString(5);
			string productdescription = rs->getString(6);
			double buyprice = rs->getDouble(7);
			double msrp = rs->getDouble(8);

			cout << "Product Code: " << productcode << endl << "Product Line: " << productline << endl << "Product Name:  " << productname << endl << "Quantity In Stock: " << quantityinstock << endl << "Product Sale: " << productsale << endl << "Product Description: " << productdescription << endl << "Buy Price: " << buyprice << endl << "MSRP: " << msrp << endl;

		}
	}
}

// BILL QUERIES

void displayAllBills(Connection* conn)
{
	Statement* stmt = conn->createStatement();
	ResultSet* rs = stmt->executeQuery("SELECT * FROM bills_ms2");
	cout << "Information of Bill: " << endl;
	cout << "Bill Number     Customer Id    Order Number   Bill Status    Bill Date" << endl;

	while (rs->next()) {
		string billnumber = rs->getString(1);
		int customerid = rs->getInt(2);
		int ordernumber = rs->getInt(3);
		string billstatus = rs->getString(4);
		string billdate = rs->getString(5);

		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << billnumber << " ";
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << customerid;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << ordernumber;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << billstatus;
		cout.unsetf(ios::left);
		cout.width(36);
		cout.setf(ios::left);
		cout.fill(' ');
		cout << billdate << endl;
		cout.unsetf(ios::left);
		cout.width(15);
		cout.setf(ios::left);
		cout.fill(' ');
	}
}
void displaybill(Connection* conn)
{

	int billnumber;
	cout<<"Enter Bill Number: ";
	cin >> billnumber;
	if (!findbill(conn, billnumber))
		cout << "BILL NUMBER NOT FOUND" << endl;
	else
	{
		Statement* stmt = conn->createStatement();
		ResultSet* rs = stmt->executeQuery("SELECT * FROM bills_ms2 WHERE bills_ms2 = " + to_string(billnumber));
		cout << "Information of Bill: " << endl;

		while (rs->next()) {
			string billnumber = rs->getString(1);
			int customerid = rs->getInt(2);
			int ordernumber = rs->getInt(3);
			string billstatus = rs->getString(4);
			string billdate = rs->getString(5);


			cout << "Bill Number: " << billnumber << endl << "Customer Id: " << customerid << endl << "Order Number:  " << ordernumber << endl << "Bill Status: " << billstatus << endl << "Bill Date: " << billdate << endl;
		}
	}
}
