
<!DOCTYPE html>
<html>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$uname = $_POST['uname'];
$email = $_POST['email'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * from register where username= $uname and email = $email";
$result = $conn->query($sql);
$f = 0;

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) 
    {
        if($uname == $uname && $email == $email)
        {
            $f = 1;
        }
    }
    if($f == 1)
    {
        echo "record exist";
    }
    else
    {
        echo "record not exists";
    }
} 
else 
{
    echo "0 results";
}

$conn->close();
?>

</body>
</html>
