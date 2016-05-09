#News Aggregator

This is an app I built in Sinatra to practice receiving user input via HTTP POST requests, and persisting it via a PostgresSQL database.

I initially built this app to persist data via a `.csv` file, but converted it to PostgresSQL to increase scalability. I performed the conversion mainly to practice defining a database schema to store user-submitted articles, and reading from and writing information to a PostgreSQL database from a Sinatra application.

The `spec` folder contains unit and features tests written using RSpec and Capybara, which provide full test coverage for the app.

On every page load the server fetches data from the database, and displays a dynamically generated list of articles that users have submitted.

##Models
* `Article`
  * Methods:
    * `#lister`
      * Lists all articles

##User Stories

```no-highlight
As a user
I want to submit an article I find interesting
So that other users may benefit from it
```

####Acceptance Criteria
* When I visit `/articles/new` it has a form to submit a new article.
* The form accepts an article title, URL, and description.
* When I successfully post an article, it should be saved to a CSV file.

```no-highlight
As a user
I want to be able to visit a page that shows me all the submitted articles
So that I can read interesting articles
```

####Acceptance Criteria
* When I visit `/articles` I should be able to see all the articles that have been submitted.
* Each article should show the description, title, and URL.
* If I click on the URL it should take me to the relevant page inside of a new tab.

```no-highlight
As a user
I want to receive an error message upon submitting an invalid article
So I know it wasn't successfully submitted
```

####Acceptance Criteria
* If I do not specify a title, URL, and description, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in any of the above cases.

```no-highlight
As a user
I want to receive an error message when I submit an article that has already been submitted
So I know it wasn't successfully submitted
```

####Acceptance Criteria
* If I specify a URL that has already been submitted, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in the above case.
