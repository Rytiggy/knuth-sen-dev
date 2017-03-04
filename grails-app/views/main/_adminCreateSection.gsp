<g:if test="${!faculty}">
    <div class="card text-center flex-item">
        <div class="card-header">
            <h2>Create Section</h2>
        </div>
        <div class="card-block">
            <p class="card-text">You cannot create new sections if there are is no Faculty to assign to them.</p>
            <button type="button" class="newFacultyButton  btn btn-default">New Faculty <span class="glyphicon glyphicon-plus "></span></button>
        </div>
        <div class="card-footer text-muted">
            .
        </div>
    </div>
</g:if>
<g:else>
    <g:if test="${!courses}">
        <div class="card text-center flex-item">
            <div class="card-header">
                <h2>Create Section</h2>
            </div>
            <div class="card-block">
                <p class="card-text">You cannot create a new section if there are are no courses to assign it to.</p>
                <button type="button" class="newCourseButton  btn btn-default">New Course <span class="glyphicon glyphicon-plus "></span></button>
            </div>
            <div class="card-footer text-muted">
                .
            </div>
        </div>
    </g:if>
    <g:else>
        <div class="card text-center flex-item">
            <div class="card-header">
                <h2>Create Sections</h2>
            </div>
            <div class="card-block">
                <div>
                    <div class="form-group">
                        <label>Title </label>
                        <input type="text" class="form-control sectionTitleInput" id="formGroupSectionTitleInput" placeholder="Section Title">
                    </div>

                    <div class="form-group">
                        <label for="option_box">Professor</label>
                        <input type="text" name = "roleList" id="option_box" list="json-datalist" placeholder="Select a Professor">
                        <datalist id="json-datalist">
                            <g:each in="${faculty}">
                                <option value="${it.username}">${it.fname} ${it.lname}</option>
                            </g:each>
                        </datalist>
                    </div>

                    <div class="form-group">
                        <label for="option_boxBelongsTo">Belongs to Course</label>
                        <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" placeholder="Select a Course">
                        <datalist id="json-datalistBelongsTo">
                            <g:each in="${courses}">
                                <option value="${it.name}"></option>
                            </g:each>
                        </datalist>
                    </div>
                    <button class="saveNewSection btn btn-default">Save</button>
                    <button class="cancelNewSection btn btn-danger">Cancel</button>
                </div>
            </div>
            <div class="card-footer text-muted">
                .
            </div>
        </div>
    </g:else>
</g:else>