<?php
class Application_Model_UserParts
{
	private $id;
	private $uid;
	private $part_id;
	private $part_type;
	private $status;
	private $part_price;
	private $monthly_price;
	
	
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
	
	
	public function getId() {
		return $this->id;
	}
	public function setId($_value) {
		$this->id = $_value;
	}
	
	public function getUid() {
		return $this->uid;
	}
	public function setUid($_value) {
		$this->uid = $_value;
	}
	
	public function getPartId() {
		return $this->part_id;
	}
	public function setPartId($_value) {
		$this->part_id = $_value;
	}
	
	public function getPartType() {
		return $this->part_type;
	}
	public function setPartType($_value) {
		$this->part_type = $_value;
	}
	
	public function getStatus() {
		return $this->status;
	}
	public function setStatus($_value) {
		$this->status = $_value;
	}
	
	public function getPartPrice() {
		return $this->part_price;
	}
	public function setPartPrice($_value) {
		$this->part_price = $_value;
	}
	
	public function getPartPrice2() {
		return $this->monthly_price;
	}
	public function setPartPrice2($_value) {
		$this->monthly_price = $_value;
	}
	
}  //$
