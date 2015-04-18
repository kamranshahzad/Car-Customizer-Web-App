<?php
class Application_Model_InteriorColor
{
	private $interiorColorId;
	private $trimId;
	private $colorLabel;
	private $colorImage;
	
	
	
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
	
	
	
	public function getInteriorColorId() {
		return $this->interiorColorId;
	}
	public function setInteriorColorId($interiorColorId) {
		$this->interiorColorId = $interiorColorId;
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
	
	
	public function getColorImage() {
		return $this->colorImage;
	}
	public function setColorImage($colorImage) {
		$this->colorImage = $colorImage;
	}

	


} //$
