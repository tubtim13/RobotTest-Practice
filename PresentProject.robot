*** Settings ***
Library           ExcelLibrary
Library           Selenium2Library
Library           BuiltIn
Library           String
Library           Collections
Library           OperatingSystem
Resource          ../sources/Resource.robot

*** Variables ***
${URL}            https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1532399553&rver=6.7.6640.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3d906c4044-c024-8a5d-35da-910f86095132&id=292841&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015
${ExcelPath}      ${CURDIR}\\Test Data.xls
${Username}       tubtim_kuph@hotmail.com
${Password}       0895343487Gg

*** Test Cases ***
Go to Hotmail
    Open Excel    ${ExcelPath}
    ${RowCn}    Get Row Count    Sheet1
    : FOR    ${Index}    IN RANGE    1    ${RowCn}
    \    ${Message}    GetDataFromExcel    ${ExcelPath}    Sheet1    ${Index}
    \    ${Length}    Get Length    ${Message}
    \    Run Keyword If    ${Length}==0    Continue For Loop
    \    Open Browser    ${URL}    gc
    \    Input Text    i0116    ${Username}
    \    Sleep    2s
    \    Click Element    idSIButton9
    \    Input Text    i0118    ${Password}
    \    Sleep    2s
    \    Click Element    idSIButton9
    \    Sleep    2s
    \    Click Element    xpath=//*[@id="app"]/div/div[2]/div[1]/div[1]/div[1]/div[1]/div/button/div
    ${EMPTY}
    ${EMPTY}

test
    Open Excel    ${ExcelPath}
    ${RowCn}    Get Row Count    Sheet1
    :FOR    ${Index}    IN RANGE    1    ${RowCn}
    \    ${Cinema}    GetDataFromExcel    ${ExcelPath}    Sheet1    ${Index}
    \    ${Length}    Get Length    ${Cinema}
    \    Run Keyword If    ${Length}==0    Continue For Loop
    \    Open Browser    http://www.majorcineplex.com/th/main    gc
    \    Maximize Browser Window
    \    Click Element    //*[@id="h-bar"]/div/div/div[2]/div[2]/div[1]/a
    \    Sleep    2s
    \    Click Element    //*[@data-movie-name-en='${Cinema[0][1]}']
    \    Comment    \    //*[@data-movie-name-en="bar-1"[contains(text(),'${Cinema[0][1]}']
    \    Sleep    2s
    \    Click Element    //*[@id="h-bar"]/div/div/div[2]/div[2]/div[3]/a
    \    Sleep    2s
    \    Click Element    //*[@data-filter-cinema-name='${Cinema[1][1]}']
    \    Sleep    2s
    \    Click Element    submit_showtime
    \    Sleep    3s
    \    Scroll    0    500
    \    Sleep    10s
    \    Close Browser
