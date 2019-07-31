# Koroibos

  This project is the Turing Mod 4 final project. This is a 48 hour code challenge and will be evaluated based on everything we've learned so far, including documentation, processes, and the actual code.

  Because this project is a representation of everything we've learned so far, I've opted to complete it in Rails. I feel that documentation and process are important and if I were to have attempted this in a different language it would be functionally complete but weak in the other areas.

  Project is deployed at https://vast-inlet-82463.herokuapp.com/


### Running this application

- Clone down repo: `git clone git@github.com:Matt-Weiss/Koroibos.git`
- Install dependencies: `bundle install`
- Create database: `rails db:{create,migrate,seed}`
- Run local server: `rails s`
- Tests can be run with: `bundle exec rspec`

### Endpoints

#### GET /api/v1/olympians

  This endpoint allows us to get all athletes along with some information about their event history, including their primary sport and their medal count.

  Edge cases- Olympians have been created in the database from raw data that has some inconsistencies. If any property on the athlete has differences between entries in that data, they get an additional entry into our DB. The reason for this is that there is a chance that these are deliberate and they should be logged as a different participant.

  In the future, this could be built out so that each athlete (by name) could have many attributes entries. This would require a schema change and a v2 for our api, as well as introduce the need to add additional filters so that athletes that share a name can still be distinguished from one another. I feel the current solution is the best with the data we have.

  Sample return:
  ```
  {
  "olympians": [
    {
      "name": "Andreea Aanei",
      "team": "Romania",
      "age": 22,
      "sport": "Weightlifting",
      "total_medals_won": 0
    },
    {
      "name": "Nstor Abad Sanjun",
      "team": "Spain",
      "age": 23,
      "sport": "Gymnastics",
      "total_medals_won": 0
    },
    {...}
    ]
  }
  ```

  Update:  Have added the ability to find the youngest and oldest athletes. Simply append `?age=youngest` or `?age=oldest` as a param on the end of the URI.

#### GET api/v1/olympian_stats

  This endpoint retrieves some aggregate stats for all olympians.

  Again I would like to use future time to expand on this functionality to allow for querying things like "number of teams represented" or "average height". These wouldn't be a heavy lift.

  Another feature I'd like to add is the ability to change between metric and imperial units.

  Sample response:
  ```
  {
  "olympian_stats": {
    "total_competing_olympians": 3120
    "average_weight:" {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    }
    "average_age:" 26.2
    }
  }
  ```

#### GET api/v1/events

  This endpoint returns a list of all events sorted by the sport that they are associated with.

  This query turned out to be an n^2 which I am not thrilled about, however, I do think that in this situation it's ok, as even if this application is scaled for future olympic games, it will take a very long for the event and sport lists to grow to a point that this query is untenable.

  Sample response:
  ```
  {
  "events": [
    {
      "sport": "Archery",
      "events": [
        "Archery Women's Individual",
        "Archery Women's Team",
        "Archery Men's Individual",
        "Archery Men's Team"
      ]
    },
    {
      "sport": "Gymnastics",
      "events": [
        "Gymnastics Men's Individual All-Around",
        "Gymnastics Men's Floor Exercise",
        "Gymnastics Men's Parallel Bars",
        "Gymnastics Men's Horizontal Bar",
        "Gymnastics Men's Rings",
        "Gymnastics Men's Pommelled Horse",
        "Gymnastics Men's Team All-Around",
        "Gymnastics Men's Horse Vault",
        "Gymnastics Women's Team All-Around",
        "Gymnastics Women's Uneven Bars",
        "Gymnastics Women's Balance Beam",
        "Gymnastics Women's Individual All-Around",
        "Gymnastics Women's Floor Exercise",
        "Gymnastics Women's Horse Vault"
      ]
    },
    {...}
  ]
}
  ```

#### GET api/v1/events/:id/medalists

  This endpoint returns a list of olympians that earned a medal in the specified event. The seed data set is incomplete, so some events currently show no medalists. Also of note is that there can in fact be multiples of each type of medal for an event, if that event is team based.

  Sample response (event 9):
  ```
  {
  "event": "Rowing Men's Coxless Pairs",
  "medalists": [
    {
      "name": "Giovanni Abagnale",
      "team": "Italy",
      "age": 21,
      "medal": "Bronze"
    },
    {
      "name": "Hamish Byron Bond",
      "team": "New Zealand",
      "age": 30,
      "medal": "Gold"
    },
    {
      "name": "Lawrence Brittain",
      "team": "South Africa",
      "age": 25,
      "medal": "Silver"
    },
    {
      "name": "Marco Di Costanzo",
      "team": "Italy",
      "age": 24,
      "medal": "Bronze"
    }
  ]
}
  ```

#### GET api/v1/team_medals

This endpoint returns all teams with the count of how many medals olympians.

The caveat to this endpoint is that for team sports, every member of the team contributes to the medal count.

Sample response:
```
{
  "team_medals": {
    "United States": 76,
    "Great Britain": 40,
    "Italy": 29,
    "Australia": 29,
    "Russia": 28,
    "Germany": 24,
    "France": 23,
    "China": 19,
    "Canada": 18,
    "Spain": 14,
    "Serbia": 13,
    "New Zealand": 12,
    "Netherlands": 10,
    "Jamaica": 10,
    ...
  }
}
```
