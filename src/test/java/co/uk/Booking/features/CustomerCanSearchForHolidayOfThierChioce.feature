Feature: Search for Holiday destinations of my Choice
  As a customer
  I want the ability to search for Holiday destinations of my choice
  So that I can book any available holiday destination

  Scenario Outline: Customer can book holiday Destination
    Given I navigate to Booking.com Homepage
    When I enter a "<Location>" in the search text box
    And I select "<CheckInDate>" in the search text box
    And I select "<CheckOutDate>" in the search text box
    And I select "<Adult>" from search dropdown box
    And I select "<Children>" from search dropdown box
    And I select "<Rooms>" from Bedrooms dropdown
    And I click on Search button
    Then a list of "<destination>" in "<Prices>" are displayed
    And I click on one of the results links


    Examples:
      |Location      |CheckInDate|CheckOutDate|Adult   |Children|Rooms|Prices|
      |Granada Spain|27/03/2020 |12/04/2020  |2        |0      |1    | Â£1,600|
      |Belgium      |25/03/2020 |05/04/2020 |2         |1      |1    |Â£2,000 |
      |Canada       |20/3/2020  |01/04/2020  |4        |2      |2    |Â£4,500 |




  Scenario Outline: Error message is displayed for invalid search
    Given I navigate to Booking.com Homepage
    When I enter a "<Location>" in the search text box
    And I select "<CheckInDate>" in the search text box
    And I select "<CheckOutDate>" in the search text box
    And I select "<Adult>" from search dropdown box
    And I select "<Children>" from search dropdown box
    And I select "<Rooms>" from Bedrooms dropdown
    And I click on Search button
    Then a list of "<destination>" in "<Prices>" are displayed
    And I click on one of the results links
    And an error page is displayed


    Examples:
      |Location      |CheckInDate|CheckOutDate |Adult|Children|Rooms|Prices|
      | Grapan       |27/03/2012 |   12/04/2013 |2        |0      |1    | Â£0|
      | Sparian      |25/03/2000 |05/04/2014    |2        |1      |1    |Â£0|
      | Landron      |20/3/2019  |01/04/2020    |4        |2      |2    |Â£0|



  Scenario Outline: Customer cannot book holiday with missing values
    Given I navigate to Booking.com Homepage
    When I enter a "<Location>" in the search text box
    And I select "<CheckInDate>" in the search text box
    And I select "<CheckOutDate>" in the search text box
    And I select "<Adult>" from search dropdown box
    And I select "<Children>" from search dropdown box
    And I select "<Rooms>" from Bedrooms dropdown
    And I click on Search button
    Then a list of "<destination>" in "<Prices>" are displayed
    And I click on one of the results links
    And an error page is displayed


    Examples:
      |Location      |CheckInDate|CheckOutDate |Adult|Children|Rooms|Prices|
      |       |27/03/2012 |   12/04/2013 |2        |0      |1    | Â£0|
      |       |25/03/2000 |05/04/2014    |2        |1      |1    |Â£0|
      |       |20/3/2019  |01/04/2020    |4        |2      |12   |Â£0|
      |       |20/3/2019  |01/04/2023    |7       |2      |12   |Â£0|
