; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CDemoBlackAndRedTreeView
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "DemoBlackAndRedTree.h"
LastPage=0

ClassCount=6
Class1=CDemoBlackAndRedTreeApp
Class2=CDemoBlackAndRedTreeDoc
Class3=CDemoBlackAndRedTreeView
Class4=CMainFrame

ResourceCount=3
Resource1=IDR_MAINFRAME
Class5=CAboutDlg
Resource2=IDD_ABOUTBOX
Class6=CValue
Resource3=IDD_DIALOG1

[CLS:CDemoBlackAndRedTreeApp]
Type=0
HeaderFile=DemoBlackAndRedTree.h
ImplementationFile=DemoBlackAndRedTree.cpp
Filter=N

[CLS:CDemoBlackAndRedTreeDoc]
Type=0
HeaderFile=DemoBlackAndRedTreeDoc.h
ImplementationFile=DemoBlackAndRedTreeDoc.cpp
Filter=N

[CLS:CDemoBlackAndRedTreeView]
Type=0
HeaderFile=DemoBlackAndRedTreeView.h
ImplementationFile=DemoBlackAndRedTreeView.cpp
Filter=W
BaseClass=CView
VirtualFilter=VWC
LastObject=IDC_Value


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_DrawTree




[CLS:CAboutDlg]
Type=0
HeaderFile=DemoBlackAndRedTree.cpp
ImplementationFile=DemoBlackAndRedTree.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=7
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_CUT
Command12=ID_EDIT_COPY
Command13=ID_EDIT_PASTE
Command14=ID_VIEW_TOOLBAR
Command15=ID_VIEW_STATUS_BAR
Command16=ID_APP_ABOUT
CommandCount=16

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
Command9=ID_Insert
Command10=ID_Delete
Command11=ID_DrawTree
CommandCount=11

[DLG:IDD_DIALOG1]
Type=1
Class=CValue
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_Value,edit,1350631552
Control4=IDC_STATIC,static,1342308352

[CLS:CValue]
Type=0
HeaderFile=Value.h
ImplementationFile=Value.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC

