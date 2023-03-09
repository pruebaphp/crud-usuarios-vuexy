<?php 

require_once('../models/usuarioModel.php');

switch ($_GET['opc']) {
    case 'insertar': isertarUsuario(); break;
    case 'listar': listarUsuarios(); break;
    case 'eliminar': eliminarUsuario(); break;
    case 'obtenerUsuario': obtenerUsuario(); break;
    case 'editar': editarUsuario(); break;

}

function isertarUsuario(){

    $usuario = new Usuario();

    $nombre =  $_POST['nombre'];
    $email =  $_POST['email'];
    $password = $_POST['password'];
    $cargo =  $_POST['cargo'];
    $estado =  $_POST['estado'];

    $resultado = $usuario->crearUsuario($nombre,$email,hash("SHA256",$password),$cargo,$estado);

    if($resultado>0){
        $arrData = array('status'=>true,'msg'=>'Se agregó correctamente al usuario.');
    }else{
        $arrData = array('status'=>true,'msg'=>'No se pudo insertar al usuario.');
    }

    echo json_encode($arrData);

}

function listarUsuarios(){
    $usuario = new Usuario();
    $resultado = $usuario->obtenerUsuarios();
    for ($i=0; $i < count($resultado); $i++) { 

        if($resultado[$i]['estado']==1){
            $resultado[$i]['estado'] = '<span class="badge bg-label-success">Activo</span>';
        }else{
            $resultado[$i]['estado'] =  '<span class="badge bg-label-danger">Inactivo</span>';
        }

        $resultado[$i]['cargo'] = '<span class="badge bg-label-secondary">'.$resultado[$i]['cargo'].'</span>';

        $resultado[$i]['acciones'] = '<div class="d-inline-block">' .
        '<a href="javascript:;" class="btn btn-sm btn-icon dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="text-primary ti ti-dots-vertical"></i></a>' .
        '<ul class="dropdown-menu dropdown-menu-end m-0">' .
        '<li><button onClick="editarUsuarioModal('.$resultado[$i]['idusuario'].')" class="dropdown-item text-success">Editar</button></li>' .
        '<li><button onClick="eliminarUsuario('.$resultado[$i]['idusuario'].')" class="dropdown-item text-danger delete-record">Eliminar</button></li>' .
        '</ul></div>';
    }
    

    echo json_encode($resultado);
}

function eliminarUsuario(){
    $usuario = new Usuario();
    $idUser = ($_POST['idUser']);

     $respuesta = $usuario->eliminarUsuario($idUser);
   if($respuesta>0){
        $arrData = array('status'=>true,'msg'=>'Se eliminó al usuario con éxito.');
    }else{
        $arrData = array('status'=>false,'msg'=>'No se pudo eliminar al usuario.');
    }
    
    echo json_encode($arrData);
}

function obtenerUsuario(){
    $usuario = new Usuario();
    $idUser = $_POST['idUser'];
    $respuesta = $usuario->obtenerUsuario($idUser);

    if(count($respuesta)>0){
        $arrData = array('status'=>true,'data'=>$respuesta);
    }else{
        $arrData = array('status'=>false);
    }

    echo json_encode($arrData);
    
}

function editarUsuario(){
    $usuario = new Usuario();
    $arrayDatos = json_decode($_POST['arrayDatos'],true);

    $respuesta = $usuario->editarUsuario($arrayDatos['nombre'],$arrayDatos['email'],$arrayDatos['estado'],$arrayDatos['cargo'],$arrayDatos['password'],$arrayDatos['idusuario']);

    if(!empty($respuesta)){
        $arrData = array('status'=>true,'msg'=>'Usuario actualizado correctamente.');
    }else{
        $arrData = array('status'=>false,'msg'=>'Ocurrio un problema.');
    }

    echo json_encode($arrData);
    //print_r($arrayDatos);
    //echo ($arrayDatos['nombre']);
}



?>