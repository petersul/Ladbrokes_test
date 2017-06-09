<html>

	<head>
		<link rel="stylesheet" type="text/css" href="css/countdown.css">
		<script src="js/jquery-3.2.1.js"></script>
		<script src="js/countdown.js"></script>
		<script>
			$(document).ready(function(){

			});
		</script>
	</head>

	<body>
	<?php

		$data['race'] = $_GET['race'];
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, 'localhost/ladbrokes/getlist.php?race='.$_GET['race']);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

		$result = curl_exec($curl);

		curl_close($curl);

		$row = json_decode($result);

		echo '<h1>'.$row->name.'</h1>';
		
		$racetime = DateTime::createFromFormat('Y-m-j H:i:s', $row->racetime);
		echo '<h3>'.$row->type.' race';
		echo '<br/>'.$racetime->format('D dS F Y');
		echo '<br/>Betting closes: '.$racetime->format('g:i a').'</h3>';
		echo '<h3>Competitors</h3>';
		echo '<ul>';
		foreach($row->competitors as $competitor){
			echo '<li>';
			echo $competitor->position.') '.$competitor->competitorname;
			echo '</li>';
		}
		echo '</ul>';
		


	?>
	
	<button onclick="location.href='index.php'">Back</button>
</html>