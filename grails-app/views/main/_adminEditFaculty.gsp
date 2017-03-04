<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Edit Faculty</h2>
    </div>
    <div class="card-block">
        <label class="hiddenId" style="display: none">${faculty.id}</label>
        <div>
            <div class="form-group">
                <label>First Name </label>
                <input type="text" class="form-control firstNameInput" id="formGroupFirstNameInput" value=${faculty.fname}>
            </div>
            <div class="form-group">
                <label>Middle Name </label>
                <input type="text" class="form-control middleNameInput" id="formGroupMiddleNameInput" value=${faculty.mname}>
            </div>
            <div class="form-group">
                <label>Last Name </label>
                <input type="text" class="form-control lastNameInput" id="formGroupLastNameInput" value=${faculty.lname}>
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control usernameInput" id="formGroupUsernameInput" value=${faculty.username}>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control emailInput" id="formGroupEmailInput" value=${faculty.email}>
            </div>
            <div class="form-group">
                %{--toggle switch location--}%
            </div>
            <div class="form-group">
                <label for="option_box">User Role</label>
                <g:if test="${faculty.role}">
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" value=${faculty.role.role}>
                </g:if>
                <g:else>
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" >
                </g:else>

                <datalist id="json-datalist">
                    <g:each in="${roles}">
                        <option value="${it.role}"></option>
                    </g:each>
                </datalist>
            </div>
            <button class="saveEditFaculty btn btn-default">Save</button>
            <button class="cancelNewFaculty btn btn-danger">Cancel</button>
        </div>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
