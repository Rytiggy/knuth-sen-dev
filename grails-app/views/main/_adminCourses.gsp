<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Courses</h2>
    </div>
    <div class="card-block">
        <g:if test="${!courses}">
            <div>
                <table class="coursesDisplayTable" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Active</th>
                        <th>Coordinator</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newCourseButton  btn btn-default">New Course <span class="glyphicon glyphicon-plus "></span></button>
        </g:if>
        <g:else>
            <div>
                <table class="coursesDisplayTable" class="display" cellspacing="0" width="100%" min>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Active</th>
                        <th>Coordinator</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courses}">
                        <tr class="table-hover" data-toggle="tooltip" data-placement="bottom" title="${it.description}">
                            <td>${it.name}</td>
                            <g:if test="${it.active == 0}">
                                <td>
                                    <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                </td>
                                <g:if test="${it.courseCoordinator}">
                                    <td>${it.courseCoordinator.fname} ${it.courseCoordinator.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editCourseBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-off enableCourseBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <i class="fa fa-check" aria-hidden="true" style="color: green"></i>
                                </td>
                                <g:if test="${it.courseCoordinator}">
                                    <td>${it.courseCoordinator.fname} ${it.courseCoordinator.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editCourseBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-on disableCourseBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:else>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newCourseButton  btn btn-default">New Course <span class="glyphicon glyphicon-plus "></span></button>
        </g:else>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
