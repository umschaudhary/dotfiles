$(function(){
    $("#id_course").change(function(){

        const courseId = $("#id_course").val();
        var html="" ;
        if (courseId === '') return ;
        html+= '<option value="" > Select batch </option>' ;
        $('#id_batch').html('<option value>Select batch</option>');
        const url = "/courses/"+ courseId + "/batches/";
        $.getJSON(url,function (data) {
            for (var i=0;i<data.length;i++){
               html += ' <option value="' + data[i].id + '">' + data[i].name + '</option>';
            }
            $("#id_batch").html(html)

        })
    })


});






// $(document).ready(function () {
//     // Course dropdown
//     $("#id_course").change(function () {
//         var loading = $('#batch-loading');
//         var courseId = $("#id_course").val();
//         var html = "";
//
//         if (courseId == "") return;
//
//         html += '<option value="">Select batch</option>';
//         $("#id_section").html('<option value="">Select section</option>');
//
//         loading.addClass('fs-blue');
//         $.getJSON("/courses/" + courseId + "/batches/?is_active=True", function (data) {
//             for (var i = 0; i < data.length; i++) {
//                 html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
//             }
//
//             loading.removeClass('fs-blue');
//             $("#id_batch").html(html);
//         });
//     });
//
//
// // // Batch dropdown
//     $("#id_batch").change(function () {
//         var loading = $('#section-loading');
//         var batchId = $("#id_batch").val();
//         var html = "";
//
//         if (batchId == "") return;
//
//         html += '<option value="">Select section</option>';
//
//         loading.addClass('fs-blue');
//         $.getJSON("/courses/batches/" + batchId + "/sections/", function (data) {
//             for (var i = 0; i < data.length; i++) {
//                 html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
//             }
//
//             loading.removeClass('fs-blue');
//             $("#id_section").html(html);
//         });
//     });
// });
// // $('#id_admission_no').blur(function () {
// //    $('#id_user_form-email').val('noreply' + $(this).val() + '@zefed.com');
// //    $('#id_user_form-username').val($(this).val());
// //    $('#id_user_form-password').val($(this).val() + '123');
// // });
// //
// // $('#id_email').blur(function () {
// //     var email = $(this).val();
// //
// //     if (email == '')
// //         return;
// //
// //     $('#id_user_form-email').val(email);
// // });
