function addSampleNewRow()
{
   // console.log("btn clicked");
    var table = document.getElementById("dispatchDocumentsList");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);
   // console.log("Row-"+table_tr_count);
    //row_delete = table.deleteRow(index);
    var cell_sn = row.insertCell(0);
    var cell_product_name = row.insertCell(1);
    var cell_product_action = row.insertCell(2);
   

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";

    var document_name_id = "document_name"+table_tr_count;
    var document_number_id = "document_number"+table_tr_count;

    //console.log("product_name_id-"+product_name_id);

    cell_product_name.innerHTML="<input class='form-control' type='text' id='"+document_name_id+"' name='document_name[][document_name]' placeholder='document name (exp COA, Purchase Order etc)' required='required'>";

    cell_product_action.innerHTML = "<span class='glyphicon glyphicon-remove' id='"+table_tr_count+"' onclick=ondeleteProductFromTable(this)  style='cursor: pointer'></span>";

}

function ondeleteProductFromTable(el)
{
    //console.log("ondeleteProductFromTable");

    var id = parseInt(el.id) +1;
    //console.log("id-"+id);

    var table = document.getElementById("dispatchDocumentsList");
    var table_tr_count = table.children[1].children.length;
    // console.log("table_tr_count-"+table_tr_count);
    //console.log("Index is-"+id);

    row_delete = table.deleteRow(id);
}