<?php
class Application_Model_ExteriorColor
{
	private $exteriorColorId;
	private $trimId;
	private $colorLabel;
	private $colorCode;
	
	
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Model property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Model property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options)
    {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	public function getExteriorColorId() {
		return $this->exteriorColorId;
	}
	public function setExteriorColorId($exteriorColorId) {
		$this->exteriorColorId = $exteriorColorId;
	}
	

	public function getTrimId() {
		return $this->trimId;
	}
	public function setTrimId($trimId) {
		$this->trimId = $trimId;
	}
	
	
	public function getColorLabel() {
		return $this->colorLabel;
	}
	public function setColorLabel($colorLabel) {
		$this->colorLabel = $colorLabel;
	}
	
	
	public function getColorCode() {
		return $this->colorCode;
	}
	public function setColorCode($colorCode) {
		$this->colorCode = $colorCode;
	}
	



} //$
