<?php
class Application_Model_UserDetails
{
	private $id;
	private $uid;
	private $title;
	private $address;
	private $city;
	private $state;
	private $zip;
	private $phone;
	private $web_url;
	private $logo_img;
	
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
	public function setId($_name) {
		$this->id = $_name;
	}
	
	public function getUid() {
		return $this->uid;
	}
	public function setUid($_value) {
		$this->uid = $_value;
	}
	
	public function getTitle() {
		return $this->title;
	}
	public function setTitle($_value) {
		$this->title = $_value;
	}
	
	public function getAddress() {
		return $this->address;
	}
	public function setAddress($_value) {
		$this->address = $_value;
	}
	
	public function getCity() {
		return $this->city;
	}
	public function setCity($_value) {
		$this->city = $_value;
	}
	
	public function getState() {
		return $this->state;
	}
	public function setState($_value) {
		$this->state = $_value;
	}
	
	public function getZip() {
		return $this->zip;
	}
	public function setZip($_value) {
		$this->zip = $_value;
	}
	
	public function getPhone() {
		return $this->phone;
	}
	public function setPhone($_value) {
		$this->phone = $_value;
	}
	
	public function getWeburl() {
		return $this->web_url;
	}
	public function setWeburl($_value) {
		$this->web_url = $_value;
	}
	
	public function getLogoImg() {
		return $this->logo_img;
	}
	public function setLogoImg($_value) {
		$this->logo_img = $_value;
	}
	
	

}  //$
