<?php 

require_once("api.php");

$data = array(
	'id'=>1,
	'name'=>'singwa',
	'type'=> array(26,30,17)
	);

// Response::json(200,'success',$arr);

Response::show(200,'success',$data,'array');