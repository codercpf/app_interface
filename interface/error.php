<?php 

require_once("common.php");

class ErrorLog extends Common{

	public function index(){
		//客户端发送的请求带有app的基本参数，对这些参数进行校验
		$this->check();

		//获取错误信息
		$errorLog = isset($_POST['error_log']) ? $_POST['error_log'] : '';
		if (!$errorLog) {
			return Response::show(401, "日志为空");
		}
		/*
		//将错误信息写入到error_log表中，原数据表		
		$sql = "insert into error_log(`app_id`,`did`,`version_id`,`version_mini`,`error_log`,`create_time`)
							   values(".$this->params['app_id'].",
							   		  '".$this->params['did']."',
							   		  ".$this->params['version_id'].",
							   		  ".$this->params['version_mini'].",
							   		  '".$errorLog."',
							   		  ".time()."
							   	)";
		*/
		$sql = "insert into cms_admin(`username`,`password`,`lastloginip`,`email`,`realname`,`lastlogintime`)
							   values(".$this->params['app_id'].",
							   		  '".$this->params['did']."',
							   		  ".$this->params['version_id'].",
							   		  ".$this->params['version_mini'].",
							   		  '".$errorLog."',
							   		  ".time()."
							   	)";


		// echo $sql;exit;
		$conn = Db::getInstance()->connect();
		$result = mysql_query($sql, $conn);
		// var_dump($result);
		if($result){
			return Response::show(200, "错误信息插入成功");
		}else{
			return Response::show(400, "错误信息插入失败");
		}
		
	}
}


//测试用
$error = new ErrorLog();
$error->index();
