<div class="card text-center flex-item">
    <div class="card-header">
        <h2>Sections</h2>
    </div>
    <div class="card-block">
        <g:if test="${!sections}">
            <div>
                <table class="sectionsDisplayTable" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Active</th>
                        <th>Professor</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newSectionButton  btn btn-default">New Section <span class="glyphicon glyphicon-plus "></span></button>
        </g:if>
        <g:else>
            <div>
                <table class="sectionsDisplayTable" class="display" cellspacing="0" width="100%" min>
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Active</th>
                        <th>Professor</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sections}">
                        <tr>
                            <td>${it.title}</td>
                            <g:if test="${it.active == 0}">
                                <td>
                                    <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                </td>
                                <g:if test="${it.professor}">
                                    <td>${it.professor.fname} ${it.professor.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editSectionBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-off enableSectionBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <i class="fa fa-check" aria-hidden="true" style="color: green"></i>
                                </td>
                                <g:if test="${it.professor}">
                                    <td>${it.professor.fname} ${it.professor.lname}</td>
                                </g:if>
                                <g:else>
                                    <td></td>
                                </g:else>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i style="padding-left: 15px" class='fa fa-pencil editSectionBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-toggle-on disableSectionBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:else>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newSectionButton  btn btn-default">New Section <span class="glyphicon glyphicon-plus "></span></button>
        </g:else>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
