<%@ page import="dao.PassengerDAO" %>
<%@ page import="model.Passenger" %>
<html>
<head>
    <title>View Passengers</title>
</head>
<body>
    <h2>Passengers List</h2>
    <table border="1">
        <tr>
            <th>PNR</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Origin</th>
            <th>Destination</th>
            <th>Ticket Price</th>
            <th>Train Number</th>
            <th>Actions</th>
        </tr>
        <%
            PassengerDAO dao = new PassengerDAO();
            for (Passenger passenger : dao.getAllPassengers()) {
        %>
        <tr>
            <td><%= passenger.getPnr() %></td>
            <td><%= passenger.getName() %></td>
            <td><%= passenger.getGender() %></td>
            <td><%= passenger.getAge() %></td>
            <td><%= passenger.getOrigin() %></td>
            <td><%= passenger.getDestination() %></td>
            <td><%= passenger.getTicketPrice() %></td>
            <td><%= passenger.getTrainNumber() %></td>
            <td>
                <a href="editPassenger.jsp?pnr=<%= passenger.getPnr() %>">Edit</a> | 
                <a href="deletePassenger.jsp?pnr=<%= passenger.getPnr() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
