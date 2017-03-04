<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Publish Form</h2>
    </div>
    <div class="card-block">
        <label class="hiddenId" style="display: none">${id}</label>

        <div>

            <div class="form-group">
                <label for="option_boxDepartments">Choose a Department</label>
                <input type="text" name = "departmentList" id="option_boxDepartments" list="json-datalistDepartment" placeholder="Select a Department">
                <datalist id="json-datalistDepartment">
                    <g:each in="${departments}">
                        <option value="${it.name}"></option>
                    </g:each>
                </datalist>
            </div>

            <button class="loadCourses btn btn-default">Load Courses</button>

            <div id="courseList">

            </div>

        </div>


    </div>
</div>