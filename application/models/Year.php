<?php
class Application_Model_Year
{
	private $yearId;
	private $year;
	private $des;

	
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
            throw new Exception('Invalid Year property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Year property');
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
	
	
	
	public function getYearId() {
		return $this->yearId;
	}
	public function setYear($_val) {
		$this->year = $_val;
	}
	
	
	public function getYear() {
		return $this->year;
	}
	public function setYearId($_val) {
		$this->yearId = $_val;
	}
	
	
	public function getDes() {
		return $this->des;
	}
	public function setDes($_val) {
		$this->des = $_val;
	}


} // $
