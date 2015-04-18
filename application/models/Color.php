<?php

class Application_Model_Color{

    private $color_id;
    private $interior_colors_id;
    private $exterior_colors_id;


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

    public function getColorId() {
        return $this->color_id;
    }
    public function setColorId($_value) {
        $this->color_id = $_value;
    }
	
	public function getExteriorColorId() {
        return $this->exterior_colors_id;
    }
    public function setExteriorColorId($_value) {
        $this->exterior_colors_id = $_value;
    }
	
	public function getInteriorColorId() {
        return $this->interior_colors_id;
    }
    public function setInteriorColorId($_value) {
        $this->interior_colors_id = $_value;
    }



}  //$