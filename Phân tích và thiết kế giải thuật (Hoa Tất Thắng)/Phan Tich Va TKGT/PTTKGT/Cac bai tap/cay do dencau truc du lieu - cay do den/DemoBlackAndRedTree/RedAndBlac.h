// RedAndBlac.h: interface for the CRedAndBlac class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_REDANDBLAC_H__1562ADED_E230_4049_B7EC_716F3A5CA064__INCLUDED_)
#define AFX_REDANDBLAC_H__1562ADED_E230_4049_B7EC_716F3A5CA064__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
typedef enum {
STATUS_OK,
STATUS_MEM_EXHAUSTED,
STATUS_DUPLICATE_KEY,
STATUS_KEY_NOT_FOUND
} StatusEnum;
typedef int KeyType; /* Ki?u d? li?u khoá */
/* D? li?u luu tr? */
typedef struct {
int stuff;
} RecType;
#define compLT(a,b) (a < b)
#define compEQ(a,b) (a == b)
/* Khai báo c?u trúc d? liêu */
typedef enum { BLACK, RED } nodeColor;
typedef struct NodeTag {
struct NodeTag *left; /* Con trái */
struct NodeTag *right; /* Con ph?i */
struct NodeTag *parent; /* Cha */
nodeColor color; /* Màu node (BLACK, RED) */
KeyType key; /* Khoá s? d?ng tìm ki?m */
RecType rec; /* D? li?u node */
} NodeType;
#define NIL &sentinel /* Node c?m canh */
static NodeType sentinel = { &sentinel, &sentinel, 0, BLACK, 0};
typedef NodeType *iterator;
static NodeType *root;// = NIL; /* Node g?c */

class CRedAndBlac  
{
public:
	void Draw(CDC *pDC);
	void DrawTree(int x1,int y1,int x2,int y2,int,NodeType *r,CDC *pDC);
	void DrawNode(int value,int x1,int y1,int x2,int y2,CDC *pDC,nodeColor color);
	void DrawCircle(int value,int x,int y,CDC *pDC,nodeColor color);
	int Xoa(int key);
	int Chen(int key);
	StatusEnum find(KeyType key, iterator *iter);
	RecType value(iterator i);
	StatusEnum eraseKey(KeyType key);
	StatusEnum erase(iterator z);
	void deleteFixup(NodeType *x);
	StatusEnum insert(KeyType key, RecType *rec);
	static void insertFixup(NodeType *x);
	static void rotateRight(NodeType *x);
	static void rotateLeft(NodeType *x);
	CRedAndBlac();
	virtual ~CRedAndBlac();
private:
	

};

#endif // !defined(AFX_REDANDBLAC_H__1562ADED_E230_4049_B7EC_716F3A5CA064__INCLUDED_)
