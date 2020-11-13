## Pre-requisites
  - Elixir v1.11.0
  - OTP v23.0
  - PostgreSQL v10 or greater

## How to run
1.- Start by cloning the repository in your desired folder.
2.- Access the root of the cloned repository.
3.- Inside the root folder you will find an ```.env.sample``` file with the neccesary file structure needed to create the ```.env``` file
4.- After you created an ```.env ``` file in the root folder with the needed enviroment variables you can procced with the next steps.
5.- Run ```source .env``` on root folder to load enviroment variables
6.- Run ```mix setup``` to download dependencies and setup ecto. This could take a minute, the console will show the compiling of several dependencies, and at the end, the seed data will be inserted.
7.- Run ```mix test``` to run the automated tests, first time you will see a similar output to ```mix setup``` , the important part is at the end of the output, you should see something like this
```
Generated user_random_points app
The database for UserRandomPoints.Repo has already been dropped
.......

Finished in 0.08 seconds
7 tests, 0 failures

Randomized with seed 528970
```

7.- Lastly, run ```mix phx.server``` to finally run the API :D , you should see something like this
```
[info] Running UserRandomPointsWeb.Endpoint with cowboy 2.8.0 at 0.0.0.0:4000 (http)
[info] Access UserRandomPointsWeb.Endpoint at http://localhost:4000
```

## Requests

### URL
If ran locally by default the API is running in ```http://localhost:4000```

### Endpoint

| Request method  | Path  | Headers  |
| --- | --- |---|---|---|
| GET  | / | Content-Type: application/json  | 

#### Example response
The first GET request on ```http://localhost:4000/``` must render something like this:
```
{
  "timestamp": null,
  "users": [
      {
          "id": 20,
          "points": 22
      },
      {
          "id": 36,
          "points": 43
      }
  ]
}
```
Any subsequent request must render the timestamp of the previous request, like this:
```
{
  "timestamp": "2020-11-13T22:01:23.690718Z",
  "users": [
      {
          "id": 72,
          "points": 90
      },
      {
          "id": 88,
          "points": 94
      }
  ]
}
```