<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Edit Department</h2>
    </div>
    <div class="card-block">
        <label class="hiddenId" style="display: none">${department.id}</label>
        <div>
            <div class="form-group">
                <label>Department Name </label>
                <input type="text" class="form-control departmentNameInput" id="formGroupDepartmentNameInput" value=${department.name}>
            </div>
            <div class="form-group">
                <label for="option_box">Department Coordinator</label>
                <g:if test="${faculty.role}">
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" value=${department.departmentCoordinator.username}>
                </g:if>
                <g:else>
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" >
                </g:else>

                <datalist id="json-datalist">
                    <g:each in="${faculty}">
                        <option value="${it.username}">${it.fname} ${it.lname}</option>
                    </g:each>
                </datalist>
            </div>
            <button class="saveEditDepartment btn btn-default">Save</button>
            <button class="cancelNewDepartment btn btn-danger">Cancel</button>
        </div>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
