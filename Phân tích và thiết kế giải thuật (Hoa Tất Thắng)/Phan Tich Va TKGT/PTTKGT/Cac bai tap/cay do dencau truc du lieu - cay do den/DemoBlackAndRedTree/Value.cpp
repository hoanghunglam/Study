// Value.cpp : implementation file
//

#include "stdafx.h"
#include "DemoBlackAndRedTree.h"
#include "Value.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CValue dialog


CValue::CValue(CWnd* pParent /*=NULL*/)
	: CDialog(CValue::IDD, pParent)
{
	//{{AFX_DATA_INIT(CValue)
	m_Value = 0;
	//}}AFX_DATA_INIT
}


void CValue::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CValue)
	DDX_Text(pDX, IDC_Value, m_Value);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CValue, CDialog)
	//{{AFX_MSG_MAP(CValue)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CValue message handlers

int CValue::GetValue()
{

	return GiaTri;

}

void CValue::OnOK() 
{
	// TODO: Add extra validation here
	UpdateData(TRUE);
	GiaTri=m_Value;
	CDialog::OnOK();
}

BOOL CValue::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	GiaTri=0;
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
