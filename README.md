Original App Design Project - README Template
===

# Weightlifting Progress Tracker [WIP]

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Video Walkthrough](#Video-Walkthrough)
4. [Wireframes](#Wireframes)
5. [Schema](#Schema)
6. [Reflection on Progress](#Reflection-on-Progress)

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

* [x] User can add the different splits of their routine
* [x] User can add the workouts per split
* [x] User can input a log for a certain day
* [x] User can input the set, reps, and weight for a exercise
* [x] User can delete latest log

**Optional Nice-to-have Stories**

* [ ] User can view their progress as a graph (Reps x Weights, Weights)
* [ ] User can view statistics about their workout over time
* [ ] When new log is added, entries are predicted based on trends
* [ ] User can enter notes on a certain, log, workout, or routine day
* [ ] User can add comments to a log 
* [ ] Dates are selected with carousel

### 2. Screen Archetypes

- [x] [Log Screen]
* [x] User can add the different days of their routine
* [x] User can edit splits
* [x] User can remove splits
* [x] User can add a log
* [x] User can input the set, reps, and weight for a exercise
* [x] User can delete latest log
* [x] Log tables across a split scroll simultaneously
* [x] Edits to logs are stored
* [ ] User can add comments to a log 

- [x] [Compose Split Screen]
* [x] User can name a split
* [x] User can add a new split
* [x] User can edit a current split
* [x] User can add exercises to a split
* [x] User can remove exercises from a split
* [x] User can rearrange exercises in a split

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

- [x] Log Screen
* => Compose Split Screen
- [ ] Graph Screen
* => None
- [ ] Statistics Screen
* => None
- [x] Compose Split Screen
* => Log Screen

## Video Walkthrough
![](https://github.com/krrgit/CodePath-iOS101-Capstone/blob/main/capstonedemo2.gif)
![](https://github.com/krrgit/CodePath-iOS101-Capstone/blob/main/capstonedemo1.gif)

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
* [x] Fix bug where new exercises added to existing split does not display (they exist, just need to be refreshed) (FI)
* [x] Save modifications to the logs
* [x] Add button to remove latest log
* [x] fix bug where first and second column switch
* [x] Added all the required features