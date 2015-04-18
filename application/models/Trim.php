<?php
class Application_Model_Trim{
	
	
	private $trimId;
	private $modelId;
	private $trimName;

	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
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
	
	
	public function getTrimId() {	return $this->trimId; }
	public function setTrimId($_val) {	$this->trimId = $_val;}
	


	public function getModelId() {	return $this->modelId; }
	public function setModelId($_val){	$this->modelId = $_val;}


	public function getTrimName() {		return $this->trimName;}
	public function setTrimName($_val){	$this->trimName = $_val; }
	


} //$
