Hi my name is Orsi

My application, Yoga Room is a platform where yoga lovers can find the class they are looking for.
This app is based on the needs of the Hungarian Kundalini Yoga Community. We needed a collective space where prospective students can easily find the yoga class for their needs.
This is a ruby on rails application connected to Postgresql as my relational database. Rails on top of handling the backend processing, it renders all my frontend pages along with bootstrap. In the frontend I also used javascript to make my website more user friendly

## teacher side
When a user signs up, they can indicate if they are yoga teacher. Every user has a profile page, where they can have introduction, picture and if they set it as public, their contact information presented.
Yoga teachers can create different type of classes: one-off classes called workshops, regular classes with weekly occurrence, courses, which are like regular classes, but only for a limited number of weeks. Classes need a location, the user can reuse one already existing, or create a new one.   A yoga teacher's profile page can be visited by anyone, and it lists their yoga classes as well.

## search
In my application any user can search for classes, based on different parameters. The search button sends an AJAX request, and on the right side, the list of yoga classes gets refreshed with the filtered search result, without re-rendering the whole page.

If a user is logged in, they can save a search, with a name that is unique to the user.
The searches they saved are listed on their profile page, and they can easily revisit the search results, or delete unnecessary searches.

## code
In my application I have 2 backgroud processes. 
The first One is triggered when a new yoga class is created, which triggers a sql query that matches the class with the saved searches, and notifies the owner of the search about the matching class. This notification is sent in the form of an email sent by rails mailer.
The second background job runs daily with a job scheduler, I chose the Crono Ruby gem for that purpose, and checks if there is any theacher who didn’t log in in the last month. It sends an email with all their classes, to prompt them to update them, if needed.

## close
In my opinion this is a useful feature, because my yoga teacher collegues are usually not really good with tech. My goal with this app is to provide an easy to use tool for them.
I have a lot of other features in mind, and I plan to work on this app in the future. I hope my Community will like it and use it a lot. 

