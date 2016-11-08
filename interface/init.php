<?php 

/*
 * 版本信息接口：处理升级业务，继承自common类
 *
 */

require_once("common.php");

class Init extends Common{
	
	public function index(){
		//检查当前设备的合法性
		$this->check();

		//获取版本升级信息
		// $versionUpgrade = $this->getVersionUpgrade($this->app['id']);
		$versionUpgrade = $this->getVersionUpgrade($this->app['news_id']);
		if ($versionUpgrade) {
/*
			//无设备测试时，将该判断注释掉
			//升级信息中存在type值，即要升级；并且当前版本号，小于 升级的版本号，才可以升级
			if($versionUpgrade['type'] && ($this->params['version_id'] < $versionUpgrade['version_id'])){
				$versionUpgrade['is_upload'] = $versionUpgrade['type'];
				//新建字段，设置升级信息为type
			}else{
				$versionUpgrade['is_upload'] = 0;
			}
*/
			return Response::show(200, '版本升级信息获取成功', $versionUpgrade);

		} else {
			return Response::show(400, '版本升级信息获取失败');
		}

	}	

}


$init = new Init();
$init->index();


