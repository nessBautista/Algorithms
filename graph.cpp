#include<iostream>
using namespace std;


//Graph using adjency matrix
#define MAXV 1000

//Node Struct
typedef struct edgenode_str{
  int y;
  int weight;
  struct edgenode_str *next;
}edgenode;

typedef struct graph_str{
  edgenode *edges[MAXV+1];
}graph;


int main(){
  cout<<"hello\n";
}
