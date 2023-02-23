#ifndef SDDS_UTILS_H
#define SDDS_UTILS_H
#include "Menu.h"

bool input(int input);
void displaymenu();

int findcustomer(Connection* conn, int customerNumber);

int findOrder(Connection* conn, int orderNumber);

int findproduct(Connection* conn, int productnumber);

int findbill(Connection* conn, int billNumber);



#endif
