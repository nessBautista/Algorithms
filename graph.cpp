#include<iostream>
#include<queue>
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
  edgenode *edges[MAXV+1];  /*adjacency info*/
  int degree[MAXV+1];       /**/
  int nvertices;            /*number of vertices in the graph*/
  int nedges;               /*number of edges in the graph*/
  bool directed;            /*is the graph directed?*/
}graph;


void initialize_graph(graph *g, bool directed){

  g->nvertices=0;
  g->nedges=0;
  g->directed=directed;

  for(int i=1;i<=MAXV; i++)g->degree[i]=0;
  for(int i=1;i<=MAXV; i++)g->edges[i]=NULL;


}

void insert_edge(graph *g, int x, int y, bool directed){
  //
  edgenode *p;
  p=(edgenode*)malloc(sizeof(edgenode));

  p->weight=0;

  p->y = y;
  p->next=g->edges[x];
  g->edges[x]=p;
  g->degree[x]++;

  if(directed==false)
      insert_edge(g,y,x,true);
  else
      g->nedges ++;
}

void printGraph(graph *g){
  edgenode *p;
  cout<<"flag\n";
  for(int i=1; i<=g->nvertices; i++){
    printf("%d: ",i);
    p = g->edges[i];
    while(p !=NULL){
      printf("%d->",p->y );
      p=p->next;
    }
    printf("\n");
  }
}


//////////
bool processed [MAXV+1];
bool discovered [MAXV+1];
int parent[MAXV+1];

void process_vertex_early(int v){
  //cout<< v<<"->";
}
void process_edge(int x, int y){

}

void process_vertex_late(int v){
}


void initialize_search(graph *g){
  for(int i=1; i<=g->nvertices;i++){
    processed[i]=discovered[i]=false;
    parent[i]=-1;
  }
}

void traversal(graph *g, int start){
  queue <int> q;
  int v;
  int y;
  edgenode *p;

  q.push(start);
  discovered[start] =true;
  while(q.size()!=0){
    v=q.front();
    q.pop();
    process_vertex_early(v);
    processed[v]=true;
    p=g->edges[v];
    while(p!=NULL){       /*go over adjency list*/
      y=p->y;
      if((processed[y]==false)||g->directed){
        process_edge(v,y);
      }
      if(discovered[y]==false){
        q.push(y);
        discovered[y]=true;
        parent[y]=v;
      }
      p=p->next;
    }
    process_vertex_late(v);
  }

}

void find_path(int start, int end, int parents[]){
  if((start==end)||(end==-1))
    printf("\n %d->",start);
  else{
    find_path(start,parents[end],parents);
    printf(" %d->", end);
  }
}

int main(){
  graph *g=(graph*)malloc(sizeof(graph));
  initialize_graph(g,false);
  g->nvertices=10;

  //Construction of test graph
  insert_edge(g,1,2,false);
  insert_edge(g,2,4,false);
  insert_edge(g,4,5,false);

  insert_edge(g,5,7,false);
  insert_edge(g,1,3,false);
  insert_edge(g,3,4,false);
  insert_edge(g,1,6,false);
  insert_edge(g,6,7,false);




  //Print adjacency information
  printGraph(g);



  //Start traversal
  initialize_search(g);
  traversal(g,1);


  //find path
  find_path(1,5,parent);
}
