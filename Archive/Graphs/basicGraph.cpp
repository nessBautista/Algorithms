#include <iostream>
using namespace std;

#define MAXV 1000

//Node Struct
typedef struct edgenode_struct
{
    int y;                  /*Vertex*/
    int weight;
    edgenode_struct *next;
}edgenode;

//Graph struct
typedef struct graph_struct
{
    edgenode *edges[MAXV+1];
    int degree[MAXV+1];
    int nvertices;
    int nedges;
    bool directed;
}graph;

void initialize_graph(graph *g, bool directed)
{
  int i;
  g->nvertices = 0;
  g->nedges = 0;
  g->directed = directed;

  for (int i = 1; i<=MAXV; i++)
  {
    g->degree[i] = 0;
    g->edges[i] = NULL;
  }
}

void insert_edge(graph *g, int x, int y, bool directed)
{
  edgenode *p = (edgenode*)malloc(sizeof(edgenode));

  p->weight = 0;
  p->y = y;
  p->next = g->edges[x];
  g->edges[x] = p;
  g->degree[x]++;
  if (directed == false)
  {
    insert_edge(g,y,x,true);
  }
  else
  {
    g->nedges++;
  }
}

void print_graph(graph *g)
{
  edgenode *p;
  for(int i = 1; i <= g->nedges; i++)
  {
    cout<< i << ": ";
    p = g->edges[i];
    while(p != NULL)
    {
      cout<< p->y << "->";
      p = p->next;
    }
    cout<<endl;
  }
}
int main()
{
  graph *g = (graph *)malloc(sizeof(graph));
  initialize_graph(g, false);
  insert_edge(g,1,2,false);
  insert_edge(g,1,5,false);

  insert_edge(g,2,5,false);
  insert_edge(g,2,4,false);
  insert_edge(g,2,3,false);

  insert_edge(g,3,4,false);
  insert_edge(g,5,4,false);

  print_graph(g);
}
