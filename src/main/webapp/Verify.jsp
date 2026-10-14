<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");
    String scenario = request.getParameter("scenario");

    name = name == null ? "" : name.trim();
    email = email == null ? "" : email.trim();
    summary = summary == null ? "" : summary.trim();
    scenario = scenario == null ? "" : scenario.trim();

    boolean validName = !name.isEmpty()
            && name.length() < 10
            && Character.isUpperCase(name.codePointAt(0));
    boolean validEmail = email.matches("(?i)^[^@\\s]+@gmail\\.com$");
    boolean validSummary = !summary.isEmpty();
    String scenarioTitle = null;
    String scenarioDescription = null;
    switch (scenario) {
        case "reading":
            scenarioTitle = "Building a daily reading habit";
            scenarioDescription = "A student wants to read more but has a busy schedule. They start with ten minutes each evening, keep a book nearby, and track their progress. After a few weeks, reading becomes a steady habit.";
            break;
        case "teamwork":
            scenarioTitle = "Working together on a team project";
            scenarioDescription = "A project team has a short deadline. Members agree on a shared goal, divide the work according to their strengths, check in regularly, and ask for help when a task is blocked. They review the result together before submitting it.";
            break;
        case "environment":
            scenarioTitle = "Reducing waste at school";
            scenarioDescription = "A school notices that many disposable cups and paper sheets are thrown away each day. Students bring reusable bottles, teachers share digital handouts when practical, and volunteers measure the waste each week to see whether the changes help.";
            break;
        case "planning":
            scenarioTitle = "Planning a community garden";
            scenarioDescription = "Neighbors turn an unused space into a garden. They ask residents what they want to grow, plan plots and paths, share tools, and create a watering schedule. They also leave a few beds open for people who cannot commit to a full plot.";
            break;
        default:
            break;
    }
    boolean validScenario = scenarioTitle != null;

    if (validName && validEmail && validSummary && validScenario) {
        request.setAttribute("verifiedSubmission", Boolean.TRUE);
        request.setAttribute("scenarioTitle", scenarioTitle);
        request.setAttribute("scenarioDescription", scenarioDescription);
        request.getRequestDispatcher("display.jsp").forward(request, response);
        return;
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Verification failed</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <main>
        <h1>We could not verify your submission</h1>
        <ul>
            <% if (!validName) { %>
                <li>Name must start with an uppercase letter and contain fewer than 10 characters.</li>
            <% } %>
            <% if (!validEmail) { %>
                <li>Email must be a valid address ending in @gmail.com.</li>
            <% } %>
            <% if (!validSummary) { %>
                <li>Please enter a summary.</li>
            <% } %>
            <% if (!validScenario) { %>
                <li>Please choose a valid scenario.</li>
            <% } %>
        </ul>
        <a href="scenarios.html">Choose a scenario</a>
    </main>
</body>
</html>
