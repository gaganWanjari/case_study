<%@ page import="dao.PassengerDAO" %>
<%@ page import="model.Passenger" %>
<html>
<head>
    <title>Edit Passenger</title>
</head>
<body>
    <h2>Edit Passenger</h2>
    <%
        String pnr = request.getParameter("pnr");
        PassengerDAO dao = new PassengerDAO();
        Passenger passenger = dao.getPassenger(pnr);

        if (passenger != null) {
    %>
    <form action="editPassenger.jsp" method="post">
        <input type="hidden" name="pnr" value="<%= passenger.getPnr() %>" />
        Name: <input type="text" name="name" value="<%= passenger.getName() %>" /><br/>
        Gender: <input type="text" name="gender" value="<%= passenger.getGender() %>" /><br/>
        Age: <input type="text" name="age" value="<%= passenger.getAge() %>" /><br/>
        Origin: <input type="text" name="origin" value="<%= passenger.getOrigin() %>" /><br/>
        Destination: <input type="text" name="destination" value="<%= passenger.getDestination() %>" /><br/>
        Ticket Price: <input type="text" name="ticket_price" value="<%= passenger.getTicketPrice() %>" /><br/>
        Train Number: <input type="text" name="train_number" value="<%= passenger.getTrainNumber() %>" /><br/>
        <input type="submit" value="Update Passenger" />
    </form>
    <%
        } else {
            out.println("Passenger not found.");
        }

        if (request.getMethod().equals("POST")) {
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            int age = Integer.parseInt(request.getParameter("age"));
            String origin = request.getParameter("origin");
            String destination = request.getParameter("destination");
            double ticketPrice = Double.parseDouble(request.getParameter("ticket_price"));
            int trainNumber = Integer.parseInt(request.getParameter("train_number"));

            Passenger updatedPassenger = new Passenger(pnr, name, gender, age, origin, destination, ticketPrice, trainNumber);
            if (dao.updatePassenger(updatedPassenger)) {
                out.println("Passenger updated successfully!");
            } else {
                out.println("Error updating passenger.");
            }
        }
    %>
</body>
</html>
