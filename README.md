# Summary Test JSP App

A small JSP web app with an About page, a summary form, server-side validation,
and a results page. All pages share a responsive stylesheet.

## Run locally

Requirements: Java 17, Maven, and Apache Tomcat 10.1.

1. Build the deployable WAR:

   ```sh
   mvn clean package
   ```

2. Copy `target/summary-test.war` into Tomcat's `webapps` directory and start
   Tomcat.
3. Open `http://localhost:8080/summary-test/`.

The verifier accepts a name that starts with an uppercase letter and is fewer
than 10 characters, an email address ending in `@gmail.com`, and a non-empty
summary. Submitted values are HTML-escaped before being displayed.

This folder is not initialized as a Git repository. You can create and push one
manually when you are ready.
