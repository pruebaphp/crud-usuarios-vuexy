                    <!-- Vertically Centered Modal -->
                    <div class="col-lg-4 col-md-6">
                      <small class="text-light fw-semibold">Vertically centered</small>
                      <div class="mt-3">

                        <!-- Modal -->
                        <div class="modal fade" id="modalUsuario" data-bs-backdrop="static" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">Añadir usuario</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">

                              <form id="formUsuario" name="formUsuario">

                              <input
                                      type="hidden"
                                      id="idUsuario"
                                      name="idUsuario"
                                      class="form-control"

                                    />


                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameWithTitle" class="form-label">Nombres</label>
                                    <input
                                      type="text"
                                      id="nombre"
                                      name="nombre"
                                      class="form-control"
                                      placeholder="Ingresa el nombre"
                                    />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="emailWithTitle" class="form-label">Email</label>
                                    <input
                                      type="email"
                                      id="email"
                                      name="email"
                                      class="form-control"
                                      placeholder="correo@correo.com"
                                    />
                                  </div>
                                  <div class="col mb-0">
                                    <label for="nameWithTitle" class="form-label">Estado</label>
                                    <select class="form-select" id="estado" name="estado" aria-label="Default select example">
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                    </select>
                                  </div>
                                
                                </div>

                                <div class="row mt-3">
                                  <div class="col mb-3">
                                    <label for="nameWithTitle" class="form-label">Cargo</label>
                                    <select class="form-select" id="cargo" name="cargo" aria-label="Default select example">
                                    </select>
                                  </div>
                                </div>
                              
                                <div class="row mt-0">
                                  <div class="col mb-3">
                                    <label for="nameWithTitle" class="form-label">Contraseña</label>
                                    <input class="form-control" id="password" name="password" type="password" id="html5-password-input">
                                  </div>
                                </div>
                                </form>


                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                                  Cerrar
                                </button>
                                <button type="button" id="btnguardarUsuario" class="btn btn-primary">Guardar cambios</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>