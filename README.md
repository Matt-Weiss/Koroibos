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
