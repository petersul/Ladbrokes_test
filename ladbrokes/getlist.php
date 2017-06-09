<?php


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ladbrokes_test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

if($_GET['race'] == 'next'){

	if (isset($_GET['count']) && (int)($_GET['count'])){
		$count = $_GET['count'];
	} else {
		$count = 5;
	}
	$sql = "SELECT r.raceid, m.name, m.type, m.meeting_date, r.closing_time, TIMESTAMP(m.meeting_date,r.closing_time) racetime, TIMESTAMPDIFF(SECOND,NOW(),TIMESTAMP(m.meeting_date,r.closing_time)) countdown
			FROM meeting m
			LEFT JOIN race r
			ON m.meetingid = r.meetingid
			WHERE TIMESTAMP(m.meeting_date,r.closing_time) > NOW()
			ORDER BY m.meeting_date, r.closing_time
			LIMIT ".$count;
			

	
	$result = $conn->query($sql);


	$rows = array();
	while($r = mysqli_fetch_assoc($result)) {
		$rows[] = $r;
	}
	print json_encode($rows);

} else if ((int)($_GET['race'])) {

	$sql = "SELECT r.raceid, m.name, m.type, m.meeting_date, r.closing_time, TIMESTAMP(m.meeting_date,r.closing_time) racetime, TIMESTAMPDIFF(SECOND,NOW(),TIMESTAMP(m.meeting_date,r.closing_time)) countdown
			FROM meeting m
			LEFT JOIN race r
			ON m.meetingid = r.meetingid
			WHERE r.raceid = ".$_GET['race'];
			
	$result = $conn->query($sql);

	$race = mysqli_fetch_assoc($result);
	
	$sql = "SELECT c.competitorid, c.competitorname, p.position
			FROM race r
			LEFT JOIN participant p
			ON r.raceid = p.raceid
			LEFT JOIN competitor c
			ON p.competitorid = c.competitorid
			WHERE r.raceid = ".$_GET['race']
			." ORDER BY p.position";

	$result = $conn->query($sql);


	$rows = array();
	while($r = mysqli_fetch_assoc($result)) {
		$rows[] = $r;
	}
	
	$race["competitors"] = $rows;
	print json_encode($race);
exit;
	$jsonstr = json_encode($race);
	
}
?>