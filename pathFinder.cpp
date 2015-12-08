#include<iostream>
#include<queue>
using namespace std;


/**************
  GRAPH STRUCT
 *************
*/
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

/**************
  Graph Utilities
 *************
*/
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
  //cout<<"flag\n";
  for(int i=1; i<=g->nvertices; i++){
    printf("%d: ",i);
    p = g->edges[i];
    while(p !=NULL){
      printf("%d(%d)->",p->y,p->weight);
      p=p->next;
    }
    printf("\n");
  }
}


/**************
  GRAPH traversal
 *************
*/
bool processed [MAXV+1];
bool discovered [MAXV+1];
int parents[MAXV+1];

typedef struct node_str{
  int data;
  struct node_str *next;
}Node;

typedef struct list_str{
  Node *first;
  Node *last;
}List;

void insertAtBack(List *l, int val){
  Node *newPtr= (Node*)malloc(sizeof(Node));
  newPtr->data=val;
  newPtr->next=NULL;
  cout<<"inserting "<<newPtr->data<<endl;
  if(l->first==NULL){
    l->first=l->last=newPtr;
  }else{
    l->last->next=newPtr;
    l->last=newPtr;
  }
}

void removeAtBack(List *l){
  if(l->first!=NULL){
    Node *temp=l->last;
    if(l->first==l->last){
      l->first=l->last=NULL;
    }else{
      Node *temp=l->first;
      while(temp->next!=l->last){
        temp=temp->next;
      }
      l->last=temp;
      temp->next=NULL;
    }
  }
}

void printList(List *l){

  if(l->first!=NULL){
    Node *curr=l->first;
    while(curr!=NULL){
      cout<<curr->data<<"->";
      curr=curr->next;
    }
    cout<<endl;
  }
}

List *possibleParents[4+1];     //4 vertex

void initialize_search(graph *g){
  for(int i=1; i<=g->nvertices;i++){
    processed[i]=discovered[i]=false;
    parents[i]=-1;
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
    //pre processing
    processed[v]=true;
    p=g->edges[v];
    while(p!=NULL){       /*go over adjency list*/
      y=p->y;
      if((processed[y]==false)||g->directed){
        //Process edge  here!
      }
      if(discovered[y]==false){
        q.push(y);
        discovered[y]=true;
        parents[y]=v;
        if(possibleParents[y]==NULL){
          List *l=(List*)malloc(sizeof(List));
          l->first=NULL;
          l->last=NULL;
          possibleParents[y]=l;
          insertAtBack(possibleParents[y],v);
        }else{
          cout<<"flag";
          insertAtBack(possibleParents[y],v);
        }


      }
      p=p->next;
    }
    //Post processing Vertex
  }
}

int main(){
  cout<<"Im OK!"<<endl;
  //construct test graph
  graph *g = (graph*)malloc(sizeof(graph));
  initialize_graph(g,false);
  g->nvertices=4;
  insert_edge(g,1,2,false);
  insert_edge(g,2,4,false);
  insert_edge(g,4,3,false);
  insert_edge(g,3,1,false);

  printGraph(g);

  initialize_search(g);
  traversal(g,1);
  for(int i=1; i<=g->nvertices;i++){
    cout<<"["<<i <<"] "<<parents[i]<<endl;
  }

  // List *l1=(List*)malloc(sizeof(List));
  // l1->first=NULL;
  // l1->last=NULL;
  // insertAtBack(l1,1);
  // insertAtBack(l1,2);
  // insertAtBack(l1,3);
  //printList(l1);


  if(possibleParents[1]!=NULL){
    cout<<possibleParents[1]->first->data;
  }




}
