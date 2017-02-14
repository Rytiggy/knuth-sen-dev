
<div id="mainContainer" class="container block-element-container">

    <div class="card text-center flex-item">
        <div class="card-header">
            <h2>Edit Form</h2>
        </div>
        <div class="card-block">
            <label class="hiddenId" style="display: none">${form.id}</label>

            <div>
                <div class="form-group">
                    <label>Title </label>
                    <input type="text" class="form-control titleInput" id="formGroupExampleInput" placeholder=${form.title}>
                </div>
                <div class="form-group">
                    <label>Question </label>
                    <input type="text" class="form-control questionInput"  placeholder=${form.question}>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea class="form-control descriptionTextArea" id="exampleTextarea" rows="3">${form.description}</textarea>
                </div>


                <button class="saveEditForm btn btn-default">Save</button>
                <button class="cancelEditForm btn btn-danger">Cancel</button>
            </div>


        </div>
        <div class="card-footer text-muted">
            .
        </div>
    </div>

</div>