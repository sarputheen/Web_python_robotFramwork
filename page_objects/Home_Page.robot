*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${SEARCH FIELD}     xpath://*[@data-testid='search-input']
${SEARCH VALUE}     möbel
${PRODUCT LIST}     xpath://div[@data-testid='plp-products-grid']/div
${WISH LIST COUNT}      XPATH://div[@data-testid="wishlist-bubble"]/div/span/span
${WAIT TIME}       2s
${FIRST PRODUCT}    xpath:(//button[@data-testid='wishlist-icon'])[1]
${WISH LIST ICON}   xpath://*[@class='icon-wishlist']

*** Keywords ***
When I search for "möbel"
    Input Text  ${SEARCH FIELD}     ${SEARCH VALUE}
    Press Keys       ${SEARCH FIELD}   ENTER
    Sleep   ${WAIT TIME}


Then I should see product listing page with a list of products
    ${count}=    Get Element Count    ${PRODUCT LIST}
    Should Be True    ${count}>1
    Sleep   ${WAIT TIME}

When I click on wishlist icon of the first found product
    Sleep  ${WAIT TIME}
    Click Element  ${FIRST PRODUCT}


Then the product should be added to the wishlist and the count should be 1
    Sleep  ${WAIT TIME}
    Element Should Contain  ${WISH LIST COUNT}  1


And I go to the wishlist page
    Sleep  ${WAIT TIME}
    Click Element  ${WISH LIST ICON}