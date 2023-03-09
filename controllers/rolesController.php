<?php 

require_once('../models/rolesModel.php');

switch ($_GET['opc']) {
    case 'obtenerRoles': obtenerRoles(); break;

}

function obtenerRoles(){
    $roles = new Roles();
    $respuesta =  $roles->obtenerRoles();
    $opcHMTL = '';
    if(count($respuesta)>0){
       foreach ($respuesta as $key) {
        $opcHMTL .= '<option value="'.$key['nombreRol'].'">'.$key['nombreRol'].'</option>';
       }
       echo $opcHMTL;
    }
}


?>