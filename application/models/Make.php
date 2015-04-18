<?php
class Application_Model_Make{
	
	
	private $makeId;
	private $makeName;
	private $makeDes;
	private $makeIcon;
	
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Make property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Make property');
        }
        return $this->$method();
    }
	
    public function setOptions(array $options)
    {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	public function getMakeId() {
		return $this->makeId;
	}
	public function setMakeId($_val) {
		$this->makeId = $_val;
	}
	

	public function getMakeName() {
		return $this->makeName;
	}
	public function setMakeName($_val) {
		$this->makeName = $_val;
	}
	
	public function getMakeDes() {
		return $this->makeDes;
	}
	public function setMakeDes($_val) {
		$this->makeDes = $_val;
	}
	

	public function getMakeIcon() {
		return $this->makeIcon;
	}
	public function setMakeIcon($_val) {
		$this->makeIcon = $_val;
	}
	


} //$
