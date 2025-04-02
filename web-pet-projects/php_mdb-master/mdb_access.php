<?php
$conn = new COM("ADODB.Connection") or die("Cannot start ADO");

// Microsoft Access connection string.
$conn->Open("DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=c:\wamp\www\Test_db.mdb");

// SQL statement to build recordset.
$rs = $conn->Execute("SELECT * FROM data_table");
echo "<p>Below is a list of values in the Test_db.MDB database, data_table table, name field.</p>";

$num_columns = $rs->Fields->Count();
for ($i=1; $i < $num_columns; $i++) {
    $fld[$i] = $rs->Fields($i);
}
// Display all the values in the records set
while (!$rs->EOF) 
{
    
    for ($i=1; $i < $num_columns; $i++) {
        echo "   " . $fld[$i]->value . "   ";
    }
    
    $rs->MoveNext(); //move on to the next record
}
$rs->Close();
?>
