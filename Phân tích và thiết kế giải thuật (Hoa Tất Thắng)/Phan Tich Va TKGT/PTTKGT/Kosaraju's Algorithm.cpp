// Kosaraju's Algorithm.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>

#define UNVISITED 0
#define VISITED 1
#define TRUE 1
#define FALSE 0
#define INFTY 1000000



// Danh sach cac dinh dang struct, la danh sach lien ket de duyet dinh v trong do thi
typedef struct vlist {
	int v;		// vertex v is adjacent to the index of the list //Dinh v la dinh lien ke voi dinh trong list
	struct vlist *next;
}vlist;

//Danh sach cac dinh va canh trong bieu do
typedef struct Graph {
	vlist **adjList;
	int n;		// So luong dinh
	int m;		// So luong canh
} Graph;

typedef struct Stack {
	int *storage;
	int top;
} Stack;

Graph *build_graph(); //Xay dung do thi tu du lieu da nhap
void  add_arc(Graph *G, int u, int v);
void print_list_graph(Graph *G);
void print_vertex_list(vlist *vertex_list); //In ra danh sach cac dinh

Stack *init_stack(int capacity);
void push(Stack *S, int elem); 	// push 1 phan tu vao stack
int pop(Stack *S);  		// Lay (va loai bo) mot phan tu trong hang doi
int is_stack_empty(Stack *S);   // Kiem tra stack rong

void Kosaraju(Graph *G);
void DFS(Graph *G, int i, Stack *S);
Graph *reverse(Graph *G); //Dao nguoc do thi G
void print_connected_component(Graph *H, Stack *S); //In ra cac thanh phan lien thong manh (phai dc thao tac tren do thi nguoc G
void dfs_and_print(int v, Graph *H);

//MAIN
int main() {
	Graph *G = build_graph(); //Ve do thi
	Kosaraju(G);
	_getch();
	return 0;
}

int* mark; 		// Mot mang danh dau cac dinh da duoc tham
void Kosaraju(Graph *G) {
	Stack *S = init_stack(G->n);
	mark = (int *)malloc(G->n * sizeof(int));
	memset(mark, UNVISITED, G->n * sizeof(int));
	int i = 0;
	for (i = 0; i < G->n; i++) {
		if (mark[i] == UNVISITED) {
			DFS(G, i, S);
		}
	}

	Graph *H = reverse(G);
	print_connected_component(H, S);
}

void DFS(Graph *G, int i, Stack *S) {
	mark[i] = VISITED;
	vlist *arcs = G->adjList[i]; // Danh sach dinh ke voi dinh i
	while (arcs != NULL) {
		if (mark[arcs->v] == UNVISITED) {
			DFS(G, arcs->v, S);
		}
		arcs = arcs->next;
	}
	push(S, i);	// push i vao stack S sau khi duoc tham
}

int *Dm;	// Mang danh dau cac dinh da bi xoa tu do thi dao H va Stack S
void print_connected_component(Graph *H, Stack *S) {
	Dm = (int *)malloc(H->n * sizeof(int));
	memset(Dm, FALSE, H->n * sizeof(int));
	int c = 1;
	while (!is_stack_empty(S)) {
		int v = pop(S);
		if (!Dm[v]) {
			memset(mark, UNVISITED, H->n * sizeof(int));	// Danh dau tat ca cac dinh trong H chua duoc tham
			printf("Thanh Phan Lien Thong Manh #%d: ", c);
			dfs_and_print(v, H);
			printf("\n");
			c++;
		}
	}
}

// use dfs to list a set of vertices dfs_and_print from a vertex v in H Sung dung DFS de liet ke ra mot tap cac dinh dfs_and_print tu mot dinh v trong do thi H
void dfs_and_print(int v, Graph *H) {
	printf("%d,", v);
	mark[v] = VISITED;
	Dm[v] = TRUE;
	vlist *arcs = H->adjList[v]; // the adjacent list of vertex v
	while (arcs != NULL) {
		int u = arcs->v;
		if (mark[u] == UNVISITED && Dm[u] == FALSE) {
			dfs_and_print(u, H);
		}
		arcs = arcs->next;
	}
}
// Build do thi dao cua G dat ten la H
Graph *reverse(Graph *G) {
	Graph *H = (Graph *)malloc(sizeof(Graph));
	H->n = G->n;
	H->m = G->m;
	H->adjList = (vlist **)malloc(H->n * sizeof(vlist *));
	int i = 0;
	for (i = 0; i < H->n; i++) {
		H->adjList[i] = NULL;
	}
	// reverse arcs of G
	vlist *arcs;
	for (i = 0; i < G->n; i++) {
		arcs = G->adjList[i];
		while (arcs != NULL) {
			add_arc(H, arcs->v, i);
			arcs = arcs->next;
		}
	}
	return H;
}

// Xay dung cac thanh phan cua do thi
Graph *build_graph() {
	Graph *G = (Graph *)malloc(sizeof(Graph));
	/*G->n = 9;
	G->m = 16;*/
	G->n = 5;
	G->m = 5;
	G->adjList = (vlist **)malloc(G->n * sizeof(vlist *));
	int i = 0;
	for (i = 0; i < G->n; i++) {
		G->adjList[i] = NULL;
	}
	/*-add_arc(G, 0, 1);
	-add_arc(G, 0, 2);
	-add_arc(G, 0, 4);
	-add_arc(G, 1, 3);
	-add_arc(G, 2, 4);
	add_arc(G, 2, 5);
	-add_arc(G, 3, 0);
	add_arc(G, 3, 2);
	add_arc(G, 3, 7);
	add_arc(G, 3, 8);
	add_arc(G, 4, 5);
	add_arc(G, 5, 6);
	add_arc(G, 5, 8);
	add_arc(G, 6, 4);
	add_arc(G, 8, 2);
	add_arc(G, 8, 7);*/
	
	add_arc(G,1, 0);
	add_arc(G,0, 2);
	add_arc(G,2, 1);
	add_arc(G,0, 3);
	add_arc(G,3, 4);
	return G;
}

// add an u->v arc to the graph G    add dinh u ke voi v vao trong do thi G
void  add_arc(Graph *G, int u, int v) {
	// edd v to the head of the  vertex list of u
	vlist *arc = (vlist*)malloc(sizeof(vlist));
	arc->v = v;
	arc->next = G->adjList[u];
	G->adjList[u] = arc;
}

//In ra danh sach cac dinh
void print_vertex_list(vlist *vertex_list)    
	{
	while (vertex_list != NULL) {
		printf("%d ", vertex_list->v);
		vertex_list = vertex_list->next;
	}
	printf("\n");
}

//In ra cac thanh phan cua do thi G (dinh va canh)
void print_list_graph(Graph *G) {
	printf("num vertices: %d\n", G->n);
	printf("num edges: %d\n", G->m);
	int i = 0;
	for (i = 0; i < G->n; i++) {
		printf("adj list of %d : ", i);
		print_vertex_list(G->adjList[i]);
	}

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	KHOI Tao Stack
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Stack *init_stack(int capacity) // Khoi tao stack rong
{
	Stack *S = (Stack *)malloc(sizeof(Stack));
	S->top = -1; //Stack rong khi top = -1
	S->storage = (int*)malloc(capacity * sizeof(int)); //cap phat bo nho va tra ve mot con tro toi no
	return S;
}

void push(Stack *S, int elem) //Day du lieu vao stack
{
	S->top++; //tang top len 1
	S->storage[S->top] = elem; //gan du lieu
}

int pop(Stack *S) // Lay du lieu tu stack ra va xoa du lieu
{
	if (is_stack_empty(S)) {
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

