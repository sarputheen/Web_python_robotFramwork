*** Settings ***
Library     SeleniumLibrary
*** Variables ***

${DELETE FIRST PRODUCT}     xpath://*[@class="listProducts"]/li[1]/button
${WAIT TIME}       2s

*** Keywords ***
And I delete the product from my wishlist
    Sleep   ${WAIT TIME}
    Click Element  ${DELETE FIRST PRODUCT}
    Sleep   ${WAIT TIME}


