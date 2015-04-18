<?php



class Application_Model_AclResources{
	
	private $rId;
	private $resource;
	private $actions;
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value){
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
        }
        $this->$method($value);
    }
 
    public function __get($name){
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options){
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	public function getrId() {
		return $this->rId;
	}
	
	public function setrId($rId) {
		$this->rId = $rId;
	}
	
	public function getResourceName() {
		return $this->resource;
	}
	
	public function setResourceName($resource_name) {
		$this->resource = $resource_name;
	}
	
	public function getActions() {
		return $this->actions;
	}
	
	public function setActions($actions) {
		$this->actions = $actions;
	}
	
	
}	// $
