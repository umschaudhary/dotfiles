 $(function () {


                $(" #id_tender,#id_tax_percent,#id_discount,#id_discount_percent").change(function () {
                    partial_total = $("#id_partial_total").val();
                    discount_percent = $('#id_discount_percent').val();

                    if (discount_percent) {
                        discount = (discount_percent * partial_total) / 100;
                        taxable_amount = partial_total - discount;
                    }
                    else {
                        discount = $("#id_discount").val();
                        taxable_amount = partial_total - discount;
                    }


                    tax_percent = $("#id_tax_percent").val();

                    tax_amount = (taxable_amount * tax_percent) / 100;

                    grand_total = partial_total - discount + tax_amount;
                    $("#id_total").val(grand_total);
                    tender = $('#id_tender').val()
                    returnAmount = tender - grand_total

                    $('#id_return').val(returnAmount.toFixed(2))

                    $('#id_sum_total').text(partial_total)
                    if (tax_percent > 0) {
                        $('#id_tax_percent_val').text(tax_percent)
                    }

                    $('#id_tax_amount').text(tax_amount)
                    if (discount > 0) {
                        $('#id_discount_amount').text(discount)

                    }


                    $('#id_tender_amount').text(tender)
                    $('#id_return_amount').text(returnAmount.toFixed(2))
                    //alert(partial_total);
                })

            })