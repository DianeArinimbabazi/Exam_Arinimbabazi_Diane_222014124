<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Linking to external stylesheet -->
  <link rel="stylesheet" type="text/css" href="style.css" title="style 1" media="screen, tv, projection, handheld, print"/>
  <!-- Defining character encoding -->
  <meta charset="utf-8">
  <!-- Setting viewport for responsive design -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Feedback Page</title>
  <style>
    /* CSS styles for the page */
    /* Body style */
    body {
      margin: 0;
      padding: 0;
      font-family: 'Times New Roman', serif;
      background: url('./Images/clinic.jpg') no-repeat center center/cover;
      height: 100vh;
    }
    /* Link styles */
    a {
      padding: 10px;
      color:white;
      text-decoration: none;
      margin-right: 15px;
    }
    a:visited {
      color: black;
    }
    a:link {
      color:black;
    }
    a:hover {
      background-color: white;
    }
    a:active {
      background-color: white;
    }
    /* Button style */
    button.btn {
      margin-left: 15px;
      margin-top: 4px;
    }
    /* Form input style */
    input.form-control {
      margin-left: 15px;
      padding: 8px;
    }
    /* Section style */
    section {
      padding: 71px;
      border-bottom: 1px solid #ddd;
    }
    /* Footer style */
    footer {
      text-align: center;
      padding: 15px;
      background-color: beige;
    }
    /* Header style */
    header {
      background-color: beige;
      padding: 10px;
      text-align: center;
    }
    /* Navigation menu style */
    ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
      display: flex;
      align-items: center;
    }
    li {
      margin-right: 10px;
    }
    li img {
      vertical-align: middle;
    }
    /* Dropdown menu style */
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px black(0,0,0,0.2);
      z-index: 1;
    }
    .dropdown:hover .dropdown-content {
      display: block;
    }
    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }
    .dropdown-content a:hover {
      background-color: #f1f1f1;
    }
    /* Table style */
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body style="background-image: url('./Images/fb.jpg');background-repeat: no-repeat;background-size:cover;">
  <!-- Header section -->
  <header>
    <h1>Feedback</h1>
  </header>
  <!-- Search form -->
  <form class="d-flex" role="search" action="search.php">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="query">
    <button class="btn btn-outline-success" type="submit">Search</button>
  </form>
  <!-- Navigation menu -->
  <ul>
    <img src="./Images/logo.png" width="90" height="60" alt="Logo">
    <li><a href="./home.html">HOME</a></li>
    <li><a href="./about.html">ABOUT</a></li>
    <li><a href="./contact.html">CONTACT</a></li>
    <!-- Dropdown menu for tables -->
    <li class="dropdown">
      <a href="#" style="padding: 20px; color: white; background-color:black; text-decoration: none;">Tables</a>
      <div class="dropdown-content">
        <a href="./attachments.php">Attachments</a>
        <a href="./business_plans.php">business_plans</a>
        <a href="./collaborators.php">Collaborators</a>
        <a href="./comments.php">Comments </a>
        <a href="./feedback.php">Feedback</a>
        <a href="./goals.php">Goals</a>
        <a href="./sections.php">Sections</a>
        <a href="./tasks.php">Tasks </a>
        <a href="./templates.php">Templates</a>
      </div>
    </li>
    <!-- Dropdown menu for settings -->
    <li class="dropdown">
      <a href="#" style="padding: 20px; color: white; background-color:black; text-decoration: none;">Settings</a>
      <div class="dropdown-content">
        <a href="login.html">Login</a>
        <a href="register.html">Register</a>
        <a href="logout.php">Logout</a>
      </div>
    </li>
  </ul>
</header>

  <!-- Main content section -->
  <section>
    <!-- attachments Form -->
    <h1>Feedback Form</h1>
    <form method="post" onsubmit="return confirm('Are you sure you want to insert this record?');">
      <label for="feedback_id">feedback_id:</label>
      <input type="number" id="feedback_id" name="feedback_id"><br><br>

      <label for="plan_id">plan_id:</label>
      <input type="number" id="plan_id" name="plan_id" required><br><br>

      <label for="section_id">section_id:</label>
      <input type="number" id="section_id" name="section_id"><br><br>

      <label for="rating">rating:</label>
      <input type="number" id="rating" name="rating"><br><br>

      <label for="created_at">created_at:</label>
      <input type="date" id="created_at" name="created_at"><br><br>

      <input type="submit" name="add" value="Insert"><br><br>

      <a href="./home.html">Go Back to Home</a>
    </form>

    <!-- PHP code to insert data into database -->
    <?php
      include('database_connection.php');

      // Check if the form is submitted
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
          // Prepare and bind parameters with appropriate data types
          $stmt = $connection->prepare("INSERT INTO feedback (feedback_id, section_id, plan_id, rating,  created_at) VALUES (?, ?, ?, ?, ?)");
          $stmt->bind_param("iisss", $feedback_id, $section_id, $plan_id, $rating, $created_at);
          // Set parameters from POST data with validation (optional)

          $feedback_id = intval($_POST['feedback_id']); // Ensure integer for feedback_id
          $plan_id= intval($_POST['plan_id']); // Ensure integer for plan_id
          $section_id= htmlspecialchars($_POST['section_id']); // Prevent XSS
          $rating= htmlspecialchars($_POST['rating']); // Prevent XSS
          $created_at= htmlspecialchars($_POST['created_at']); // Prevent XSS

          // Execute prepared statement with error handling
          if ($stmt->execute()) {
              echo "New record has been added successfully!";
          } else {
              echo "Error: " . $stmt->error;
          }

          $stmt->close();
      }

      $connection->close();
    ?>
    <!-- feedback Table -->
    <h2>Feedback Table</h2>
    <table border="2">
      <tr>
        <th>FEEDBACK_ID</th>

        <th>PLAN_ID</th>
        <th>SECTION_ID</th>
        <th>RATING</th>
        <th>CREATED_AT</th>
        <th>DELETE</th>
        <th>UPDATE</th>
      </tr>
      <?php
        include('database_connection.php');
        $sql = "SELECT * FROM feedback";
        $result = $connection->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $feedback_id = $row['feedback_id']; // Update feedback_id variable
                echo "<tr>
                  <td>" . $row['feedback_id'] . "</td>
                  <td>" . $row['plan_id'] . "</td>
                  <td>" . $row['section_id'] . "</td>
                  <td>" . $row['rating'] . "</td>
                  <td>" . $row['created_at'] . "</td>

                  <td><a style='padding:4px' href='Delete_feedback.php?feedback_id=$feedback_id'>Delete</a></td> 
                  <td><a style='padding:4px' href='update_feedback.php?feedback_id=$feedback_id'>Update</a></td> 
                </tr>";
            }
        } else {
            echo "<tr><td colspan='7'>No data found</td></tr>";
        }

        $connection->close();
      ?>
    </table>
  </section>
  <!-- Footer section -->
  <footer>
    <center> 
      <b><h2>UR CBE BIT &copy 2024 Designed by: @Diane ARINIMBABAZI</h2></b>
    </center>
  </footer>
</body>
</html>
