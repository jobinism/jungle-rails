# Jungles E-Commerce by Jarret Coyle

Jungles is an E-Commerce app for buying tropical houseplants.

1. run `git clone https://github.com/jobinism/jungle-rails`
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rails db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server


## Final Product Screenshots

!["screenshot of Homepage"](https://github.com/jobinism/jungle-rails/blob/master/screenshots/homepage.png)
!["screenshot of Products"](https://github.com/jobinism/jungle-rails/blob/master/screenshots/products.png)
!["screenshot of Admin Dashboard"](https://github.com/jobinism/jungle-rails/blob/master/screenshots/admin_dashboard.png)


## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
