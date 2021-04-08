<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="Style/Unite.css"
	media="screen" />
<title>蛋白質搜尋</title>
<script src="jmol/jsmol/JSmol.min.js"></script>
<script src="jmol/jsmol/js/Jmol2.js"></script>
<script>jmolInitialize("jmol/jsmol");</script>
<script>

function check_pdbid()
{
	protein_pdb=document.getElementById('protein_pdb').value.toUpperCase();
	url="https://data.rcsb.org/rest/v1/core/entry/"+protein_pdb;
	  $.ajax({
	        url: url,
	        cache: false,
	        success: function () {
	        	show_3D();
	        },
			error : function(){
	        	$("#Jmol_3D").html("")
				alert("PDB ID is error");  
			}
	    });
}

function show_3D()
{

		//var script = 'load https://files.rcsb.org/download/' + protein_pdb+".pdb";
		//var script='load pdb/6xrz.pdb+load https://files.rcsb.org/download/'+protein_pdb+'.pdb';
		//var script='load "pdb/1ktl.pdb";load APPEND "pdb/1kpr.pdb";frame *;display 1.1,2.1'
		var script='load "pdb/1kpr.pdb";load APPEND https://files.rcsb.org/download/'+protein_pdb+'.pdb ;frame *;display 1.1,2.1';
		Info = {
			    spin:true,			
				j2sPath: "jmol/jsmol/j2s",
				use: "HTML5",
				readyFunction: null,
			        script
			        }
		$("#Jmol_3D").html(Jmol.getAppletHtml("jmolApplet0",Info))
}
	
</script>
</head>

<body>
	<jsp:include page="NavigationBar.jsp" />
	<span style=""></span>
	<input type="text" id="protein_pdb">
	<button onclick="check_pdbid()">查看結構</button>
	<div>
		<span id="Jmol_3D"></span>
	</div>
</body>

</html>