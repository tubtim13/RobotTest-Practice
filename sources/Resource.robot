*** Settings ***
Library           ExcelLibrary
Library           String
Library           sortcell.py
Library           Selenium2Library

*** Keywords ***
GetDataFromExcel
    [Arguments]    ${ExcelPath}    ${SheetName}    ${RowIndex}
    Open Excel    ${ExcelPath}
    ${Row}    Get Row Values    ${SheetName}    ${RowIndex}
    Run Keyword If    '${row[0][1]}'==''    Continue For Loop
    ${RowData}    Set Variable    ${Row}
    ${Sorted}    Sort Cell    ${RowData}
    [Return]    ${Sorted}

Scroll
    [Arguments]    ${x}    ${y}
    Execute Javascript    window.scrollTo(${x},${y})
