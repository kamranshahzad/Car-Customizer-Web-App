<?php

class Application_Model_AclRoles{

	private $roleId;
	private $roleName;
	private $description;
	private $iscp;
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value){
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Role property');
        }
        $this->$method($value);
    }
 
    public function __get($name){
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Role property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options){
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
			echo $method.'<br>';
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	
	public function getRoleId() {	return $this->roleId;	}
	public function setRoleId($_val){	$this->roleId = $_val;	}
	
	public function getRoleName() {		return $this->roleName; }
	public function setRoleName($_val){	$this->roleName = $_val;	}
	
	public function getDescription() {	return $this->description;	}
	public function setDescription($_val) {	$this->description = $_val;	}
	
	public function getIs() {	return $this->iscp;	}
	public function setIs($_val) {	$this->iscp = $_val;	}
	
}	// $
