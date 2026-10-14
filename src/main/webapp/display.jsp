<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }
%>
<%
    if (!Boolean.TRUE.equals(request.getAttribute("verifiedSubmission"))) {
        response.sendRedirect("test.html");
        return;
    }

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String summary = request.getParameter("summary");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Submission received</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <main>
        <h1>Submission received</h1>
        <p><strong>Name:</strong> <%= escapeHtml(name) %></p>
        <p><strong>Email:</strong> <%= escapeHtml(email) %></p>
        <h2>Your summary</h2>
        <p><%= escapeHtml(summary).replace("\r\n", "\n").replace("\n", "<br>") %></p>
    </main>
</body>
</html>
