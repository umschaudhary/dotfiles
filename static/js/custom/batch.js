$(function () {

    /* Functions */

    var loadForm = function () {
        var btn = $(this);
        $.ajax({
            url: btn.attr("data-url"),
            type: 'get',
            dataType: 'json',
            beforeSend: function () {
                $("#modal-batch .modal-content").html("");
                $("#modal-batch").modal("show");
            },
            success: function (data) {
                $("#modal-batch .modal-content").html(data.html_form);
            }
        });
    };

    var saveForm = function () {
        var form = $(this);
        $.ajax({
            url: form.attr("action"),
            data: form.serialize(),
            type: form.attr("method"),
            dataType: 'json',
            success: function (data) {
                if (data.form_is_valid) {
                    $("#batch-table tbody").html(data.html_batch_list);
                    $("#modal-batch").modal("hide");
                }
                else {
                    $("#modal-batch .modal-content").html(data.html_form);
                }
            }
        });
        return false;
    };


    /* Binding */

    // Create batch
    $(".js-create-batch").click(loadForm);
    $("#modal-batch").on("submit", ".js-batch-create-form", saveForm);

    // Update batch
    $("#batch-table").on("click", ".js-update-batch", loadForm);
    $("#modal-batch").on("submit", ".js-batch-update-form", saveForm);

    // Delete batch
    $("#batch-table").on("click", ".js-delete-batch", loadForm);
    $("#modal-batch").on("submit", ".js-batch-delete-form", saveForm);

});
