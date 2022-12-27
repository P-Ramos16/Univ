/**
 * \brief the client
 * \author Artur Pereira <artur@ua.pt>
 */

#include "comm2.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <signal.h>
#include <stdlib.h>

int main(void)
{
    MESSAGE msg;
    int SelfClientID = getpid();
    int OtherClientID;

    /* opening the communication channel */
    cliOpenComm();
    servOpenComm();

    /* use the service */
    while(1) {
        /* asking user for a message */
        printf("\n[client \'%d\'] Message to be sent: ", SelfClientID);
        fgets(msg.data, MSG_MAX, stdin);
        msg.size = strlen(msg.data)+1;

        /* sending messag
        e */
        cliSend(&msg, &SelfClientID);

        /* asking for authorization to get response  */
        printf("\e[33mPress ENTER to get response\e[0m ");
        scanf("%*[^\n]");
        scanf("%*c");

        /* getting response */
        servReceive(&msg, &OtherClientID);

        /* printing received message */
        printf("Message received: %s", msg.data);
    }
    return 0;
}
