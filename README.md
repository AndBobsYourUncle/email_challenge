# Fallback Email Coding Challenge

To deploy on Heroku, you just need to create a Heroku app with the repo, add a Redis add-on, and then add the following environment variables:
* SENDGRID_KEY
* AMAZON_SES_USER
* AMAZON_SES_KEY

If you’d like to test the fallback option, you can simply add a character or so to the SendGrid key. The email that is sent should show that it was from the fallback server.
