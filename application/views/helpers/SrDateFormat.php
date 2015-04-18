<?php
/**
* View helper for returning dates in Serbian format
* dd.mm.yyyy.
*
*/
class Zend_View_Helper_SrDateFormat
{
    public function srDateFormat($dateToFormat)
    {
        return date('d.m.Y.', strtotime($dateToFormat));
    }
}
