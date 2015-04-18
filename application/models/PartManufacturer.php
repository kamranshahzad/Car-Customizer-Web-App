<?php
class Application_Model_PartManufacturer{
	
	
	private $manufacturer_id;
	private $manufacturer_name;
	private $notes;
	private $status;

	
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
	
	

	public function getManufacturerId()		{	return $this->asset_id;		}
	public function setManufacturerId($_val)	{	$this->asset_id = $_val;	}

	public function getPartId()			{	return $this->part_id;		}
	public function setPartId($_val)	{	$this->part_id = $_val;		}
	
	public function getFrontView()		{	return $this->FrontView;	}
	public function setFrontView($_val)	{	$this->FrontView = $_val;	}
	
	public function getRearView()		{	return $this->RearView;		}
	public function setRearView($_val)	{	$this->RearView = $_val;	}
	
	public function getInteriorView()		{	return $this->InteriorView;	}
	public function setInteriorView($_val)	{	$this->InteriorView = $_val;}
	



}  //$
