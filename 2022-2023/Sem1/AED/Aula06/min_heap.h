//
// Pedro Ramos, AED, November 2022
//

#include <assert.h>

typedef struct min_heap_node
{
  char key[64];
  T value;
  struct min_heap_node *next;
}
min_heap_node;

//
// the global variables
//

min_heap_node **min_heap = NULL;
unsigned int min_heap_size = 0u;
unsigned int n = 0;


//
// hash table creation
//

void init_hash_table(unsigned int desired_heap_size)
{
  unsigned int i;

  min_heap_size = desired_heap_size;
  if(min_heap_size < 10u)
    min_heap_size = 10u;
  if(min_heap_size > 10000000u)
    min_heap_size = 10000000u;
  n = min_heap_size;
  min_heap = (min_heap_node **)malloc((size_t)min_heap_size * sizeof(min_heap_node *));
  for(i = 0u;i < min_heap_size;i++)
    min_heap[i] = NULL;
}

void verify_if_heap() {
    for (int i = 2; i <= n; i++) {
        assert(min_heap[i / 2] <= min_heap[i]);
    }
}

void inser(T value) {
    int i;
    for(i = ++n;i > 1 && min_heap[i / 2] > value;i /= 2) {
        min_heap[i] = min_heap[i / 2];
    }
    min_heap[i] = value;
}


void remove(int pos) {
    int i;
    for(i = pos;2 * i <= n;min_heap[i] = min_heap[j],i = j) {
        // j is the index of the child that will move to replace its parent
        j = (2 * i + 1 <= n && min_heap[2 * i + 1] > min_heap[2 * i]) ? 2 * i + 1 : 2 * i; // select largest child
    }
    for(;i > 1 && min_heap[i / 2] < min_heap[n];i /= 2) {
        min_heap[i] = min_heap[i / 2];
    }
    min_heap[i] = min_heap[n--];
}