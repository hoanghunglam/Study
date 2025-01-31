// Kosaraju's Algorithm.cpp : Defines the entry point for the console application.
//Pham Huy Tung - 15150153
#include "stdafx.h"
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
#define UNVISITED 0
#define VISITED 1
#define TRUE 1
#define FALSE 0

//Danh sach cac dinh dang struct, la danh sach lien ket de duyet dinh v trong do thi
typedef struct vlist 
{
	int v;				//Dinh v 
	struct vlist *next; 
}vlist; 

//Danh sach cac dinh va canh trong bieu do
typedef struct Graph 
{
	//Con tro chi toi con tro asjList co kieu du lieu la dslk vlist/ ds dinh lien ke voi dinh dang xet
	vlist **adjList; 
	int n;			 //dinh
	int m;			 //canh
} Graph;

//Khai bao ngan xep Stack
typedef struct Stack 
{
	int *storage;
	int top;
} Stack;

	Stack *init_stack(int capacity); 
	void push(Stack *S, int elem); 	 
	int pop(Stack *S);  			 
	int is_stack_empty(Stack *S);    
//--------------------------------------------------------------------------------------

//Xay dung do thi G
Graph *build_graph();				        //Xay dung do thi tu du lieu da nhap
void  add_arc(Graph *G, int u, int v);      //Them cac thanh phan vao do thi, xac dinh tap dinh ke
//--------------------------------------------------------------------------------------

//Tien hanh thuat toan Kosaraju
void Kosaraju(Graph *G);
void DFS(Graph *G, int i, Stack *S); //Duyet dfs lan thu 1 tren do thi G
Graph *reverse(Graph *G);            //Dao nguoc do thi G
void dfs_and_print(int v, Graph *H); //Duyet dfs lan thu 2 tren do thi nguoc H
//In ra cac thanh phan lien thong manh (phai dc thao tac tren do thi nguoc G)
void print_connected_component(Graph *H, Stack *S); 

//--------------------------------------------------------------------------------------

//Khai bao mang danh dau Visited va Mang xoa tap dinh o lan DFS thu 2
int* mark; // Mang visited, unvisited
int *Dm;   // Mang danh dau cac dinh da bi xoa tu do thi dao H va Stack S
//--------------------------------------------------------------------------------------
//MAIN

int main() 
{
	Graph *G = build_graph(); 
	Kosaraju(G);
	_getch();
	return 0;
}
//--------------------------------------------------------------------------------------
//XAY DUNG DO THI

// Xay dung cac thanh phan cua do thi
Graph *build_graph() 
{
	Graph *G = (Graph *)malloc(sizeof(Graph));
	G->n = 5;
	G->m = 5;
	/*G->n = 9;
	G->m = 16;*/
	G->adjList = (vlist **)malloc(G->n * sizeof(vlist *));
	int i = 0;
	for (i = 0; i < G->n; i++) 
	{
		G->adjList[i] = NULL; //thiet lap mang dslk dinh cua do thi G la null toan bo
	}
	add_arc(G, 0, 2); //goc den dinh ke
	add_arc(G, 0, 3);
	add_arc(G, 1, 0);
	add_arc(G, 2, 1);
	add_arc(G, 3, 4);

	/*add_arc(G, 0, 1);
	add_arc(G, 0, 2);
	add_arc(G, 0, 4);
	add_arc(G, 1, 3);
	add_arc(G, 2, 4);
	add_arc(G, 2, 5);
	add_arc(G, 3, 0);
	add_arc(G, 3, 2);
	add_arc(G, 3, 7);
	add_arc(G, 3, 8);
	add_arc(G, 4, 5);
	add_arc(G, 5, 6);
	add_arc(G, 5, 8);
	add_arc(G, 6, 4);
	add_arc(G, 8, 2);
	add_arc(G, 8, 7);*/
	return G;
}

// Add dinh u ke voi v vao trong do thi G
void add_arc(Graph *G, int u, int v)
{
	// Chon v la goc cua tap dinh ke u //thiet lap cac tap danh sach lien ket
	vlist *arc = (vlist*)malloc(sizeof(vlist));
	arc->v = v; //Truyen gia tri v vao dslk
	arc->next = G->adjList[u]; //Con tro dslk tro toi dinh tiep theo u nam trong tap dinh ke voi v va truyen vao dslk
	G->adjList[u] = arc; //Gan diem u do vao dslk
}
//--------------------------------------------------------------------------------------
//DUYET DO THI

void Kosaraju(Graph *G) 
{
	Stack *S = init_stack(G->n);
	mark = (int *)malloc(G->n * sizeof(int));    //Cap phat n phan tu cho mark kieu int
	memset(mark, UNVISITED, G->n * sizeof(int)); //Danh dau dinh la unvisited, set gia tri tai dinh n dang duoc xet la unvisited
	int i = 0;									 //DFS lan thu 1
	for (i = 0; i < G->n; i++) 
	{
		if (mark[i] == UNVISITED)
		{
			DFS(G, i, S);  //De quy, luu tru trang thai dang lam do theo co che stack, add dinh goc den dinh ke
		}
	}
	Graph *H = reverse(G);			 //Dao do thi G
	print_connected_component(H, S); //DFS lan thu 2
}

//DUYET DFS LAN 1
void DFS(Graph *G, int i, Stack *S) 
{
	mark[i] = VISITED;
	vlist *arcs = G->adjList[i]; //Gan tap dinh ke vao dslk
	
	while (arcs != NULL)
	{
		if (mark[arcs->v] == UNVISITED) //arc la tap dinh ke cua v dang xet 
		{
			DFS(G, arcs->v, S); //De quy ham Dfs
		}
		else //neu dinh ke arcs->v da visited  thi tro sang dinh ke ke tiep
		arcs = arcs->next;		
	}
	push(S, i);					//Push i vao stack S sau khi duoc tham
}
//--------------------------------------------------------------------------------------
//DUYET DFS LAN 2 

// Build do thi dao cua G dat ten la H
Graph *reverse(Graph *G) 
{
	Graph *H = (Graph *)malloc(sizeof(Graph));
	H->n = G->n;
	H->m = G->m;
	H->adjList = (vlist **)malloc(H->n * sizeof(vlist *)); //Cap phat bo nho cho adjlist co so phan tu la n
	int i = 0;
	for (i = 0; i < H->n; i++) //Thiet lap mang dslk dinh ke cho H voi gia tri Null toan bo
	{
		H->adjList[i] = NULL;
	}
	// Dao chieu duong di trong do thi G tra ve do thi dao H
	vlist *arcs;
	for (i = 0; i < G->n; i++) 
	{
		arcs = G->adjList[i]; //Tap dinh ke gan vao dlsk
		while (arcs != NULL) 
		{
			add_arc(H, arcs->v, i); //Add duong di tu dinh ke den dinh Goc
			arcs = arcs->next;
		}
	}
	return H;
}

//Duyet DFS lan 2 va in ra thanh phan lien thong manh
void print_connected_component(Graph *H, Stack *S) 
{
	Dm = (int *)malloc(H->n * sizeof(int)); //Xoa tap lien thong manh khoi H va S
	memset(Dm, FALSE, H->n * sizeof(int)); // n gia tri la false chua xoa
	int c = 1;
	while (!is_stack_empty(S)) //duyet stack
	{
		int v = pop(S);
		if (!Dm[v]) //v chua co trong Dm
		{
			memset(mark, UNVISITED, H->n * sizeof(int)); //Danh dau tat ca cac dinh trong H chua duoc tham/ vi khi duyet dinh ke theo co che stack ko xoa dc cac dinh o duoi da visited
			printf("Thanh Phan Lien Thong Manh #%d: [ ", c);
			dfs_and_print(v, H);
			printf(" ]");
			printf("\n");
			c++;
		}
	}
}

//Duyet DFS de liet ke ra mot tap cac dinh dfs_and_print tu mot dinh v trong do thi H
void dfs_and_print(int v, Graph *H) 
{
	printf("%d,", v);
	mark[v] = VISITED;
	Dm[v] = TRUE;
	vlist *arcs = H->adjList[v]; //Danh sach dinh lien ke cua v dang xet trong do thi H
	while (arcs != NULL) 
	{
		int u = arcs->v;
		if (mark[u] == UNVISITED && Dm[u] == FALSE) 
		{
			dfs_and_print(u, H);
		}
		else //neu dinh u da visited va xoa thi tro sang dinh ke ke tiep
		arcs = arcs->next;
	}
}
//--------------------------------------------------------------------------------------
//	KHOI TAO STACK

Stack *init_stack(int capacity) //Khoi tao stack rong
{
	Stack *S = (Stack *)malloc(sizeof(Stack));
	S->top = -1; //Stack rong khi top = -1
	S->storage = (int*)malloc(capacity * sizeof(int)); //Cap phat bo nho va tra ve mot con tro toi no
	return S;
}

void push(Stack *S, int elem)  //Day du lieu vao stack
{
	S->top++;				   //Tang top len 1
	S->storage[S->top] = elem; //Gan du lieu
}

int pop(Stack *S) //Lay du lieu tu stack ra va xoa du lieu
{
	if (is_stack_empty(S))
	{
		printf("nothing to pop\n");
		exit(0);
	}
	int elem = S->storage[S->top]; //Lay du lieu tai top
	S->top--; //Giam top 
	return elem;
}

int is_stack_empty(Stack *S) //Kiem tra stack rong
{
	return S->top < 0 ? TRUE : FALSE;
}

