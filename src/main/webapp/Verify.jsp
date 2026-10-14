<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");

    name = name == null ? "" : name.trim();
    email = email == null ? "" : email.trim();
    summary = summary == null ? "" : summary.trim();

    boolean validName = !name.isEmpty()
            && name.length() < 10
            && Character.isUpperCase(name.codePointAt(0));
    boolean validEmail = email.matches("(?i)^[^@\\s]+@gmail\\.com$");
    boolean validSummary = !summary.isEmpty();

    if (validName && validEmail && validSummary) {
        request.setAttribute("verifiedSubmission", Boolean.TRUE);
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
        </ul>
        <a href="test.html">Return to the test</a>
    </main>
</body>
</html>
