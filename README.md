# Restaurant-Finder

Description : This app helps user to search for restaurants using zip code or near by location.

Working : 
    1) This app takes two inputs
        a) search crieteria that is "food"
        b) zip code
    2) It will show the locations in map view and in table view.
    3) When user clicks on a perticular cell of a table view It will zoom in to that perticular location on map View.
    4) When user clicks on a map pin it will show the title and the address of the restaurant.
    5) When user clicks on a pin view it will redirect user to the details page and shows the details about the restaurant.
    
Implementation : 
    1) Table view : used table view to show the restaurants as a list, 
                    implemented delegates and DataSource to use it's required methods.
    2) MapView : Used MapView to show restaurants locations on a map. 
    3) JSON parsing : Did a network call and used api to fetch the data from the server related to restaurants available at a  
                      specific zip code
                      
Technology : swift 3
Tools : Xcode9 beta
