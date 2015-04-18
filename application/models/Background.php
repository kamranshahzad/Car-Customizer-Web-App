<?php

class Application_Model_Background{

    private $BgId;
    private $BgName;
    private $BgImage;
	private $status;
	
	
    public function __construct(array $options = null) {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value) {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid BackGrounds property');
        }
        $this->$method($value);
    }

    public function __get($name) {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid BackGrounds property');
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

    public function getBgId() {
        return $this->BgId;
    }
    public function setBgId($_val) {
        $this->BgId = $_val;
    }


    public function getBgName() {
        return $this->BgName;
    }
    public function setBgName($_val) {
        $this->BgName = $_val;
    }

    public function getBgImage() {
        return $this->BgImage;
    }
    public function setBgImage($_val) {
        $this->BgImage = $_val;
    }
	
	public function getStatus() {
        return $this->status;
    }
    public function setStatus($_val) {
        $this->status = $_val;
    }


}  //$