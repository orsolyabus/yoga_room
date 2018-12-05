Hi my name is Orsolya Törökné Bús

My application, Yoga Room is a platform where yoga lovers can find the class they are looking for.
This app is based on the needs of the Hungarian Kundalini Yoga Community. We needed a collective space where prospective students can easily find the yoga class of their needs.

## teacher side
When a user signs up, they can indicate if they are yoga teacher. Every user has a profile page, where they can have introduction, picture and if they set as public, their contact information presented.
Yoga teachers can create classes with schedule, connect them to an existing location or create a new one.  A yoga teacher's profile page can be visited by anyone, and it lists their yoga classes as well.

## search
In my application any user can search the database, based on different parameters. The search button sends an AJAX request and on the right side, the list of yoga classes gets refreshed with the filtered search result, without re rendering the whole page.

If a user is logged in, they can save a search, with a name that is unique to the user **show error**
The searches they saved are listen on their profile page, and they can easily re visit the search results, or delete unnesecerry searches. 

## search alert
Based on the saved searches, users get an e-mail notification if there is a new yoga class created that matches.
This is run as a background job.

## code
 -- talk about the background job



