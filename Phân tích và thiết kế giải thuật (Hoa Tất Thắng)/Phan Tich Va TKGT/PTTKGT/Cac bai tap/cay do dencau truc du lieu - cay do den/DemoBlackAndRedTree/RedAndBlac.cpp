// RedAndBlac.cpp: implementation of the CRedAndBlac class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "DemoBlackAndRedTree.h"
#include "RedAndBlac.h"
#include "malloc.h"
#include "stdlib.h"
#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CRedAndBlac::CRedAndBlac()
{
	
	root =NIL;
	
}

CRedAndBlac::~CRedAndBlac()
{
	
}

void CRedAndBlac::rotateLeft(NodeType *x)
{
	NodeType *y = x->right;
	/* Thi?t l?p liên k?t x->right */
	x->right = y->left;
	if (y->left != NIL) y->left->parent = x;
	/* Thi?t l?p liên k?t y->parent */
	if (y != NIL) y->parent = x->parent;
	if (x->parent) {
		if (x == x->parent->left)
			x->parent->left = y;
		else
			x->parent->right = y;
	} else {
		root = y;
	}
	/* link x and y */
	y->left = x;
	if (x != NIL) x->parent = y;
	
	
}

void CRedAndBlac::rotateRight(NodeType *x)
{
/****************************
* Xoay node x bên ph?i *
	****************************/
	NodeType *y = x->left;
	/* Thi?t l?p liên k?t x->left */
	x->left = y->right;
	if (y->right != NIL) y->right->parent = x;
	/* Thi?t l?p liên k?t y->parent */
	if (y != NIL) y->parent = x->parent;
	if (x->parent) {
		if (x == x->parent->right)
			x->parent->right = y;
		else
			x->parent->left = y;
	} else {
		root = y;
	}
	/* liên k?t x và y */
	y->right = x;
	if (x != NIL) x->parent = y;
	
}

void CRedAndBlac::insertFixup(NodeType *x)
{
	/* Ki?m tra thu?c tính d? den */
	while (x != root && x->parent->color == RED) {
		/* we have a violation */
		if (x->parent == x->parent->parent->left) {
			NodeType *y = x->parent->parent->right;
			if (y->color == RED) {
				/* chú bác là RED */
				x->parent->color = BLACK;
				y->color = BLACK;
				x->parent->parent->color = RED;
				x = x->parent->parent;
			} else {
			
				if (x == x->parent->right) {
					
					x = x->parent;
					rotateLeft(x);
	
				}
				
				x->parent->color = BLACK;
				x->parent->parent->color = RED;
				rotateRight(x->parent->parent);
			}
		} else {
			
			NodeType *y = x->parent->parent->left;
			if (y->color == RED) {
			
				x->parent->color = BLACK;
				y->color = BLACK;
				x->parent->parent->color = RED;
				x = x->parent->parent;
				
			} else {
			
				if (x == x->parent->left) {
					x = x->parent;
					rotateRight(x);
				}
				x->parent->color = BLACK;
				x->parent->parent->color = RED;
				rotateLeft(x->parent->parent);
			}
	
		}
	}
	root->color = BLACK;
	
}

StatusEnum CRedAndBlac::insert(KeyType key, RecType *rec)
{
	NodeType *current, *parent, *x;
	
	current = root;
	parent = 0;
	while (current != NIL) {
		if (compEQ(key, current->key)) 
			return STATUS_DUPLICATE_KEY;
		parent = current;
		current = compLT(key, current->key) ?
			current->left : current->right;
	}
	
	x =(NodeType*) malloc (sizeof(NodeType));
	
	if (x == NULL)
		return STATUS_MEM_EXHAUSTED;
	x->parent = parent;
	x->left = NIL;
	x->right = NIL;
	x->color = RED;
	x->key = key;
	x->rec = *rec;
	
	if(parent) {
		if(compLT(key, parent->key))
			parent->left = x;
		else
			parent->right = x;
	} else {
		root = x;
	}
	insertFixup(x);
	return STATUS_OK;
	
}

void CRedAndBlac::deleteFixup(NodeType *x)
{
	while (x != root && x->color == BLACK) {
		if (x == x->parent->left) {
			NodeType *w = x->parent->right;
			if (w->color == RED) {
				w->color = BLACK;
				x->parent->color = RED;
				rotateLeft (x->parent);
				w = x->parent->right;
			}
			if (w->left->color == BLACK && w->right->color == BLACK) {
				w->color = RED;
				x = x->parent;
			} else {
				if (w->right->color == BLACK) {
					w->left->color = BLACK;
					w->color = RED;
					rotateRight (w);
					w = x->parent->right;
				}
				w->color = x->parent->color;
				x->parent->color = BLACK;
				w->right->color = BLACK;
				rotateLeft (x->parent);
				x = root;
			}
		} else {
			NodeType *w = x->parent->left;
			if (w->color == RED) {
				w->color = BLACK;
				x->parent->color = RED;
				rotateRight (x->parent);
				w = x->parent->left;
			}
			if (w->right->color == BLACK && w->left->color == BLACK) {
				w->color = RED;
				x = x->parent;
			} else {
				if (w->left->color == BLACK) {
					w->right->color = BLACK;
					w->color = RED;
					rotateLeft (w);
					w = x->parent->left;
				}
				w->color = x->parent->color;
				x->parent->color = BLACK;
				w->left->color = BLACK;
				rotateRight (x->parent);
				x = root;
			}
		}
	}
	x->color = BLACK;
	
	
}

StatusEnum CRedAndBlac::erase(iterator z)
{
	NodeType *x, *y;
	if (z->left == NIL || z->right == NIL) {
	
		y = z;
	} else {
	
		y = z->right;
		while (y->left != NIL) y = y->left;
	}
	
	if (y->left != NIL)
		x = y->left;
	else
		x = y->right;
	
	x->parent = y->parent;
	if (y->parent)
		if (y == y->parent->left)
			y->parent->left = x;
		else
			y->parent->right = x;
		else
			root = x;
		if (y != z) {
			z->key = y->key;
			z->rec = y->rec;
		}
		if (y->color == BLACK)
			deleteFixup (x);
		free (y);
		return STATUS_OK;
		
}

StatusEnum CRedAndBlac::eraseKey(KeyType key)
{
	NodeType *z;
	
	z = root;
	while(z != NIL) {
		if(compEQ(key, z->key)) 
			break;
		else
			z = compLT(key, z->key) ? z->left : z->right;
	}
	if (z == NIL) return STATUS_KEY_NOT_FOUND;
	return erase(z);
}

iterator next(iterator i) {
	if (i->right != NIL) {
		for (i = i->right; i->left != NIL; i = i->left);
	} else {
		iterator p = i->parent;
		while (p && i == p->right) {
			i = p;
			p = p->parent;
		}
		
		i = p;
	}
	return i;
}
iterator begin() {
	
	iterator i;
	for (i = root; i->left != NIL; i = i->left);
	return i;
}
iterator end() {
	
	return NULL;
	
	
}

RecType CRedAndBlac::value(iterator i)
{
	return i->rec;
	
}

StatusEnum CRedAndBlac::find(KeyType key, iterator *iter)
{
	NodeType *current;
	current = root;
	while(current != NIL) {
		if(compEQ(key, current->key)) {
			*iter = current;
			return STATUS_OK;
		} else {
			current = compLT (key, current->key) ?
				current->left : current->right;
		}
	}
	return STATUS_KEY_NOT_FOUND;
}




int CRedAndBlac::Chen(int x)
{

	KeyType key=x;
	RecType rec;
	StatusEnum status;
	iterator iter;

		if((status=find(key,&iter))==STATUS_OK)
		{
			MessageBox(NULL,"NODE da co roi!!!","Error",MB_OK|MB_ICONSTOP);

		}
		else
		{
			rec.stuff=key;

			char a[1];
			int x;
			status=insert(key,&rec);
			return TRUE;
		}
	return FALSE;
}

int CRedAndBlac::Xoa(int key)
{
	RecType rec;
	iterator iter;
	
	StatusEnum status;
	
	if ((status = find(key, &iter)) == STATUS_OK) {
		rec = value(iter);
		if (rec.stuff != key) printf("fail rec\n");
		status = erase(iter);
		if (status) {
			printf("fail: status = %d\n", status);
			return 0;
		}
	} else {
		rec.stuff = key;
		status = eraseKey(key);
		if (status) {
			printf("fail: status = %d\n", status);
			return 0;
		}
	}
	return 1;
}

void CRedAndBlac::DrawCircle(int value, int x, int y,CDC *pDC,nodeColor color)
{
	RECT rec;
	int tx,ty;
	tx=30;
	ty=30;
	rec.left=x;
	rec.right=x+tx;
	rec.top=y;
	rec.bottom=y+ty;
	CBrush brush,*oldBrush;
	if(color ==BLACK)
		brush.CreateSolidBrush(RGB(0,0,0));
	else
		brush.CreateSolidBrush(RGB(255,0,0));
	CPen pen,*oldPen;
	pen.CreatePen(PS_SOLID, 2, RGB(255,0,0));

	oldBrush= pDC->SelectObject(&brush);
	oldPen=pDC->SelectObject(&pen);
	pDC->Ellipse(&rec);
	char so[10];
	itoa(value,so,10);
	pDC->TextOut(x+7,y+7,so);
	
	pDC->SelectObject(oldPen);
	pDC->SelectObject(oldBrush);
	
	brush.DeleteObject();
	

}

void CRedAndBlac::DrawNode(int value, int x1, int y1, int x2, int y2, CDC *pDC,nodeColor color)
{
	pDC->MoveTo(x1+15,y1+30);
	pDC->LineTo(x2+10,y2+10);
	DrawCircle(value,x2,y2,pDC,color);
}

void CRedAndBlac::DrawTree(int x1,int y1,int x2,int y2,int t,NodeType *r,CDC *pDC)
{
	int rx=300;
	int ry=10;
	NodeType *current =r;
	if(current!=NIL)
	{
		if(current==root)
			DrawNode(current->key,rx,ry,rx,ry,pDC,current->color);
			else
				DrawNode(current->key,x1,y1,x2,y2,pDC,current->color);
			if(current->left!=NIL){
				DrawTree(x2,y2,x2-60-t,y2+100-t,t+10,current->left,pDC);
			}
			if(current->right!=NIL){
				DrawTree(x2,y2,x2+80-t,y2+100+t,t+10,current->right,pDC);
			}
			
	}

}

void CRedAndBlac::Draw(CDC *pDC)
{
//	root=begin();
	DrawTree(300,10,300,10,0,root,pDC);

}

//DEL NodeType * CRedAndBlac::Parent()
//DEL {
//DEL 	if(r->parent!=NULL)
//DEL 		return 
//DEL }
