<?php
class Application_Model_UserDefaults{
	
	private $did;
	private $uid;
	private $backgroundId;
	private $data;
	
	
	
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
	
	
	public function getDId() { return $this->did; }
	public function setSId($_val) { $this->did = $_val; }
	
	public function getUid() { return $this->uid; }
	public function setUid($_val) { $this->uid = $_val; }
	
	public function getBackgroundId() { return $this->backgroundId; }
	public function setBackgroundId($_val) { $this->backgroundId = $_val; }
	
	public function getData() { return $this->data; }
	public function setData($_val) { $this->data = $_val; }
	
	
	

}  //$
