## Base Node.js app for Heroku

Here's a basic set of instructions on developing locally and deploying to Heroku.

### Local Development

* `$ nodemon server.js` to boot server, visible at localhost:3000.
* `$ coffee -w -c server.coffee public/js/client.coffee` to auto-compile CoffeeScript files.

### Heroku Deployment

* `$ heroku create --stack cedar` to create your app.
* `$ git push heroku master`
* `$ heroku ps:scale web=1`
* `$ heroku config:add NODE_ENV=production`
