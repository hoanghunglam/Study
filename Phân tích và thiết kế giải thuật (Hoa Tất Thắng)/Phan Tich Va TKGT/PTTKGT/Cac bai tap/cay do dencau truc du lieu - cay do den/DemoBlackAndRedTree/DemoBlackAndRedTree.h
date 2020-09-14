// DemoBlackAndRedTree.h : main header file for the DEMOBLACKANDREDTREE application
//

#if !defined(AFX_DEMOBLACKANDREDTREE_H__0990CBA4_6DD1_4CDF_A709_D66D44ABD839__INCLUDED_)
#define AFX_DEMOBLACKANDREDTREE_H__0990CBA4_6DD1_4CDF_A709_D66D44ABD839__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeApp:
// See DemoBlackAndRedTree.cpp for the implementation of this class
//

class CDemoBlackAndRedTreeApp : public CWinApp
{
public:
	CDemoBlackAndRedTreeApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDemoBlackAndRedTreeApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CDemoBlackAndRedTreeApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DEMOBLACKANDREDTREE_H__0990CBA4_6DD1_4CDF_A709_D66D44ABD839__INCLUDED_)
