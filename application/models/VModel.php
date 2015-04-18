<?php
class Application_Model_VModel
{
	private $modelId;
	private $makeId;
	private $yearId;
	private $modelName;
	private $modelImage;
	private $trims = array();
	
	
	 public function __construct(array $options = null)
    {
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
	
	
	public function getModelId() {
		return $this->modelId;
	}
	public function setModelId($modelId) {
		$this->modelId = $modelId;
	}
	
	
	public function getMakeId() {
		return $this->makeId;
	}
	public function setMakeId($makeId) {
		$this->makeId = $makeId;
	}


	public function getYearId() {
		return $this->yearId;
	}
	public function setYearId($yearId) {
		$this->yearId = $yearId;
	}
	
	
	public function getModelName() {
		return $this->modelName;
	}
	public function setModelName($modelName) {
		$this->modelName = $modelName;
	}
	
	
	public function getModelImage() {
		return $this->modelImage;
	}
	public function setModelImage($modelImage) {
		$this->modelImage = $modelImage;
	}


	
	public function getTrims() {
		return $this->trims;
	}
	public function setTrims($trims) {
		$this->trims = $trims;
	}




	








} //$
