<?php




class Bootstrap extends Zend_Application_Bootstrap_Bootstrap{
	
	
	public static $frontController = null;
    public static $root = '';
    public static $registry = null;
	
	
	protected function _initSessions(){
		Zend_Session::start();
	}
	
	protected function _initAutoload(){	
	  $autoLoader = Zend_Loader_Autoloader::getInstance();
	  $autoLoader->registerNamespace('Graphs_');//Application_
	  $autoLoader->registerNamespace('Bugs_');
	  $resourceLoader = new Zend_Loader_Autoloader_Resource(array('basePath' => APPLICATION_PATH , 'namespace' => 'Application' ));
	  $resourceLoader->addResourceType('form', 'forms/', 'Form_');
	  $resourceLoader->addResourceType('model', 'models/', 'Model_');
	  return $autoLoader;
	}
	
	protected function _initDatabase()
	{
		 $params = array(
				'host'     => 'localhost',
				'username' => 'dbuser',
				'password' => 'dbpassword',
				'dbname'   => 'dbname',
			);
		
		$profiler = new Bugs_Db_Profiler();
		$profiler->setEnabled(true);
		$params['profiler'] = $profiler;
		$database = Zend_Db::factory('PDO_MYSQL', $params);
		$database->getConnection();
		Zend_Registry::set("database", $database);
		return $database;
	}
	
	protected function _initDomain(){	
		$domain     = 'http://localhost/aoc/';
		Zend_Registry::set("domain", $domain);
		return $domain;
	}
	
	protected function _initPublicPath(){
		$publicPath = 'http://localhost/aoc/public/';
		Zend_Registry::set("publicPath", $publicPath);
		return $publicPath;
	}
	
	
	protected function _initActionHelpers(){
		Zend_Controller_Action_HelperBroker::addPath(APPLICATION_PATH .'/controllers/helpers');
		Zend_Controller_Action_HelperBroker::addPath(APPLICATION_PATH .'/views/helpers');	
	}
	
	
	protected function _initRegisterControllerPlugins() {
		$loader = new Zend_Loader_PluginLoader(array(
			'Plugin' => APPLICATION_PATH . '\plugins',
		));
		$pluginList = array(
			'aclguard'      => $loader->load('AclGuard')
			//'plugin2' => $loader->load('Plugin2'),
		);
		$frontController = Zend_Controller_Front::getInstance();
		foreach ($pluginList as $pluginClass) {
			$frontController->registerPlugin(new $pluginClass());
		}
	}
	
	


	protected function _initViewHelpers()
	  {
				$front  = Zend_Controller_Front::getInstance();
				$router = $front->getRouter();
				
				
				$router->addRoute('user/createuser',
				  new Zend_Controller_Router_Route('createuserperm/*', array(
					'controller' => 'userperm',
					'action'     	=> 'createuserperm'
				  ))
				);
	  }
	
	
	
	
}