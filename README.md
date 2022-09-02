# LIGHTNING FLASH CARDS
>learn *anything* in a *flash*

Create a set of flash cards
on any topic
and drill them to commit content to
long term memory

Live site: https://lightning-flash-cards.herokuapp.com/

### FEATURES
- signup/login/logout
- create a custom deck of flash cards
- play mode to study
- flip card animation
- user confidence tracking, see less confident cards more often
- space bar/click to flip a card
- right/left arrow keys to indicate right/wrong answers

### TECH STACK
- Ruby on Rails
- ActiveRecord
- Postgresql
- Javascript
- jQuery
- HTML/CSS
- Deployed on Heroku

### INSTALL LOCALLY
1. $`rails db:migrate`
1. $`rails db:seed`
1. $`rails s`
1. open localhost:3000 in browser

---

[Link to Wireframes and User Stories](https://www.canva.com/design/DAFKgQackcU/oVsD_ee5a9D00DIHx9BTew/edit?utm_content=DAFKgQackcU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

### Known Issues
- arrow key handler fires on all screens (not just play mode) causing js errors
- performance issue in card randomiser when user increases in confidence  

### Roadmap / Wishlist
- upload images to cards
- upload user avatar
- card animations for swipe left and and right
- set study goal and timer
- user stats and celebration 
- track and report improvement in card confidence 
- mobile friendly view - swipe controls