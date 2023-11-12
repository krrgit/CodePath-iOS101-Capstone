Original App Design Project - README Template
===

# Weightlifting Progress Tracker [WIP]

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Reflection on Progress](#Reflection-on-Progress)

## Overview

### Description

An app tailored for fitness enthusiasts, specifically designed to track and monitor weightlifting activities. Users can log their workout routines, set personal records, and visualize their progress over time, providing motivation and insights into their fitness journey.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Health & Fitness
- **Mobile:** The app utilizes mobile capabilities to track gym sessions, record workout metrics, and provide visualizations of user progress. 
- **Story:** Empowering users in their fitness endeavors, the app serves as a digital workout companion, helping individuals stay consistent with their weightlifting routines. The visualization of progress motivates users to achieve their fitness goals and set new milestones.
- **Market:** The target market includes fitness enthusiasts, gym-goers, and individuals focused on weightlifting as part of their exercise routine. Monetization can be achieved through premium features, personalized workout plans, or partnerships with fitness brands.
- **Habit:** Users are encouraged to use the app each weightlifting session, and review their progress regularly. The habit-forming nature of the app contributes to improved workout consistency and goal attainment.
- **Scope:** Initial versions will focus on basic workout logging and progress tracking. Subsequent versions will introduce features such as graphs, trends, personal bests animations.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can add the different splits of their routine
* User can add the workouts per split
* User can input a log for a certain day
* User can input the set, reps, and weight for a exercise
* User can delete a log of a certain day

**Optional Nice-to-have Stories**

* User can view their progress as a graph (Reps x Weights, Weights)
* User can view statistics about their workout over time
* When new log is added, entries are predicted based on trends
* User can enter notes on a certain, log, workout, or routine day
* User can add comments to a log 

### 2. Screen Archetypes

- [x] [Log Screen]
* [x] User can add the different days of their routine
* [x] User can remove splits
* [ ] User can input a log for a certain day
* [ ] User can input the set, reps, and weight for a exercise
* [ ] User can delete a log of a certain day
* [ ] User can add notes on a certain workout log
* [ ] User can add comments to a log 

- [x] [Compose Split Screen]
* [x] User can name a split
* [x] User can add a new split
* [ ] User can edit a current split
* [ ] User can add exercises to a split
* [ ] User can remove exercises from a split

- [ ] [Graph Screen]
* [ ] User can view their progress as a graph
* [ ] User can change the display of the graph (Reps x Weights, Weights)

- [ ] [Statistics Screen]
* [ ] User can view statistics about their workout over time

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Log Screen
* Graph Screen
* Statistics Screen
* Compose Split Screen

**Flow Navigation** (Screen to Screen)

- [ ] Log Screen
* => Compose Split Screen
- [ ] Graph Screen
* => None
- [ ] Statistics Screen
* => None
- [ ] Compose Split Screen
* => Log Screen



## Wireframes
<img src="https://github.com/krrgit/CodePath-iOS101-Capstone/blob/main/wireframe.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

### Reflection-On-Progress
* Added Log Screen and Compose Split Screen.
* Added some functionality listed in the screen archetypes section.
* Had difficulty with layout and iterating the design in order to better serve the functionality of the app.
* What's next: add the rest of the required functionality of the app, and optional ones if time permits.
