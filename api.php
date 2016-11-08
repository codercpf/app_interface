<?php 

//封装接口方法
class Response{

	/*
	* 综合方式传递数据
	*@param integer $code状态码
	*@param string $message提示信息
	*@param array $data数据
	*@param string $type数据类型
	* return string
	*/
	const JSON = "json";
	public static function show($code, $message='', $data=array(), $type=self::JSON){
		if(!is_numeric($code)){
			return '';
		}

		//设置type类型，让客户端可指定输出类型
		$type = isset($_GET['format']) ? $_GET['format'] : self::JSON;

		$result = array(
			'code' => $code,
			'message' => $message,
			'data' => $data,
		);

		//根据type类型不同，调用不同接口处理数据
		if ($type == 'xml') {					//$type为xml，调用xml方法
			self::xmlEncode($code, $message, $data);
			exit;
		}elseif ($type == 'array') {
			echo "<pre>";
			print_r($result);
			echo "<pre>";
		}else{									//$type为json，或其他形式时，默认采用json方式处理
			self::json($code, $message, $data);			
			exit;
		}
		/*
		if($type == 'json'){						//$type为json，调用json方法
			self::json($code, $message, $data);			
			exit;
		}
		*/
	}

	
	/*
	* 按json方式传递数据
	*@param integer $code状态码
	*@param string $message提示信息
	*@param array $data数据
	* return string
	*/
	public static function json($code, $message='', $data=array()){
		if(!is_numeric($code)){
			return '';
		}
		$result = array(
			'code' => $code,
			'message' => $message,
			'data' => $data
		);
		echo json_encode($result);
		exit;
	}


	/*
	*通过XML格式传递数据
	*@param integer $code状态码
	*@param string $message提示信息
	*@param array $data数据
	* return string
	*/
	public static function xmlEncode($code, $message, $data=array()){
		if(!is_numeric($code)){
			return '';
		}
		$result = array(
			'code' => $code,
			'message' => $message,
			'data' => $data,
		);

		header("Content-Type:text/xml");
		$xml = "<?xml version='1.0' encoding='UTF-8'?>\n";
		$xml .= "<root>\n";
		//调用自身方法，将数据拼接成xml格式
		$xml .= self::xmlToEncode($result);
		$xml .= "</root>\n";
		echo $xml;
	}
	//该函数将 数组转换为xml格式
	public static function xmlToEncode($data){
		$xml = $attr = "";
		foreach ($data as $key => $value) {

			//当key是数字，说明是一维数组，则把下标当成$key，下标对应的值是$value
			if(is_numeric($key)){
				$attr = " id='{$key}'";
				$key = "item";
			}
			//当$key是数字，如下面测试数据type中的$k=>$v(实际为下标—>值，0->26等)，则添加item属性，将下标0作为id；
			//arry(25,40)转换后为：<item id='0'>25</item>，<item id='1'>40</item>

			$xml .= "<{$key}{$attr}>\n";			
			$xml .= is_array($value) ? self::xmlToEncode($value) : $value;
			//这里，当数组内容$value又是一个数组时，递归调用自身，把数组解析为XML
			$xml .= "</{$key}>\n";			
		}
		return $xml;
	}


}

/*
$data = array(
	'id'=>1,
	'name'=>'singwa',
	'type'=> array(26,30,17),
	'test'=> array(1,45,67=>array(123,'abx')),
);
Response::xmlEncode(200,'success',$data);
*/