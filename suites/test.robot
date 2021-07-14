*** Settings ***
Resource  ../page_objects/Common_Functionality.robot
Resource  ../page_objects/Home_Page.robot
Resource  ../page_objects/Wish_List.robot

*** Variables ***

*** Test Cases ***
Add a product in wish list and remove the same
    [Tags]  addWishList
    Common_Functionality.Given I am on the WestwingNow home page (https://www.westwingnow.de)
    Home_Page.When I search for "möbel"
    Home_Page.Then I should see product listing page with a list of products
    Common_Functionality.Then I should see the login/registration overlay
    Common_Functionality.And I log in with username and password
    Home_Page.When I click on wishlist icon of the first found product
    Home_Page.Then the product should be added to the wishlist and the count should be 1
    Home_Page.And I go to the wishlist page
    Wish_List.And I delete the product from my wishlist
    Common_Functionality.Then I Close the Browser

Duplicate test case to test the Tags
    [Tags]  addWishList1
    Common_Functionality.Given I am on the WestwingNow home page (https://www.westwingnow.de)
    Home_Page.When I search for "möbel"
    Home_Page.Then I should see product listing page with a list of products
    Common_Functionality.Then I should see the login/registration overlay
    Common_Functionality.And I log in with username and password
    Home_Page.When I click on wishlist icon of the first found product
    Home_Page.Then the product should be added to the wishlist and the count should be 1
    Home_Page.And I go to the wishlist page
    Wish_List.And I delete the product from my wishlist
    Common_Functionality.Then I Close the Browser



