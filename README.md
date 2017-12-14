# AmusementParkPassGenerator

Amusement Park Pass Generator is an iPad app created as projects four and five of the Treehouse iOS Techdegree. The app allows the clerk at an amusement park to manage entry of guests and vendors into the park.

## Screenshots
<p align="center"><img src="https://i.imgur.com/xeu935h.png" width="400"> <img src="https://i.imgur.com/kc2jzkO.png" width="400"></p>

## Project Instructions

### Part 1
For this project, you’ll create a system for creating and validating access passes to an amusement park. There are three types of people who can be granted access to the park: employees, vendors, and of course, guests. As you can imagine, these different groups are allowed to enter different areas of the park, and may or may not be permitted to do certain things, like ride the rides or receive discounts in certain eateries and shops, for example.

Within each category of park access, there should be several sub-categories with varying access rights. For example, guests can be “Classic”, “VIP”, or “Free Child”, with different privileges associated with each. Details on exactly what each type of entrant is permitted to do and what type of personal information is required from them are outlined in the Business Rules Matrix. The document can be downloaded in the Project Resources area.

This project is divided into two parts. Part 1, outlined here as Project 4, will focus on building the data structures, object definitions, logic, error handling and other plumbing for the app. No user interface will be built at this stage. Your code will be built, tested and run by using temporary hard-coded “plug” values (or test cases).

For Part 2, which is Project 5, you will construct the User Interface element and workflow. They are shown in the project mockups and Onward and Upward Instruction Video. You will also add features like data entry screen and pass generation. In addition, several additional types of entrants such as contracted employees, vendors, season pass holders and senior guests, will be added. Keep in mind that you’ll want to write the code for Part I so it can be reused and extended in Part 2. (You will probably need to refactor some code, regardless, but do keep this in mind.)

In creating your code, be sure to make use of optionals, enums, protocols, data structures (such as collections) and error handling. Also, remember you can use a combination of both inheritance and composition, depending on which is best suited for the particular feature. The majority of the tools, syntax and concepts needed to complete Part I have been covered in the courses so far. However the implementation of certain elements, like dates and extra credit items will require you to seek additional resources and documentation.

Just to be clear, the app you are creating would utilized by the staff of the amusement park at the entrance gates, inside their kiosk. Actual entrants wouldn’t see the screen. They will tell the staff their relevant information and staff members would type it on the iPad screen and generate the passes. The access levels of the passes will then be tested by simulated “swiping’ on the iPad. The completed app in Project 5 will not actually print any passes, but simply creates an image of the pass, as per the mockups. Please watch the Onward and Upward Instruction Video for a walk through of the app in order to get a full understanding.

### Part 2
You will now take the foundation you created in Project 4 (Amusement Park Generator (I)) and add the User Interface for the app, along with a short list of new features and entrant types handling. You might need to refactor some code in order to accommodate these changes.

Upon completion, you will have a functional iPad app, created entirely yourself! The app can take user input and create personalized entrant passes for all the entrant types. When the passes are being swiped at different locations in the park, business rules such as whether the entrant is allowed to access an area, whether the entrant can get a discount, will be tested.
