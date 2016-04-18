##News Aggregator
###Sinatra Site

This is an app I built in Sinatra to practice receiving user input via HTTP POST requests, and persisting it via a `.csv` file

Every page load, the server fetches data from the `.csv`

The home page displays a dynamically generated list of articles users have submitted

###Models
####`Article`
* Methods:
  * `#lister`
    * Lists all articles

###User Stories

```no-highlight
As a slacker
I want to be able to submit an incredibly interesting article
So that other slackers may benefit
```

```no-highlight
As a slacker
I want to be able to visit a page that shows me all the submitted articles
So that I can slack off
```

```no-highlight
As an errant slacker
I want to receive an error message
When I submit an invalid article
```

```no-highlight
As a plagarizing slacker
I want to receive an error message
When I submit an article that has already been submitted
```

###Acceptance Criteria

* When I visit `/articles/new` it has a form to submit a new article.
* The form accepts an article title, URL, and description.
* When I successfully post an article, it should be saved to a CSV file.

* When I visit `/articles` I should be able to see all the articles that have been submitted.
* Each article should show the description, title, and URL.
* If I click on the URL it should take me to the relevant page inside of a new tab.

* If I do not specify a title, URL, and description, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in any of the above cases.

* If I specify a URL that has already been submitted, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in the above case.
