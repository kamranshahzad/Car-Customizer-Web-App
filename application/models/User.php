<?php

class Application_Model_User {

    private $uid;
	private $ref;
    private $dealer_id;
    private $uname;
    private $password;
    private $email;
    private $role_id;
	private $enable;
	
	
    public function __construct(array $options = null) {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value) {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid User property');
        }
        $this->$method($value);
    }

    public function __get($name) {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid User property');
        }
        return $this->$method();
    }

    public function setOptions(array $options) {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }

    public function getUserId() {
        return $this->uid;
    }
	public function setUserId($uid) {
        $this->uid = $uid;
    }
	
	
	public function geRef() {
        return $this->ref;
    }
	public function setRef($_val) {
        $this->ref = $_val;
    }
	
	
    public function getDealerId() {
        return $this->dealer_id;
    }
	public function setDealerId($_val) {
        $this->dealer_id = $_val;
    }
	
	

    public function getUserName() {
        return $this->uname;
    }
	public function setUserName($_val) {
        $this->uname = $_val;
    }
	
	
    public function getPassword() {
        return $this->password;
    }
	public function setPassword($password) {
        $this->password = $password;
    }
	


    public function getEmail() {
        return $this->email;
    }
	public function setEmail($_val) {
        $this->email = $_val;
    }
	
	

    public function getRoleId() {
        return $this->role_id;
    }
	public function setRoleId($_val) {
        $this->role_id = $_val;
    }

	
	public function getEnabled() {
        return $this->enable;
    }
	public function setEnabled($_val) {
        $this->enable = $_val;
    }


}  // $class
