<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Edit Courses</h2>
    </div>
    <div class="card-block">
        <label class="hiddenId" style="display: none">${course.id}</label>
        <div>
            <div class="form-group">
                <label>Name </label>
                <input type="text" class="form-control courseNameInput" id="formGroupCourseTitleInput" value="${course.name}">
            </div>
            <div class="form-group">
                <label for="option_box">Course Coordinator</label>
                <g:if test="${course.courseCoordinator}">
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" value=${course.courseCoordinator.username}>
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

            <div class="form-group">
                <label for="option_box">Belongs to Department</label>
                <g:if test="${department}">
                    <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" value="${department.name}">
                </g:if>
                <g:else>
                    <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" >
                </g:else>

                <datalist id="json-datalistBelongsTo">
                    <g:each in="${departments}">
                        <option value="${it.name}"></option>
                    </g:each>
                </datalist>
            </div>
            <div class="form-group">
                <label>Course Description</label>
                <textarea class="form-control descriptionTextArea" id="exampleTextarea" rows="3">${course.description}</textarea>
            </div>
            <button class="saveEditCourse btn btn-default">Save</button>
            <button class="cancelNewCourse btn btn-danger">Cancel</button>
        </div>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
