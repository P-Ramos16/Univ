//
// Tomás Oliveira e Silva, AED, November 2021
//
// Generic queue (First In First Out) implementation based on an linked list
//

#ifndef _AED_lQueue_
#define _AED_lQueue_

#include <cassert>
#include "sList.h"

template <typename T>
class lQueue {
  private:
    sList<T>* data;
  public:
    lQueue(void) {
      data = new sList<T>();
    }
    ~lQueue(void) {
      delete data;
    }
    void clear(void) {
      delete data;
      data = new sList<T>();
      return;
    }
    int size(void) const {
      return data->size();
    }
    int is_full(void) const {
      return data->is_full();
    }
    int is_empty(void) const {
      return data->size() == 0;
    }
    void enqueue(T &v) {
      data->insert_after_tail(v); // Vale  mais a pena meter no fim, pois se colocar o dequeue (inicio da fila)
                                 // na tail, como remove_tail é muito ineficiente o código ficaria muito mais ineficiente
      return;
    }
    T dequeue(void) {
      data->remove_head();
      return 0;
    }
    T peek(void) {
      data->move_to_head();
      return data->size()-1; // o??????????
    }
};

#endif
