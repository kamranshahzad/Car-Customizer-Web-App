<?php
class Application_Model_Manufacturer{
	
	
	private $mid;
	private $mname;
	private $note;
	private $status;
	
	
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
	
	
	public function getManId() {
		return $this->mid;
	}
	public function setManId($_val) {
		$this->mid = $_val;
	}
	

	public function getManName() {
		return $this->mname;
	}
	public function setManName($_val) {
		$this->mname = $_val;
	}
	
	public function getNote() {
		return $this->note;
	}
	public function setNote($_val) {
		$this->note = $_val;
	}
	

	public function getStatus() {
		return $this->status;
	}
	public function setStatus($_val) {
		$this->status = $_val;
	}
	


} //$
