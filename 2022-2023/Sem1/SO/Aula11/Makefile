CC = gcc

CFLAGS = -Wall

LD = gcc

LDFLAGS = -lm

TARGETS = server server2 client client2 client3 client4

.PHONY: all clean cleanall

all: $(TARGETS)

comm-msg.o:	comm.h message.h

comm-msg2.o:	comm2.h message2.h

message.o:	message.h

client.o: comm.h

server.o: comm.h

client2.o: comm2.h

server2.o: comm.h

client3.o: comm2.h

client4.o: comm2.h

# comm-msg2.o message2.o estes para fazer os meus codigos
$(TARGETS):		%:  %.o comm-msg2.o message2.o 
		$(LD) -o $@ $^ $(LDFLAGS)

clean:
		rm -f *.o *~

cleanall:	clean
		rm -f $(TARGETS)

