<?php

class Application_Model_CanvesBackground{

    private $canves_id;
    private $vehicle_id;
    private $background_id;
	private $coordinates;

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

    public function getCanvesBgId() {
        return $this->canves_id;
    }
    public function setCanvesBgId($_value) {
        $this->canves_id = $_value;
    }
	
	public function getVehicleId() {
        return $this->vehicle_id;
    }
    public function setVehicleId($_value) {
        $this->vehicle_id = $_value;
    }
	
	public function getBgId() {
        return $this->background_id;
    }
    public function setBgId($_value) {
        $this->background_id = $_value;
    }

    public function getCoordinates() {
        return $this->coordinates;
    }
    public function setCoordinates($_value) {
        $this->coordinates = $_value;
    }


}  //$