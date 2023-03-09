<?php 

require_once('../config/Mysql.php');

class Usuario{
    public $mysql;

    function __construct()
    {
        $this->mysql = new Mysql();
    }

    public function crearUsuario($nombre,$email,$password,$cargo,$estado){
        $sql = "INSERT INTO usuarios (nombre,email,password,cargo,estado) VALUES (?,?,?,?,?)";
        $arrData = array($nombre,$email,$password,$cargo,$estado);
        $resultado = $this->mysql->insert($sql,$arrData);
        return $resultado;
    }

    public function obtenerUsuarios(){
        $sql = 'SELECT * FROM usuarios';
        $resultado = $this->mysql->select_all($sql);
        return $resultado;
    }

    public function eliminarUsuario($idUser){
        $sql = "DELETE FROM usuarios WHERE idusuario =".$idUser;
        //$sql = "DELETE FROM usuarios WHERE idusuario = 5";
        $resultado = $this->mysql->delete($sql);
        return $resultado;
    }

    public function obtenerUsuario($idUser){
        $sql = "SELECT * FROM usuarios WHERE idusuario =".$idUser;
        $resultado = $this->mysql->select($sql);
        return $resultado;
    }

    public function editarUsuario($nombre,$email,$estado,$cargo,$contraseña,$idUser){

        if(!$contraseña){
            $sql = "UPDATE usuarios SET nombre = ? , email = ? , estado = ?, cargo = ? WHERE idusuario=".$idUser;
            $arrData = array($nombre,$email,$estado,$cargo);
        }else{
            $hashContra = hash('SHA256',$contraseña);
            $contraseña = $hashContra;
            $sql = "UPDATE usuarios SET nombre = ? , email = ? , estado = ?, cargo = ? , password = ?  WHERE idusuario=".$idUser;
            $arrData = array($nombre,$email,$estado,$cargo,$contraseña);
        }
        
        $respuesta = $this->mysql->update($sql,$arrData);
        return $respuesta;
    }
} 





?>