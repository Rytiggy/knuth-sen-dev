<g:if test="${!faculty}">
    <div class="card text-center flex-item">
        <div class="card-header">
            <h2>Create Department</h2>
        </div>
        <div class="card-block">
            <p class="card-text">You cannot create a new department if there are is no Faculty to assign as a coordinator.</p>
            <button type="button" class="newFacultyButton  btn btn-default">New Faculty <span class="glyphicon glyphicon-plus "></span></button>
        </div>
        <div class="card-footer text-muted">
            .
        </div>
    </div>
</g:if>
<g:else>
    <div class="card text-center flex-item">
        <div class="card-header">
            <h2>Create Department</h2>
        </div>
        <div class="card-block">
            <div>
                <div class="form-group">
                    <label>Department Name </label>
                    <input type="text" class="form-control departmentNameInput" id="formGroupdepartmentNameInput" placeholder="Department Name">
                </div>
                <div class="form-group">
                    <label for="option_box">Department Coordinator</label>
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" placeholder="Select a Department Coordinator">
                    <datalist id="json-datalist">
                        <g:each in="${faculty}">
                            <option value="${it.username}">${it.fname} ${it.lname}</option>
                        </g:each>
                    </datalist>
                </div>
                <button class="saveNewDepartment btn btn-default">Save</button>
                <button class="cancelNewDepartment btn btn-danger">Cancel</button>
            </div>
        </div>
        <div class="card-footer text-muted">
            .
        </div>
    </div>
</g:else>
