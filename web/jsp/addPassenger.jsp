<%@ page import="dao.PassengerDAO" %>
<%@ page import="model.Passenger" %>
<html>
<head>
    <title>Add Passenger</title>
</head>
<body>
    <h2>Add Passenger</h2>
    <form action="addPassenger.jsp" method="post">
        PNR: <input type="text" name="pnr" /><br/>
        Name: <input type="text" name="name" /><br/>
        Gender: <input type="text" name="gender" /><br/>
        Age: <input type="text" name="age" /><br/>
        Origin: <input type="text" name="origin" /><br/>
        Destination: <input type="text" name="destination" /><br/>
        Ticket Price: <input type="text" name="ticket_price" /><br/>
        Train Number: <input type="text" name="train_number" /><br/>
        <input type="submit" value="Add Passenger" />
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            String pnr = request.getParameter("pnr");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            int age = Integer.parseInt(request.getParameter("age"));
            String origin = request.getParameter("origin");
            String destination = request.getParameter("destination");
            double ticketPrice = Double.parseDouble(request.getParameter("ticket_price"));
            int trainNumber = Integer.parseInt(request.getParameter("train_number"));

            Passenger passenger = new Passenger(pnr, name, gender, age, origin, destination, ticketPrice, trainNumber);
            PassengerDAO dao = new PassengerDAO();
            if (dao.addPassenger(passenger)) {
                out.println("Passenger added successfully!");
            } else {
                out.println("Error adding passenger.");
            }
        }
    %>
</body>
</html>
