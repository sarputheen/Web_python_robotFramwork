*** Settings ***
Library     SeleniumLibrary
*** Variables ***

${URL}   https://www.westwingnow.de/
${CHROME PATH}   /usr/local/bin/chromedriver
${ACCEPT COOKIES}   xpath://*[@id="onetrust-accept-btn-handler"]
${WAIT TIME}       5s
${USERNAME FIELD}   xpath://*[@type="email"]
${USERNAME}     sarputheenabbash@gmail.com
${PASSWORD FIELD}   xpath://*[@type="password"]
${PASSWORD}     Test@123
${NEWS LETTER CHECKBOX}    xpath://*[@name="isClubNewsletterSubscribed"]
${LOGIN BUTTON}     xpath://*[@type="submit"]
${DELETE FIRST PRODUCT}     xpath://*[@class="listProducts"]/li[1]/button
${LOGIN OVERLAY}      xpath://div[@data-testid="shop-to-club-popup-wrapper"]
${CREDENTIALS}
*** Keywords ***

Given I am on the WestwingNow home page (https://www.westwingnow.de)
    Create Browser Webdriver
    Go To    ${URL}
    Wait Until Element Is Visible  ${ACCEPT COOKIES}
    Click Element  ${ACCEPT COOKIES}


And I log in with username and password
    Input Text  ${USERNAME FIELD}     ${USERNAME}
    Input Text  ${PASSWORD FIELD}      ${PASSWORD}
    Click Element   ${NEWS LETTER CHECKBOX}
    Click Element  ${LOGIN BUTTON}

Then I should see the login/registration overlay
    Element Should Be Visible   ${LOGIN OVERLAY}

Then I Close the Browser
    Close Browser


Create Browser Webdriver
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage  #disable page crash of chrome
    Call Method    ${chrome_options}    add_argument    --no-sandbox  #disable sandbox mode
    Call Method    ${chrome_options}    add_argument    --headless  #run with no web browser
    Create Webdriver    driver_name=Chrome    alias=google    chrome_options=${chrome_options}    executable_path=${CHROME PATH}
    Set Window Size    1200    1000  #run on docker can't use Maximize Browser Window
