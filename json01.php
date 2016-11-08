<?php 	
	$arr = array(
		'id' => 1,
		'name' => 'singwa' 
	);
	echo json_encode($arr);
	//json_encode()输出字符串时，字符串必须为UTF-8编码

	$data = "输出JSON数据";
	$newData = iconv('UTF-8','GBK',$data);	
	echo $newData."<br>";
	echo json_encode($newData);
	//使用iconv(原编码,目的编码,数据)强制转换字符编码后，转为GBK编码，json_encode()无效。

