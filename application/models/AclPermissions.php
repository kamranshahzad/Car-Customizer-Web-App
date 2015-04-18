<?php



class Application_Model_AclPermissions{
	
	private $pId;
	private $roleId;
	private $rId;
	private $permission;
	
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
	
	public function getpId() {
		return $this->pId;
	}
	
	public function setpId($pId) {
		$this->pId = $pId;
	}
	
	public function getRoleId() {
		return $this->roleId;
	}
	
	public function setRoleId($roleId) {
		$this->roleId = $roleId;
	}
	
	public function getrId() {
		return $this->rId;
	}
	
	public function setrId($rId) {
		$this->rId = $rId;
	}
	
	public function getPermissions() {
		return $this->permission;
	}
	
	public function setPermissions($perm) {
		$this->permission = $perm;
	}
	
	
	
}	// $
