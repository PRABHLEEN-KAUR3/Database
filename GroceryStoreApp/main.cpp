

#include <iostream>
#include <occi.h>
#include <cstring>
#include"Menu.h"
#include"Utils.h"

using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;

int  main(void)
{
	//OCCI VARIABLES
	Environment* env = nullptr;
	Connection* conn = nullptr;

	//User Variables
	string str;
	string usr = "dbs211_213i21";    //this is the login assigned to you
	string pass = "15791206";       //this is the password assigned to you
	string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		cout << "Connection is Successful!" << endl << endl;
		cout << "Name : ABHAY GHAI" << endl << "GROUP 3 " << endl << "TEAM MEMBERS : ABHAY GHAI, PRABHLEEN KAUR, JAHNVI VERMA" << endl << endl;
		bool flag = true;
		int userchoice;
		while (flag)
		{
			displaymenu();
			cout << "Select an Option: ";
			cin >> userchoice;
			if (input(userchoice))
			{
				switch (userchoice)
				{
				case 1:
					displaycustomer(conn);
					break;
				case 2:
					displayAllcustomers(conn);
					break;
				case 3:
					displayorder(conn);
					break;
				case 4:
					displayAllorders(conn);
					break;
				case 5:
					displayProduct(conn);
					break;
				case 6:
					displayAllProducts(conn);
					break;
				case 7:
					displaybill(conn);
					break;
				case 8:
					displayAllBills(conn);
					break;
				case 0:
					flag = false;
					break;
				}
			}
			else
				cout << "WRONG INPUT, ENTER A DIGIT BETWEEN 0 AND 8" << endl;
		}
	}
	catch (SQLException& sqlExcp) 
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	return 0;
}