/**
 * \brief the client
 * \author Artur Pereira <artur@ua.pt>
 */

#include "comm2.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(void)
{
    MESSAGE msg;
    int ClientID = getpid();

    /* opening the communication channel */
    cliOpenComm();

    /* use the service */
    while(1) {
        /* asking user for a message */
        printf("\n[client \'%d\'] Message to be sent: ", ClientID);
        fgets(msg.data, MSG_MAX, stdin);
        msg.size = strlen(msg.data)+1;

        /* sending messagee */
        cliSend(&msg, &ClientID);

        /* asking for authorization to get response  */
        printf("\e[33mPress ENTER to get response\e[0m ");
        scanf("%*[^\n]");
        scanf("%*c");

        /* getting response */
        cliReceive(&msg, &ClientID);

        /* printing received message */
        printf("Message received: %s", msg.data);
    }
    return 0;
}
