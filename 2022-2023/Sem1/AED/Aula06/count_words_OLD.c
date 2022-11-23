//
// Tomás Oliveira e Silva, AED, November 2021
//
// to compare strings use the function strcmp()
// to copy a string use the function strcpy()
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//
// complete the define T !!!
//

//#define T int*
typedef int T;
#include "hash_table.h"

//
// complete the register_word function (count this word)
//

void register_word(char word[64])
{
  hash_table_node* node = find_hash_table_node(word);

  if (find_hash_table_node(word) == NULL) {
    hash_table_node* node = allocate_hash_table_node();
    *node->key = hash_function(word);
    node->value = 1;
  }
  else {
    node->value = node->value + 1;
  }
  insert_hash_table_node(node);
}


//
// main program
//

int main(int argc,char **argv)
{
  char line[10000],word[64];
  hash_table_node *n;
  FILE *fp;
  int i,j = 0;

  for(i = 1;i < argc;i++)
  {
    //
    // open file for reading
    //
    fp = fopen(argv[i],"r");
    if(fp == NULL)
    {
      fprintf(stderr,"Unable to open file %s\n",argv[i]);
      exit(1);
    }

    int table_size = 1000;
    init_hash_table(table_size);

    //
    // scan the entire file
    //
    while(fgets(line,sizeof(line),fp) != NULL) {
      // replace non-digits and non-letters by a space
      for(i = 0;line[i] != '\0';i++)
        if((line[i] < '0' || line[i] > '9') && (line[i] < 'A' || line[i] > 'Z') && (line[i] < 'a' || line[i] > 'z') && line[i] != '\'')
          line[i] = ' ';


      // go over the line and extract each word
      for(i = 0;line[i] != '\0';i += j){
        if(line[i] == ' ') {
          j = 1;
        }
        else {
          for(j = 0;line[i + j] != '\0' && line[i + j] != ' ';j++)
            if(j < 63)
              word[j] = line[i + j];
          word[(j < 63) ? j : 63] = '\0';
          register_word(word);
        }
      }
    }
    //
    // close file
    //
    fclose(fp);

    display();

  }
  return 0;
}
