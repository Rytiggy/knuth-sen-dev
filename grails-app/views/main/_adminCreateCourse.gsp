<g:if test="${!faculty}">
    <div class="card text-center flex-item">
        <div class="card-header">
            <h2>Create Course</h2>
        </div>
        <div class="card-block">
            <p class="card-text">You cannot create new course if there are is no Faculty to assign as a coordinator.</p>
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
            <h2>Create Course</h2>
        </div>
        <div class="card-block">
            <div>
                <div class="form-group">
                    <label>Course Name </label>
                    <input type="text" class="form-control courseNameInput" id="formGroupCourseTitleInput" placeholder="Course Name">
                </div>

                <div class="form-group">
                    <label for="option_box">Course Coordinator</label>
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" placeholder="Select a Course Coordinator">
                    <datalist id="json-datalist">
                        <g:each in="${faculty}">
                            <option value="${it.username}">${it.fname} ${it.lname}</option>
                        </g:each>
                    </datalist>
                </div>

                <div class="form-group">
                    <label for="option_boxBelongsTo">Belongs to Department</label>
                    <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" placeholder="Select a Department">
                    <datalist id="json-datalistBelongsTo">
                        <g:each in="${departments}">
                            <option value="${it.name}"></option>
                        </g:each>
                    </datalist>
                </div>

                <div class="form-group">
                    <label>Course Description</label>
                    <textarea class="form-control descriptionTextArea" id="exampleTextarea" rows="3" placeholder="Course Description"></textarea>
                </div>
                <button class="saveNewCourse btn btn-default">Save</button>
                <button class="cancelNewCourse btn btn-danger">Cancel</button>
            </div>
        </div>
        <div class="card-footer text-muted">
            .
        </div>
    </div>
</g:else>