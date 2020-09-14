// DemoBlackAndRedTreeView.cpp : implementation of the CDemoBlackAndRedTreeView class
//

#include "stdafx.h"
#include "DemoBlackAndRedTree.h"
#include "Value.h"

#include "DemoBlackAndRedTreeDoc.h"
#include "DemoBlackAndRedTreeView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView

IMPLEMENT_DYNCREATE(CDemoBlackAndRedTreeView, CView)

BEGIN_MESSAGE_MAP(CDemoBlackAndRedTreeView, CView)
	//{{AFX_MSG_MAP(CDemoBlackAndRedTreeView)
	ON_COMMAND(ID_Insert, OnInsert)
	ON_COMMAND(ID_Delete, OnDelete)
	ON_COMMAND(ID_DrawTree, OnDrawTree)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView construction/destruction

CDemoBlackAndRedTreeView::CDemoBlackAndRedTreeView()
{
	// TODO: add construction code here

}

CDemoBlackAndRedTreeView::~CDemoBlackAndRedTreeView()
{
}

BOOL CDemoBlackAndRedTreeView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView drawing

void CDemoBlackAndRedTreeView::OnDraw(CDC* pDC)
{
	CDemoBlackAndRedTreeDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView printing

BOOL CDemoBlackAndRedTreeView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CDemoBlackAndRedTreeView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CDemoBlackAndRedTreeView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView diagnostics

#ifdef _DEBUG
void CDemoBlackAndRedTreeView::AssertValid() const
{
	CView::AssertValid();
}

void CDemoBlackAndRedTreeView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CDemoBlackAndRedTreeDoc* CDemoBlackAndRedTreeView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CDemoBlackAndRedTreeDoc)));
	return (CDemoBlackAndRedTreeDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeView message handlers

void CDemoBlackAndRedTreeView::OnInsert() 
{
	// TODO: Add your command handler code here
	CValue temp;
	if(temp.DoModal()==IDOK)
	{
	int value=temp.GetValue();
	if(tree.Chen(value))
		MessageBox("chen thanh cong");
	else
		MessageBox("Khong Thanh cong");
	}

	CDC *pDC=GetDC();
	Invalidate();
//	tree.Draw(pDC);

}

void CDemoBlackAndRedTreeView::OnDelete() 
{
	// TODO: Add your command handler code here
	
	CValue temp;
	if(temp.DoModal()==IDOK)
	{
	int value=temp.GetValue();
	if(tree.Xoa(value))
		MessageBox("Xoa Thanh Cong");
	else
		MessageBox("Xoa khong thanh cong");
	}
	CDC *pDC=GetDC();
	Invalidate();
//	tree.Draw(pDC);
}

void CDemoBlackAndRedTreeView::OnDrawTree() 
{
	// TODO: Add your command handler code here
	StatusEnum status;
	CValue temp;
	iterator iter;
	if(temp.DoModal()==IDOK)
	{
	int value=temp.GetValue();
	if((status=tree.find(value,&iter))==STATUS_OK)
		MessageBox("Tim thay");
	else
		MessageBox("KHong tim thay");
	}
	CDC *pDC=GetDC();
	Invalidate();

}

void CDemoBlackAndRedTreeView::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here
	CDC *pDC=GetDC();
	pDC->TextOut(10,10,"Click 'mui ten' de Insert gia tri vao cay");
	pDC->TextOut(10,25,"Click 'X' de Delete gia tri ra khoi cay");
	pDC->TextOut(10,40,"Click bieu tuong cuoi, de tim  gia tri");
	
	tree.Draw(pDC);
	// Do not call CView::OnPaint() for painting messages
}
