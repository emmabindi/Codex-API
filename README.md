# Codex
### **Learning and productivity app for developers**

Built using React on Rails and styled with SASS.  
Test driven development using RSPEC and Cypress. 

*Created by Michael Shepherd and Emma Bindi*

--- 

## <a name="toc"/>Table of Contents:</a>

[Links](#links)  
[Setup Instructions & Logins](#setup)   
[Purpose](#purpose)   
[Functionality & Features](#functionality)   
[Tech Stack](#techstack)   
[Target Audience](#targetaudience)  
[User Stories & Personas](#userstories)  
[Wireframes](#wireframes)  
[Testing](#testing)  
[Project Management](#projectmgnt)

---

<a name="links"/></a>
## Links  

#### Github API: https://github.com/emmabindi/Codex-API
#### Github Client: https://github.com/mwshepherd/codex-client

#### Heroku: https://secure-lake-11760.herokuapp.com/
#### Netlify: https://codex-app.netlify.app/

---

<a name="setup"/></a>
## Setup Instructions (Local)

API
- Clone the api repo
- Bundle install to install all required dependencies
- Rake db:setup to create local database migrate and seed
- Rails s to run the rails server

Client
- Clone the client repo
- yarn install for all required dependencies
- yarn start to start server 

### Logins

Email  | Password |   
| ------------ | :-------|    
| h@gmail.com | `password` 
| c@gmail.com | `password`   
| z@gmail.com | `password`   
| a@gmail.com | `password`   

--- 

[⇧](#toc)  


<a name="purpose"/></a>
## Purpose

- Capture the learning journey (wins/challenges/tools) for devs 
- Create a centralised repository for reusable code snippets and useful bookmarks 
- Provide search functionality to easily retrieve summary of learnings and bookmarked references. This information can be used for interviews and creating blog entries 
- Output useful statistics on learning and journalling progress to foster sense of achievement and motivation.

<a name="functionality"/></a>
## Functionality/Features   

1. Journal: users can add private journal entries with option to include code snippets, tag with category. Filtering by date and search by keyword or category.    
2. Bookmarks: users can store url's with a description and tag by category and search these y category or keyword
3. Pomodoro Clock: timer to count time spent coding and track total for user analytics. 
4. Statistics: user reporting to display totals of journal entries, pie graphs displaying category break downs, goal achieved date vs due date etc  
5. Goals: tracking with due date and functionality to toggle complete and separate the view

&nbsp;

<a name="techstack"/></a>

| Tech Stack  |   |   
|---|---|
| JavaScript  | a high-level, just-in-time compiled language with dynamic typing. Can be used on both client and server side |  
| React |  an open-source JavaScript library for creating interactive user interfaces |  
| Ruby on Rails |  a web application framework used to create a database backed application based on the Model-View-Controller framework  | 
| PostgreSQL | a relational database management system with SQL compliance   |  
| HTML5 |  is a markup language used to present and structure content for the web |  
| CSS + SASS   |  cascading Stylesheets which determine how HTML elements will be displayed on screen, SASS is a CSS precompiler which adds additional features for implementing CSS |  
| Git + Github  | distributed version-control system for tracking code throughout a project, hosted online through Github to allow for team collaboration  |  
| Heroku | cloud based deployment platform  |  
| Netlify | website deployment with continuous integration  | 

API Web Server Puma 


Packages 

Libraries List 

Gems List 

Testing 


Source Control 

--- 
<a name="targetaudience"/></a>
## Target Audience

The target audience for Codex is software developers in particular developers who are beginning their learning journey or going through a transition which requires tracking learning goals. 

As the technology industry changes so rapidly, developers need to continuously learn in order to keep their skills up to date. 

The target audience are tech savvy useers who own and use desktop/laptop computers daily. It is expected that the users of Codex will access using Desktop browser window 60% of the time and 40% of the time via their mobile devices. 

--- 
<a name="userstories"/></a>
## User Stories & Personas 

#### Persona #1: Liam 

Liam is a junior frontend developer who has been working for a tech company for nearly two years. He wants to level up his skills, either get a promotion or new role, and learn machine learning. To do this he requires a new skill set, such as learning CS concepts and learning Python.

In order for Liam to keep track of his notes and progress on his self studying journey, he requires a system to organise his notes and keep track of his studying progress. Since he is currently busy with his junior dev role, Liam aims to fit in a few hours of self study each day after work and on weekends.

Codex will be able to provide Liam the right tools for managing notes, journal entries, tracking study time and goals achieved as well as providing analytics. The app also allows him to bookmark useful links to relevant articles related to relevant topics. When commuting to work (not in lockdown), the app is accessible on mobile, allowing use on public transport.

**Liam's User Stories:** 

- As a user, I want to add daily journal entries, that log specific topics of things I learnt and keeping track of accomplishments and areas that need improvement
- As a user, I’d like to set goals, be able to check them off and see my progress on what has been achieved.
- As a user, I wish to organise my journal entries and bookmarks by categories, using folders and tags 
- As a user, I’d like to search for these entries and bookmarks that can be filtered through a search bar
- As a user, I want to keep track of my study time using a pomodoro timer, which will keep logs of the amount of total time studied per day
- As a user, I want to view detailed analytic reports of all app usage including how many journal entries, numbers of bookmarks saved, total time studied using the pomodoro clock and how often I achieve my set goals.
- As a user when creating journal entries, I want to be able to provide a title of the post and edit the body using a rich text editor that allows for code snippets, titles, and block quotes
- As a user a I wish to add or remove categories from my entries and bookmarks to reorganise entries when needed
- As a user, I require everything to be displayed in an accessible, intuitive and responsive dashboard.
- As a user, I want the ability to delete my account if necessary.


---

#### Persona #2: Blake

Blake is currently undertaking a full stack web development bootcamp and prior to this had no experience with coding. 

As a newbie to coding, Blake is having a hard time keeping track of all the new concepts and useful tools that she is learning at the bootcamp. Currently she has 13 bookmarks folders in her Chrome browser which she can’t search through easily, as well as notes in Google Docs, handy code snippets spread out everywhere- in the lesson materials, some within project source code and others just copy & pasted into the Notes app of her MacBook. 

Blake is wanting to centralise all her learning materials in one place and be able to search through them easily.  
Also, when Blake is preparing for job interviews she is finding it difficult to recall all of the new concepts she has learned and succinctly capture the wins and challenges from her coding journey so far. Blake would love clear data to show her learning progress and a summary of achievements to date.

Blake also has a few notepads on the desk where she is tracking the daily tasks to achieve and would love a one stop shop to capture a daily coding journal, any useful bookmarks or re-usable code snippets as well as have a task list all on the one screen. 

**Blake’s User Stories**

- As a user I want to track my daily code experiences which are captured with a date stamp, to gain an overview of my learning journey   
- As a user I want to tag my journal entries with themes such as #react #context   
- As a user I want to be able to record code blocks for future reference with syntax highlighting   
- As a user I want to store useful bookmarks into categories to organise my links   
- As a user I want to be able to search my journal entries by keywords   
- As a user I want to be able to filter my journal entries by date added
- As a user I want to be able to sort my bookmarks by category or tags  
- As a user I want to have a centralised dashboard for storing my bookmarks, journal entries and track my to-do tasks rather than 3 separate apps   
- As a user I want to track how much time I spend coding each day to achieve my #100daysofcode goals  
- As a user I want to produce reports showing data of how much time I have spent coding, how many journal entries I have recorded so I can be encouraged by the progress of my learning and see tangible evidence of my goal achievements    
- As a user I want to be able to access the app on mobile as well as desktop, as I am often reading Medium articles and Twitter on my train commute   
- As a user I want to be able to delete my account along with my personal data if I so wish  

--- 

#### Persona #3: Guest  

Guest: new visitor to Codex who is interested in finding out the functionality and features on offer. 

- As a guest, I want to be able to view the functionality and features of the site before signing up 

- As a guest I want to be able to sign up securely in order to be able to record my journal entries and data 


&nbsp;

--- 

#### User Stories Summary

Some user stories were removed from the final product as we determined a focus on MVP and the user stories outside of this MVP were omitted. This was to ensure we remained focus on achieving the MVP goals within the given timeframes.

For example, user stories removed: 
- As a user I want to see my Github activity and track that against my goals
- As a user I want to view my CodeWars kata status and list of completed challenges 
- As a user I want to receive notifications from Codex to alert me that it is my scheduled time to begin coding 
- As a user I want to be able to reset my password or change my email address 

Additional user stories were identified throughout the planning process and subsequently added, such as 'as a user I want to filter my journal entries by date'.  

--- 

<a name="wireframes"/></a>
## Wireframes

We created wireframes using Figma and have linked the click actions with navigations to subsequent pages as displayed below. 

![Wireframe - Page Links](docs/Wireframes/PageLinks.png)

#### Desktop Wireframes:
![Wireframe - Landing Page](docs/Wireframes/CodexWireframes-01.png)
![Wireframe - About](docs/Wireframes/CodexWireframes-03.png)
![Wireframe - Sign Up](docs/Wireframes/CodexWireframes-06.png)
![Wireframe - Login](docs/Wireframes/CodexWireframes-02.png)
![Wireframe - Dashboard Expanded Nav](docs/Wireframes/CodexWireframes-08.png)
![Wireframe - Dashboard Collapsed Nav](docs/Wireframes/CodexWireframes-10.png)
![Wireframe - Bookmarks](docs/Wireframes/CodexWireframes-12.png)
![Wireframe - Goals](docs/Wireframes/CodexWireframes-14.png)
![Wireframe - Analytics](docs/Wireframes/CodexWireframes-16.png)
![Wireframe - Achieved Goals](docs/Wireframes/CodexWireframes-18.png)
![Wireframe - New Journal](docs/Wireframes/CodexWireframes-20.png)
![Wireframe - Single Journal View](docs/Wireframes/CodexWireframes-22.png)
![Wireframe - Journals List](docs/Wireframes/CodexWireframes-24.png)

&nbsp;

#### Mobile Wireframes 

![Wireframe - Mobile 1](docs/Wireframes/Mobile1.png)
![Wireframe - Mobile 2](docs/Wireframes/Mobile2.png)
![Wireframe - Mobile 3](docs/Wireframes/Mobile3.png)
![Wireframe - Mobile 4](docs/Wireframes/Mobile4.png)

&nbsp;

--- 

<a name="testing"/></a>
## Testing 


--- 

<a name="projectmgnt"/></a>
## Project Management

**Weekly Timeline Plan**  

Monday:   
Idea decision, research tools and external APIs, decide on functionality and then MVP vs sprinkles, chose project name, create personas and user stories, commence wireframes - layout ideas, color schemes and fonts, architecture diagram 

Tuesday:   
Data flow diagram, continue working on wireframes for mobile 
devices also   

Wednesday:   
Finalise features and wireframes, research into external libraries  

Thursday:   
TDD for models and controllers, Setup React app 

Friday:   
Submit documentation, deploy React to Netlify and test API requests and authentication


&nbsp;

**Daily Summaries:**  

Monday:  finalised app idea & name, presented elevator pitch, researched API's and tools, brainstorming features, commenced wireframes using Figma and testing font pairings, color scheme, populating Trello board, completed architecture diagram with LucidChart   

Tuesday: Custom CSS developed for Desktop side nav bar, ERD created, data flow diagram created

Wednesday: Feedback received from Harrison re Architecture diagram and ERD, researched and implemented polymorphic associations for categories which are used on 3 different models, setup repositories and commenced TDD of Rails models, finalising wireframe designs for all pages

Thursday: Setting up polymorphic joining table for categories and redid ERD, TDD for models with RSPEC, adding validations and associations, wrote RSPEC tests for controller requests, commenced set up of React app, deployed Rails to Heroku

Friday: finalised wireframe page interactions, installed draftjs library, submitted documentation

&nbsp;

**Screenshots:**  

![Trello Day 1](docs/TrelloBoard/Trello-Day1.png)
![Trello Day 1a](docs/TrelloBoard/Trello-Day1-a.png)
![Trello Day 2](docs/TrelloBoard/Trello-Day2.png)
![Trello Day 3](docs/TrelloBoard/Trello-Day3.png)
![Trello Day 4](docs/TrelloBoard/Trello-Day4.png)
![Trello Day 5](docs/TrelloBoard/Trello-Day5.png)

---