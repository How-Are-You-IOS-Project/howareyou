How are you?
===

# iOS Group Project
Team members
1. Meng-Chuan C
2. Sakshi R
3. Ruifan W

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)
## Overview
### Description
How are you? is a mental health state tracking application. The app is meant to be used as a private journal to keep track of your moods, thoughts and see patterns in your mental health state.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Mental health; Personal use
- **Mobile:** This app is meant for mobile users, just like a small journal always on your person.
- **Story:** Today, "how are you?" has become more of a greeting than a genuine question. The purpose of this app is to help you actually reflect on your mental state and ask yourself how you are. Moreover, the tracking feature helps you see trends or reflect back on how you felt on certain days.
- **Market:** Anyone who wants to keep a secret journal that tracks how their days went and their moods.
- **Habit:** Users will be using this app daily like a real life journal. 
- **Scope:** We would start by having users around UPenn, but the application can be accessible to anyone.
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User is able to create new profile
* User is able to login
* User is able to logout
* User is able to be logged in persistently
* User is able to create a new entry
    * User is able to track mood
    * User is able to do a quick mental state check-in based on a dynamic question of the day
    * User is able to add today's thoughts
    * User is able to add picture of the day
    * User is able to track today's gratitude
* User is able to see their mood trends
    * Calendar view
    * Pie chart
    * Line graph
* User is able to see previous entries by date
    * Accessible via calendar view


**Optional Nice-to-have Stories**

* User is able to track song of the day
    * Link from the song to a music app
* App welcome/User onboarding
* Daily notifications

### 2. Screen Archetypes

* Login/Sign up Screen
   * User is able to create new profile
   * User is able to login
* Home Screen
   * User is able to create a new entry
        * User is able to track mood
        * User is able to do a quick mental state check-in based on a dynamic question of the day
        * User is able to add today's thoughts
        * User is able to add picture of the day
        * User is able to track today's gratitude
* Calendar Screen
    * User is able to see previous entries by date
* Date Entry Screen
    * User is able to see previous entries by date
    * Accessible via calendar view
* Mood Trend Screen
    * User is able to see the mood trend
* Photo Diary Screen
    * User is able to see a collection of uploaded photos 
* Thought Diary Screen
    * User is able to see the uploaded diaries 
* Gratitude Diary Screen
    * User is able to see the uploaded gratitude diaries
* Mental State checkin log Screen
    * User is able to see all the checkin questions and answers

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Tab
* Calendar Tab
* Trends Tab
    * Mood Trends Tab
    * Photo Diary Tab
    * Thought Diary Tab
    * Gratitude Diary Tab
    * Checkin Log Tab

**Flow Navigation** (Screen to Screen)

* Login/Sign up Screen
    * Login and navigate to Home Screen
    * Sign up and navigate to Home Screen
* Home Screen
    * Create new entry
    * If entry is created, view entry for today
    * Click the calendar tab to enter the calendar view 
    * Click the trends tab to see the trends 
    * Log out (goes to log in screen)
* Day Entry Screen
    * Click the home tab to enter today's entry
    * Click the calendar tab to enter the calendar view 
    * Click the trends tab to see the trends 
* Calendar Screen
    * Click a date and navigate to day entry screen 
    * Click the home tab to enter today's entry
    * Click the trends tab to see the trends 
* Trends Screen
    * Click back arrow to go back to Home Screen
    * Click mood trend tab to go to mood trend screen
    * Click photo gallery tab to go to photo gallery screen
    * Click thought diary tab to go to thought diary screen
    * Click gratitude diary tab to go to gratitude diary screen
    * Click checkin log tab to go to checkin log screen
* Photo Diary Screen
    * Click the photo gallery tab to open and view photo
* Thought Diary Screen
    * Click the arrow next to thought to enter date entry screen
    * Click back arrow to go back to Home Screen
* Gratitude Diary Screen
    * Click the arrow next to gratitude to enter date entry screen
    * Click back arrow to go back to Home Screen

## Wireframes

### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/5z37HaN.png)


### [BONUS] Interactive Prototype
[Figma Interactive Prototype](https://www.figma.com/proto/GF6QuWnueEDQGCAhZjlh9R/iOS-Final?node-id=51%3A210&scaling=scale-down&page-id=0%3A1&starting-point-node-id=51%3A268)

## Schema 
[This section will be completed in Unit 9]
### Models
[Database Schema Link](https://dbdiagram.io/d/618f2fab02cf5d186b53ecf7)
- User (this table stores user information)
    - id (primary key, int, auto-generated)
    - username (unique, varchar, required)
    - hashed_password (any, required)
    - created_at (datetime, required)
- Entries (this table stores entries)
    - id (primary key)
    - user_id (foreign key from the User table)
    - created_at (datetime, required)
    - mood (int, required, from a scale 1 - 10)
    - question_id (foreign key from Questions table)
    - answer_index (int, indicates which answer the user chose)
    - thought_today (varchar)
    - picture_today (file)
    - gratitude_today(varchar)
- Questions (this table store all the possible questions)
    - id (primary key)
    - question (varchar, required)
    - answer1 (varchar, required)
    - answer2 (varchar, required)
    - answer3 (varhcar, required)

### Networking
- List of network requests by screen 
    - Home Screen
        - user sign up 
        ```swift
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{(success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        ```
    - Home Screen
        - user log in 
        ```swift
        let username = usernameField.text
        let password = passwordField.text
        PFUser.logInWithUsername(inBackground: username!, password: password!) {(user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        ```
    - Day Entry Screen
        - (Write/POST) create entry
        ```swift
        let entry = PFObject(className:  "Entry")
        // these variables should be parameters of the function
        entry["user"] = PFUser.current()!
        entry["created_at"] = Date()
        entry["mood"] = mood
        if question_id != nil && answer_index != nil {
            entry["question_id"] = question_id
        }
        if thought_today != nil {
            entry["thought_today"] = thought_today
        }
        if picture_today != nil {
            entry["picture_today"] = picture_today
        }
        if gratitude_today != nil {
            entry["gratitude_today"] = gratitude_today
        }
        
        entry.saveInBackground { (success, error) in
            if success {
                print("entry saved")
            } else {
                print("Error saving entry")
            }
        }
        ```
    - Entry Screen / Home Screen
        - (Read/GET)Query all entries for user on date 
        ```swift
        let query = PFQuery(className:"Entry")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.whereKey("date", equalTo: Date())
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (entries: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let entries = entries {
                print("Successfully retrieved \(entries.count) entries.")
                // Do something with the entries here
            }
        }
        ```
    - Trends Screen
        - (Read/GET)Query all moods for user 
        ```swift
        let query = PFQuery(className:"Entry")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.selectKeys("mood")
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (moods: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let moods = moods {
                print("Successfully retrieved \(moods.count) entries.")
                // Do something with the moods here
            }
        }
        ```
    - Calendar Screen
        - (Read/GET)Query all moods and dates for user
        ```swift
        let query = PFQuery(className:"Entry")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.selectKeys(["mood", "created_at"])
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (moods: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let moods = moods {
                print("Successfully retrieved \(moods.count) entries.")
                // Do something with the moods here
            }
        }
        ```
    - Thought Diary Screen
        - (Read/GET)Query all thoughts for user descending on date
        ```swift
        let query = PFQuery(className:"Entry")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.selectKeys(["diary", "created_at"])
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (thoughts: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let thoughts = thoughts {
                print("Successfully retrieved \(thoughts.count) entries.")
                // Do something with the thoughts here
            }
        }
        ```
    - Gratitude Diary Screen
        - (Read/GET)Query all gratitude for user descending on date
        ```swift
        let query = PFQuery(className:"Entry")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.selectKeys(["gratitude", "created_at"])
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (gratitudes: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let gratitudes = gratitudes {
                print("Successfully retrieved \(gratitudes.count) entries.")
                // Do something with the gratitudes here
            }
        }
        ```
    - Question Diary Screen
        - (Read/GET)Query all checkin questions for user descending on date
        ```swift
        let query = PFQuery(className:"Entry")
        let query2 = PFQuery(className:"Question")
        query.whereKey("user", equalTo: PFUser.currentUser())
        query.selectKeys(["question_id", "answer_index", "created_at"])
        query.order(byDescending: "created_at")
        query.findObjectsInBackground { (questions: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let questions = questions {
                // loop through the question and extract the 
                // question id and answer index
                query2.whereKey("id" = questions[index]["question_id"])
                query2.findObjectsInBackground { (question: [PFObject]?, error2: Error?) in 
                    if let e = error2 {
                        print(e.localizedDescription)
                    } else if let question = question {
                        // do something with the question here 
                        // get the answer with answer index from questions[index]["answer_index"]
                    }
                }
            }
        }
        ```
- [OPTIONAL: List endpoints if using existing API such as Yelp]
