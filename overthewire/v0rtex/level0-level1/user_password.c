#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

#define HOSTNAME "vortex.labs.overthewire.org"
#define PORT 5842
#define MAX 4096

int main()
{
  int sock, numbytes; 
  uint32_t recv_number, sum = 0;
  struct hostent *host;
  struct sockaddr_in server;
  char message[MAX];

  sock = socket(AF_INET , SOCK_STREAM , 0);
  if (sock == -1)
  {
    perror("Could not create socket");
    return 1;
  }
  puts("Socket created");

  host = gethostbyname(HOSTNAME);
  if (host == NULL) {
    perror("can't lookup host");
    return 1;
  }

  bcopy((char *)host->h_addr, (char *)&server.sin_addr.s_addr, host->h_length);
  server.sin_family = AF_INET;
  server.sin_port = htons(PORT);

  if (connect(sock , (struct sockaddr *)&server , sizeof(server)) < 0)
  {
    perror("connect failed. Error");
    return 1;
  }
  printf("Connected to %s:%d\n", HOSTNAME, PORT);

  for (int i = 0; i <= 3; i++) {
    recv(sock, &recv_number, 4, 0);
    sum += recv_number;
  }

  write(sock, &sum, 4);
  if ((numbytes = recv(sock, message, MAX-1, 0)) < 0) {
    perror("receive error");
    return 1;
  }
  message[numbytes] = '\0';
  printf("Received data %s\n", message);

  close(sock);

  return 0;
}
