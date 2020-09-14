// DemoBlackAndRedTreeDoc.cpp : implementation of the CDemoBlackAndRedTreeDoc class
//

#include "stdafx.h"
#include "DemoBlackAndRedTree.h"

#include "DemoBlackAndRedTreeDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeDoc

IMPLEMENT_DYNCREATE(CDemoBlackAndRedTreeDoc, CDocument)

BEGIN_MESSAGE_MAP(CDemoBlackAndRedTreeDoc, CDocument)
	//{{AFX_MSG_MAP(CDemoBlackAndRedTreeDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeDoc construction/destruction

CDemoBlackAndRedTreeDoc::CDemoBlackAndRedTreeDoc()
{
	// TODO: add one-time construction code here

}

CDemoBlackAndRedTreeDoc::~CDemoBlackAndRedTreeDoc()
{
}

BOOL CDemoBlackAndRedTreeDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeDoc serialization

void CDemoBlackAndRedTreeDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeDoc diagnostics

#ifdef _DEBUG
void CDemoBlackAndRedTreeDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CDemoBlackAndRedTreeDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDemoBlackAndRedTreeDoc commands
