#if !defined(AFX_VALUE_H__B0289F12_B33E_4A08_B286_E8528D6DF746__INCLUDED_)
#define AFX_VALUE_H__B0289F12_B33E_4A08_B286_E8528D6DF746__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Value.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CValue dialog

class CValue : public CDialog
{
// Construction
public:
	int GiaTri;
	int GetValue();
	CValue(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CValue)
	enum { IDD = IDD_DIALOG1 };
	int		m_Value;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CValue)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CValue)
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VALUE_H__B0289F12_B33E_4A08_B286_E8528D6DF746__INCLUDED_)
