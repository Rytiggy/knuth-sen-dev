<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Edit Sections</h2>
    </div>
    <div class="card-block">
        <label class="hiddenId" style="display: none">${section.id}</label>
        <div>
            <div class="form-group">
                <label>Title </label>
                <input type="text" class="form-control sectionTitleInput" id="formGroupSectionTitleInput" value="${section.title}">
            </div>
            <div class="form-group">
                <label for="option_box">Professor</label>
                <g:if test="${section.professor}">
                    <input type="text" name = "roleList" id="option_box" list="json-datalist" value=${section.professor.username}>
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
                <label for="option_box">Belongs to Course</label>
                <g:if test="${course}">
                    <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" value="${course.name}">
                </g:if>
                <g:else>
                    <input type="text" name = "roleList" id="option_boxBelongsTo" list="json-datalistBelongsTo" >
                </g:else>

                <datalist id="json-datalistBelongsTo">
                    <g:each in="${courses}">
                        <option value="${it.name}"></option>
                    </g:each>
                </datalist>
            </div>
            <button class="saveEditSection btn btn-default">Save</button>
            <button class="cancelNewSection btn btn-danger">Cancel</button>
        </div>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
