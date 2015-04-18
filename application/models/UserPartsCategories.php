<?php
class Application_Model_UserPartsCategories{
	
	
	private $id;
	private $uid;
	private $part_category_id;
	private $status;
	
	
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
	
	
	public function getId(){
		return $this->id;
	}
	public function setId($_value){
		$this->id = $_value;
	}
	
	public function getUid(){
		return $this->uid;
	}
	public function setUid($_value){
		$this->uid = $_value;
	}
	
	public function getPartCategoryId(){
		return $this->part_category_id;
	}
	public function setPartCategoryId($_value){
		$this->part_category_id = $_value;
	}
	
	public function getStatus(){
		return $this->status;
	}
	public function setStatus($_value){
		$this->status = $_value;
	}




}  //$
