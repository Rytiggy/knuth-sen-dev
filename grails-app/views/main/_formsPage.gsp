<<<<<<< HEAD


<div id="mainContainer" class="container block-element-container">

    <div class="card text-center flex-item ">
        <div class="card-header">
            <h2>Forms</h2>
        </div>
        <div class="card-block">
            <g:if test="${forms.size() == 0}">
                <div>
                    <table class="formsDisplayTable" class="display" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Creation Date</th>
                            <th>Published</th>
                            <th>Publish Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <br>
                <button class="newFormButton">New Form</button>
            </g:if>
            <g:else>
                <div>
                    <table class="formsDisplayTable" class="display" cellspacing="0" width="100%" min>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Creation Date</th>
                            <th>Published</th>
                            <th>Publish Date</th>
                            <th>Actions</th>
=======
<div class="card text-center flex-item ">
    <div class="card-header">
        <h2>Forms</h2>
    </div>
    <div class="card-block">
        <g:if test="${!forms}">
            <div>
                <table class="formsDisplayTable" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Creation Date</th>
                        <th>Published</th>
                        <th>Publish Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <br>
            <button type="button" class="newFormButton  btn btn-default">New Form <span class="glyphicon glyphicon-plus "></span></button>
        </g:if>
        <g:else>
            <div>
                <table class="formsDisplayTable" class="display" cellspacing="0" width="100%" min>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Creation Date</th>
                        <th>Published</th>
                        <th>Publish Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${forms}">
                        <tr class="table-hover" data-toggle="tooltip" data-placement="bottom" title="${it.description}" >
                            <td>${it.title}</td>
                            <td>${it.creationDate}</td>

                            <g:if test="${it.published == 0}">
                                <td>
                                    <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                </td>
                                <td>N/A</td>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i class="fa fa-paper-plane publishBtn fa-2x" aria-hidden="true" data-toggle="modal" data-target="#myModal"></i><i style="padding-left: 15px" class='fa fa-pencil editBtn fa-2x' aria-hidden='true'></i><i style="padding-left: 15px" class='fa fa-trash-o deleteBtn fa-2x' aria-hidden='true'></i>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <i class="fa fa-check" aria-hidden="true" style="color: green"></i>
                                </td>
                                <td>${it.publishDate}</td>
                                <td>
                                    <label class="hiddenId" style="display: none">${it.id}</label>
                                    <i class="fa fa-download downloadBtn fa-2x" aria-hidden="true"></i>
                                </td>
                            </g:else>
>>>>>>> c0fb066c509ed607135a0f8abd2e84a6d14e6272
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>
            <br>
            <button type="button" class="newFormButton  btn btn-default">New Form <span class="glyphicon glyphicon-plus "></span></button>


        </g:else>
    </div>
    <div class="card-footer text-muted">
        .
    </div>
</div>
