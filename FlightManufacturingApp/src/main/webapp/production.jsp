<!DOCTYPE html>
<html>
<head>
<title>Production</title>
<link rel="stylesheet" href="css/style.css">

<script>
function startEngine(){
alert("Engine assembly started");
}

function buildWings(){
alert("Wing production started");
}

function qualityCheck(){
alert("Quality check started");
}
</script>

</head>

<body>

<header>
<h2>Aircraft Production Unit</h2>
</header>

<div class="container">

<div class="card">
<img src="images/engine.jpg">
<h3>Engine Assembly</h3>
<button onclick="startEngine()">Start</button>
</div>

<div class="card">
<img src="images/wings.jpg">
<h3>Wing Production</h3>
<button onclick="buildWings()">Start</button>
</div>

<div class="card">
<img src="images/quality.jpg">
<h3>Quality Check</h3>
<button onclick="qualityCheck()">Start</button>
</div>

<br><br>

<a href="index.jsp">⬅ Back</a>

</div>

</body>
</html>