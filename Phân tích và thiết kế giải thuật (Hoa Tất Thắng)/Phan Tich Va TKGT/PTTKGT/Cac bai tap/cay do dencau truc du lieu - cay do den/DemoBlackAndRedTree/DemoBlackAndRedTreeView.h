// DemoBlackAndRedTreeView.h : interface of the CDemoBlackAndRedTreeView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DEMOBLACKANDREDTREEVIEW_H__1041DBE8_37C3_4FBD_9356_96DC3B55762F__INCLUDED_)
#define AFX_DEMOBLACKANDREDTREEVIEW_H__1041DBE8_37C3_4FBD_9356_96DC3B55762F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
#include"RedandBlac.h"

class CDemoBlackAndRedTreeView : public CView
{
protected: // create from serialization only
	CDemoBlackAndRedTreeView();
	DECLARE_DYNCREATE(CDemoBlackAndRedTreeView)

// Attributes
public:
	CDemoBlackAndRedTreeDoc* GetDocument();

// Operations
public:
	CRedAndBlac tree;
// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemoBlackAndRedTreeView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CDemoBlackAndRedTreeView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CDemoBlackAndRedTreeView)
	afx_msg void OnInsert();
	afx_msg void OnDelete();
	afx_msg void OnDrawTree();
	afx_msg void OnPaint();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in DemoBlackAndRedTreeView.cpp
inline CDemoBlackAndRedTreeDoc* CDemoBlackAndRedTreeView::GetDocument()
   { return (CDemoBlackAndRedTreeDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMOBLACKANDREDTREEVIEW_H__1041DBE8_37C3_4FBD_9356_96DC3B55762F__INCLUDED_)
