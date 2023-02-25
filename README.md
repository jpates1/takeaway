# Takeaway

This is a basic system of classes as part of the Makers Academey "Golden Square" module. The project aims to visit some of the programming techniques that we have learnt in the first module of the course:
- Object Orientated Design
- Test Driven Development
- Debugging

I built some classes that follow this user story:
* Allows the user to add some items from a menu to an order.
* Gives the user an itemised receipt of their order, with a grand total. 
* Sends them a text message using the "twilio-ruby' gem confirming their order and the delivery time. 

## Message to Coaches
👋. Thanks for reviewing! A few things to note about this project. 

### Things I am proud of and happy with:
* I am quite proud of how simple I managed to get it in the end. The temptation to overdesign and overcomplicate at the beggining of the project was real but ultimatley a huge distraction. I'm quite confident that the final result has stuck to the brief. 
* Given the module so far hasn't included much git, I am pleased that I followed the process and commited a fair amount at what felt like the appropriate moments, but perhaps I could have done a bit more here. 
* Mocking the classes in the unit tests was a real headscratcher, but I am pleased with where I have ended up and I think they're all working as they should.


### Things I could have done better:
* DESIGN! I fluffed it. It took me a long time to figure out how all the classes would talk to eachother. It wasn't clear to me what the methods would end up being let alone what the tests should be. 
  * I considered going back and changing the soloproject.md file to update it with the finalised system and methods, but I didn't think it would be authentic so I have left it in. 
  * I really want to work on this as a skill so welcome any advice on how to theoretical application of class design. 

* Testing. I think I could go further on thinking about some edge cases. For now, I will leave as is as the basic functionality of the tests is there, but its one to revist in the future. I welcome any comments here please. 


## Message to Future Me

### Notes on how to make this better when I get some spare time. 

1. Create some sort of UI / terminal application that allows the customer to control the programme:
  - Allow user to enter some details like their name and phone number.
  - Allow user input for adding and removing items from their order.
2. Think a bit more about the edge cases in the unit testing. 
3.  Add some more functionality:
  - Consider removing items from the order, as well as adding.
  - Give a running total as the order grows.

