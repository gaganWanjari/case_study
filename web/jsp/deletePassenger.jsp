<%@ page import="dao.PassengerDAO" %>
<html>
<head>
    <title>Delete Passenger</title>
</head>
<body>
    <%
        String pnr = request.getParameter("pnr");
        PassengerDAO dao = new PassengerDAO();

        if (dao.deletePassenger(pnr)) {
            out.println("Passenger deleted successfully!");
        } else {
            out.println("Error deleting passenger.");
        }
    %>
</body>
</html>
