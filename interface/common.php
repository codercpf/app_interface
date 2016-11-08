<?php 

/*
 * 处理接口公共业务
 *
 */
require_once('../api.php');
require_once('../db.php');

class Common {
	public $params;		//数据库中相关参数 数组
	public $app;

	//封装检查是否升级的函数
	public function check(){
		//客户端id、安卓pad
		$this->params['app_id'] = $appId = isset($_POST['app_id']) ? $_POST['app_id'] : '';
		//app版本号
		$this->params['version_id'] = $versionId = isset($_POST['version_id']) ? $_POST['version_id'] : '';
		//小版本号
		$this->params['version_mini'] = $versionMini = isset($_POST['version_mini']) ? $_POST['version_mini'] : '';
		//客户端设备号——由客户端开发者获取
		$this->params['did'] = $Did = isset($_POST['did']) ? $_POST['did'] : '';
		//加密后的did串
		$this->params['encrypt_did'] = $encryptDId = isset($_POST['encrypt_id']) ? $_POST['encrypt_id'] : '';

		if (!is_numeric($appId) || !is_numeric($versionId)) {
			return Response::show(401, '参数不合法');
		}

		//判断APP是否需要加密，根据app表中的数据is_encryption判断
		$this->app = $this->getApp($appId);
		if (!$this->app) {
			//如果根据ID获取的App信息不存在
			return Response::show(402, 'app_id不存在');
		}

		// if ($this->app['is_encryption'] && $encryptDId != md5($Did . $this->app['key']))

		/*
		//本机无数据表测试，注销掉检测
		if ($this->app['thumb'] && $encryptDId != md5($Did . $this->app['status'])) {
			//如果该app要求加密，并且当前加密内容与 编译后的正确密码不一致，说明当前秘钥不正确
			return Response::show(403, '没有该权限');
		}
		*/


	}

	/*
	 * 以下操作数据库的，都可以加缓存
	 */

	//根据id获取App信息
	public function getApp($id){
		// $sql = "select * from app where id=".$id." and status=1 limit 1";
		$sql = "select * from cms_news where news_id=".$id." and status=1 limit 1";
		// echo $sql;exit;
		//连接数据库，获取相应id的app信息
		$conn = Db::getInstance()->connect();
		$result = mysql_query($sql,$conn);
		return mysql_fetch_assoc($result);
		
	}

	//根据appId获取App 升级信息
	public function getVersionUpgrade($appId){
		// $sql = "select * from version_upgrade where app_id=".$appId." and status=1 limit 1";
		$sql = "select * from cms_news_content where news_id=".$appId." limit 1";
		// echo $sql;exit;
		//连接数据库，获取相应id的app信息
		$conn = Db::getInstance()->connect();
		$result = mysql_query($sql,$conn);
		return mysql_fetch_assoc($result);
		
	}


	


}