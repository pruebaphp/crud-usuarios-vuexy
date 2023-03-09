<?php 
     session_start();
     
    class Conexion{

        protected $dbh;

        protected function conect(){
            try {
                //$conectar = $this->dbh = new PDO("mysql:local=localhost;dbname=vuexy","root","");
                $conectar = new PDO('mysql:host=mysql-pruebaphp.alwaysdata.net;dbname=pruebaphp_usuarios;charset=utf8','pruebaphp_free','pruebaphpcode');
                $conectar->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conectar;
            } catch (Exception $e) {
                print("¡Error BD!".$e->getMessage()."<br>");
            }
        }

        public function ruta(){
            return 'http://localhost/vuexy/';
        }
    } 

?>