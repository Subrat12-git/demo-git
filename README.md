# Summary Test JSP App

A small JSP web app with an About page, a scenario chooser, a topic-specific
summary form, server-side validation, and a results page. All pages share a
responsive stylesheet. Scenarios include a reading habit, a teamwork project,
school waste reduction, and a community garden.

## Run locally

Requirements: Java 17, Maven, and Apache Tomcat 10.1.

1. Build the deployable WAR:

   ```sh
   mvn clean package
   ```

2. Copy `target/summary-test.war` into Tomcat's `webapps` directory and start
   Tomcat.
3. Open `http://localhost:8080/summary-test/`.

Choose a scenario at `scenarios.html`. The verifier accepts a name that starts
with an uppercase letter and is fewer than 10 characters, an email address
ending in `@gmail.com`, a non-empty summary, and one of the known scenarios.
Submitted values are HTML-escaped before being displayed.

This folder is not initialized as a Git repository. You can create and push one
manually when you are ready.
