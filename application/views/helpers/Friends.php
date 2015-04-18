<?php

class Zend_View_Helper_Friends extends Zend_View_Helper_Abstract {
 
 private $_show;
 private $_gender;
 
 public function friends() {
  return "hello friends!";
 }
 
 /*
 public function friends() {
  $this->_defaultValues();
  return $this;
}*/
 
 private function _defaultValues() {
  $this->show(null);
  $this->gender(null);
 }
 
 public function show($show) {
  $this->show = $show;
  return $this;
 }
 
 public function gender($gender) {
  $this->gender= $gender;
  return $this;
 }
 
 public function render() {
  // .. replace with a method call to gather data based on whats been set
  return "these are my friends: " . $this->_finalOutput;
 }
 
}
 
?>