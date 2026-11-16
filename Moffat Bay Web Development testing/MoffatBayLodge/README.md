
# Moffat Bay Lodge - Landing Page

## Project Overview
The Moffat Bay Lodge landing page provides visitors with information about available accommodations, activities, and the lodge itself.

The application uses Java, JSP, HTML, CSS, and MySQL to display room information dynamically.

## Database Integration
The landing page connects to the `moffat_bay` MySQL database.

The following Java classes support the database functionality:

- `DatabaseConnection.java` - Establishes the MySQL database connection.
- `RoomType.java` - Represents room information, including room type, description, nightly rate, and maximum guests.
- `RoomTypeDAO.java` - Retrieves room information from the database.

The `index.jsp` page displays the retrieved room information.

## Functional Testing

### Test 1: Database Retrieval
**Purpose:** Verify that the application successfully retrieves room information from MySQL.

**Expected Result:** Room records are retrieved and displayed.

**Actual Result:** PASSED. All three room types were retrieved successfully.

### Test 2: Room Information Validation
**Purpose:** Verify that the nightly rates and maximum guest capacities match the expected database values.

**Expected Results:**
- Single: $100.00, 2 guests
- Double: $150.00, 4 guests
- Suite: $250.00, 6 guests

**Actual Result:** PASSED. All three room types matched the expected values.

## Technologies Used
- Java
- JSP
- HTML
- CSS
- MySQL 8.0
- Apache Tomcat 9
- Eclipse IDE

## Current Functionality
The landing page displays room information retrieved directly from the MySQL database. Additional pages and reservation functionality are being developed as part of the team project.
