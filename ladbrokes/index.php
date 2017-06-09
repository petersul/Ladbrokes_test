<html>

	<head>
		<link rel="stylesheet" type="text/css" href="css/countdown.css">
		<script src="js/jquery-3.2.1.js"></script>
		<script src="js/countdown.js"></script>
		<script>
			$(document).ready(function(){
				refreshList();
			});
		</script>
	</head>

	<body>
	
	<div>
		<h1> Upcoming Races </h1>
	</div>
	<div id="content"></div>
	<button onClick=refreshList()> refresh </button>
	</body>
	
</html>