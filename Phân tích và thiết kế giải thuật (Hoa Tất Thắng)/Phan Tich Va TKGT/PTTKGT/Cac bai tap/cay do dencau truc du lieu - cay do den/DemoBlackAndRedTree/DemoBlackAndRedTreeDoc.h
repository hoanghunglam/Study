// DemoBlackAndRedTreeDoc.h : interface of the CDemoBlackAndRedTreeDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DEMOBLACKANDREDTREEDOC_H__927663BD_0325_4D21_9B64_D9E0D5393D49__INCLUDED_)
#define AFX_DEMOBLACKANDREDTREEDOC_H__927663BD_0325_4D21_9B64_D9E0D5393D49__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CDemoBlackAndRedTreeDoc : public CDocument
{
protected: // create from serialization only
	CDemoBlackAndRedTreeDoc();
	DECLARE_DYNCREATE(CDemoBlackAndRedTreeDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemoBlackAndRedTreeDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CDemoBlackAndRedTreeDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CDemoBlackAndRedTreeDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMOBLACKANDREDTREEDOC_H__927663BD_0325_4D21_9B64_D9E0D5393D49__INCLUDED_)
