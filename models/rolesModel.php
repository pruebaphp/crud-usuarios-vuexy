<?php 
    require_once('../config/Mysql.php');
class Roles{
    public $mysql;
    function __construct()
    {
        $this->mysql = new Mysql();
    }

    public function obtenerRoles(){
        $sql = "SELECT * FROM roles";
        $resultado = $this->mysql->select_all($sql);
        return $resultado;
    }
}


?>