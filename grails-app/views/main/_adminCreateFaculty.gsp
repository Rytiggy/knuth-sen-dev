<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Create Faculty</h2>
    </div>
    <div class="card-block">
        <div>
            <div class="form-group">
                <label>First Name </label>
                <input type="text" class="form-control firstNameInput" id="formGroupFirstNameInput" placeholder="First Name">
            </div>
            <div class="form-group">
                <label>Middle Name </label>
                <input type="text" class="form-control middleNameInput" id="formGroupMiddleNameInput" placeholder="Middle Name">
            </div>
            <div class="form-group">
                <label>Last Name </label>
                <input type="text" class="form-control lastNameInput" id="formGroupLastNameInput" placeholder="Last Name">
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control usernameInput" id="formGroupUsernameInput" placeholder="Username">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control emailInput" id="formGroupEmailInput" placeholder="Email">
            </div>
            <div class="form-group">
                %{--toggle switch location--}%
            </div>
            <div class="form-group">
                <label for="option_box">User Role</label>
                <input type="text" name = "roleList" id="option_box" list="json-datalist" placeholder="Select a Role">
                <datalist id="json-datalist">
                    <g:each in="${roles}">
                        <option value="${it.role}"></option>
                    </g:each>
                </datalist>
            </div>
            <button class="saveNewFaculty btn btn-default">Save</button>
            <button class="cancelNewFaculty btn btn-danger">Cancel</button>
        </div>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
