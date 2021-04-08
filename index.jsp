<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<link rel="stylesheet" type="text/css" href="Style/Unite.css"
	media="screen" />
<script src="https://d3js.org/d3.v3.min.js"></script>
<script>
	function draw() {

		var dataset;
		d3.csv("data.csv", function(error, data) {
			if (error) {
				console.log(error);
			} else {
				console.log(data);
				dataset = data;
				var newsvg = d3.select('#linebar').append('svg').attr({
					'width' : 300,
					'height' : 300
				});

				newsvg.selectAll('rect').data(dataset).enter().append('rect')
						.attr({
							'fill' : '#00DDDD',
							'width' : function(d) {
								return d.number;
							},
							'height' : 30,
							'x' : 0,
							'y' : function(d) {
								return (d.title - 1) * 35;
							}
						});
			}
		});
	}
</script>
<title>蛋白質整合系統</title>
</head>
<body>
	<jsp:include page="NavigationBar.jsp" />
	<button onclick="draw()">印出長條圖</button>
	<div id="linebar"></div>
</body>
</html>