<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Departments</h2>
    </div>
    <div class="card-block">
        <g:if test="${!department}">
            <div>
                <table class="departmentDisplayTable" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Active</th>
                        <th>Department Coordinator</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newDepartmentButton  btn btn-default">New Department <span class="glyphicon glyphicon-plus "></span></button>
        </g:if>
        <g:else>
            <div>
                <table class="departmentDisplayTable" class="display" cellspacing="0" width="100%" min>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Active</th>
                        <th>Department Coordinator</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${department}">
                        <tr>
                            <td>${it.name}</td>
                            <g:if test="${it.active == 0}">
                                <td>
                                    <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                </td>
                                <g:if test="${it.departmentCoordinator}">
                                    <td>${it.departmentCoordinator.fname} ${it.departmentCoordinator.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editDepartmentBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-off enableDepartmentBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <i class="fa fa-check" aria-hidden="true" style="color: green"></i>
                                </td>
                                <g:if test="${it.departmentCoordinator}">
                                    <td>${it.departmentCoordinator.fname} ${it.departmentCoordinator.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editDepartmentBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-on disableDepartmentBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:else>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newDepartmentButton  btn btn-default">New Department<span class="glyphicon glyphicon-plus "></span></button>
        </g:else>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
