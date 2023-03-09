

window.onload = ()=>{
  let usuariosAjax;

  let dt_basic_table;
  let btnguardarUsuarioModal = document.querySelector('#btnguardarUsuario');
  let formUsuario = document.querySelector('#formUsuario');
  btnguardarUsuarioModal.addEventListener('click',function(){
    let idUser = document.querySelector('#idUsuario').value;
    if(idUser==0){
      guardarUsuario();
    }else{
      editarUsuario(idUser);
    }
  });

  obtenerRoles();
  cargarUsuariosDT();
  

}

function cargarUsuariosDT(){
    dt_basic_table = $('.datatables-basic').DataTable({
        
      "destroy":true,
//     
      ajax:{
        "url": "../../controllers/usuarioController.php?opc=listar",
        "dataSrc":""
    },
      //data: usuariosAjax2,
      columns: [
        { data: 'idusuario' },
        { data: 'nombre' },
        { data: 'email' },
        { data: 'estado' },
        { data: 'cargo' },
        { data: 'acciones' },
      ],
      order: [[0, 'desc']],
      
      displayLength: 7,
      lengthMenu: [7, 10, 25, 50, 75, 100],
      language: {
        "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
      },
      });
      
    }
   
  
  let eliminarUsuario = (id)=>{
    
    const idUser = id;
    tableUsuarios = document.querySelector('.datatables-basic');
    console.log(idUser);
    console.log(typeof idUser);
    console.log(tableUsuarios);

    Swal.fire({
      title: `Desea eliminar al usuario ${idUser}?`,
      text: "No podrá revertir los cambios luego.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
      customClass: {
        confirmButton: 'btn btn-primary me-3',
        cancelButton: 'btn btn-label-secondary'
      },
      buttonsStyling: false
    }).then(function (result) {
      if (result.value) {

        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        var ajaxUrl = `../../controllers/usuarioController.php?opc=eliminar`;
        const strData = "idUser="+idUser;
        request.open("POST",ajaxUrl,true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send(strData);
        
        
        request.onreadystatechange = function(){
          if(request.readyState == 4 && request.status == 200){
              let objData = JSON.parse(request.responseText);
              if(objData.status){
                
                dt_basic_table.ajax.reload( null, false );         
                mensajeSuceso(objData.msg);
              }else{
                mensajeError(objData.msg);
              }
          }
        }

      }
    });

  }
  

  function obtenerRoles(){

    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = '../../controllers/rolesController.php?opc=obtenerRoles';
    request.open("GET",ajaxUrl,true);
    request.send();
    request.onreadystatechange = function(){
      if(request.readyState == 4 && request.status == 200){
          let objData = (request.responseText);
          document.querySelector('#cargo').innerHTML = objData;
      }
    }
    
  }

  function crearUsuarioModal(){

    document.querySelector('#nombre').value = '';
    document.querySelector('#email').value = '';
    document.querySelector('#estado').value = 1;
    document.querySelector('#cargo').value = 'Dispensador';
    document.querySelector('#idUsuario').value = '0';


    document.querySelector('#modalCenterTitle').textContent = 'Añadir usuario';
    document.querySelector('#btnguardarUsuario').textContent = 'Guardar cambios';
    

    $('#modalUsuario').modal('show');
  }

  function editarUsuarioModal(idUser){

    document.querySelector('#modalCenterTitle').textContent = 'Editar usuario';
    document.querySelector('#btnguardarUsuario').textContent = 'Actualizar';

    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = `../../controllers/usuarioController.php?opc=obtenerUsuario`;
    const strData = "idUser="+idUser;
    request.open("POST",ajaxUrl,true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(strData);
  
  
    request.onreadystatechange = function(){
    if(request.readyState == 4 && request.status == 200){
        let objData = JSON.parse(request.responseText);
        if(objData.status){
          document.querySelector('#nombre').value = objData.data.nombre;
          document.querySelector('#email').value = objData.data.email;
          document.querySelector('#estado').value = objData.data.estado;
          document.querySelector('#cargo').value = objData.data.cargo;
          document.querySelector('#idUsuario').value = objData.data.idusuario;
        }else{
         
        }
      
    }
      }

    $('#modalUsuario').modal('show')
  }


  function guardarUsuario(){

    const campoNombres = document.querySelector('#nombre').value;
    const campoEmail = document.querySelector('#email').value;
    const campoEstado = document.querySelector('#estado').value;
    const campoCargo = document.querySelector('#cargo').value;
    const campoPassword = document.querySelector('#password').value;

    if(!campoNombres){
      mensajeError('Ingrese el nombre de usuario.');
      return
    }

    if(!campoEmail){
      mensajeError('Ingrese el email.');
      return
    }

    if(!validarEmail(campoEmail)){
      mensajeError('Ingrese un email correcto.');
      return
    }

    if(!campoEstado){
      mensajeError('Debe seleccionar el estado.');
      return
    }

    if(!campoPassword){
      mensajeError('Ingrese la contraseña.');
      return
    }

    if(!campoCargo){
      mensajeError('Debe seleccionar el cargo.');
      return
    }


  var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
  var ajaxUrl = '../../controllers/usuarioController.php?opc=insertar';
  var formData = new FormData(formUsuario);
  request.open("POST",ajaxUrl,true);
  request.send(formData);


  request.onreadystatechange = function(){
  if(request.readyState == 4 && request.status == 200){
      let objData = JSON.parse(request.responseText);
      if(objData.status){
        mensajeSuceso(objData.msg);
        formUsuario.reset();
        $('#modalUsuario').modal('hide');
        dt_basic_table.ajax.reload( null, false );
        
      }else{
        mensajeError(objData.msg);
      }
    
  }
    }
  }


  function editarUsuario(idUser){
    console.log('editando el usuario:'+idUser);

    const campoNombres = document.querySelector('#nombre').value;
    const campoEmail = document.querySelector('#email').value;
    const campoEstado = document.querySelector('#estado').value;
    const campoCargo = document.querySelector('#cargo').value;
    const campoPassword = document.querySelector('#password').value;

    if(!campoNombres){
      mensajeError('Ingrese el nombre de usuario.');
      return
    }

    if(!campoEmail){
      mensajeError('Ingrese el email.');
      return
    }

    if(!validarEmail(campoEmail)){
      mensajeError('Ingrese un email correcto.');
      return
    }

    if(!campoEstado){
      mensajeError('Debe seleccionar el estado.');
      return
    }

    if(!campoCargo){
      mensajeError('Debe seleccionar el cargo.');
      return
    }

    const objetoDatos = {
      nombre:campoNombres,
      email:campoEmail,
      estado:campoEstado,
      cargo:campoCargo,
      password:campoPassword,
      idusuario: idUser,
    }

    
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = `../../controllers/usuarioController.php?opc=editar`;
    var strData = 'arrayDatos='+JSON.stringify(objetoDatos);
    request.open("POST",ajaxUrl,true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(strData);
    
    
    request.onreadystatechange = function(){
      if(request.readyState == 4 && request.status == 200){
         const objData = JSON.parse(request.responseText);
         if(objData.status){
          mensajeSuceso(objData.msg);
          $('#modalUsuario').modal('hide');
          formUsuario.reset();
          dt_basic_table.ajax.reload( null, false );
         }else{
          mensajeError(objData.msg);
         }
      }
    }
  }


