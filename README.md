# README

## Summary

The Tea Subscription Service is a backend, API-only Rails application. The backend provides 3 endpoints for customer and subscription data that can be accessed by a front-end application.  

The goal of this API was to develop MVP for 3 endpoints: 
- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)

## Versions
- Ruby: 3.2.2
- Rails: 7.1.3

## Setup Instructions
- Clone repo to your local
- Bundle
- Create and migrate the database
- Run the server
- Open Postman and make requests to the API

## Endpoints
#### POST "/api/v1/subscriptions"

Request:

```http
POST /api/v1/subscriptions
Content-Type: application/json
Accept: application/json
```

Body: 

```json
{
  "title": "Special Tea Subscription",
  "price": 25,
  "status": 0,
  "frequency": 12,
  "tea_id": 1,
  "customer_id": 1
}
```

Response: `status: 200`

```json
{
  "data": {
    "id": "21",
    "type": "subscription",
    "attributes": {
      "title": "Special Tea Subscription",
      "price": 25,
      "status": "active",
      "frequency": 12,
      "customer_id": 1,
      "tea_id": 1
    }
  }
}
```

#### PATCH "/api/v1/subscriptions/:id"

Request:

```http
PATCH /api/v1/subscriptions/:id
Content-Type: application/json
Accept: application/json
```

Body: 

```json
{
  "status": 1
}
```

Response: `status: 200`

```json
{
  "data": {
    "id": "21",
    "type": "subscription",
    "attributes": {
      "title": "Special Tea Subscription",
      "price": 25,
      "status": "cancelled",
      "frequency": 12,
      "customer_id": 1,
      "tea_id": 1
    }
  }
}
```

#### GET "/api/v1/customers/:id/subscriptions"

Request:

```http
GET /api/v1/customers/:id/subscriptions
Content-Type: application/json
Accept: application/json
```

Response: `status: 200`

```json
{
  "data": {
    "subscriptions": {
      "active": [
        {
          "id": 22,
          "title": "New Tea Service",
          "price": 50,
          "status": "active",
          "frequency": 6,
          "created_at": "2024-06-28T15:02:48.874Z",
          "updated_at": "2024-06-28T15:04:55.673Z",
          "tea_id": 2,
          "customer_id": 1
        }
      ],
      "cancelled": [
        {
          "id": 21,
          "title": "Special Tea Subscription",
          "price": 25,
          "status": "cancelled",
          "frequency": 12,
          "created_at": "2024-06-28T15:02:48.874Z",
          "updated_at": "2024-06-28T15:04:55.673Z",
          "tea_id": 1,
          "customer_id": 1
        }
      ]
    }
  }
}
```

## Testing Instructions
  Test using the terminal utilizing RSpec:

  ```bash
  $ bundle exec rspec spec/<follow directory path to test specific files>
  ```

  or test the whole suite with `$ bundle exec rspec`

## Improvements
There are many potential improvements that could be made to the back-end.  Without knowing the full context of the how the front-end would want to structure the application, I would first start by building out additional CRUD functionality for the 3 databases we currently have.  Next, I would buffet the information on our teas by incorporating an external API to provide details on the specific teas.  Lastly, I would further improve my sad path testing as I wasn't able to get that completely working within my test suite, even though I know it's working in practice.