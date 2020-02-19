function onChangeUserLocation()
{
    var selectedUserLocationValue = $('#userLocationMaster').val();

    $.ajax({

        type: 'GET',
        url:  '/dashboard/latestLocation/'+selectedUserLocationValue,
        dataType: 'json',
        data : ({selectedUserLocationValue:selectedUserLocationValue}),
        beforeSend: function (request) {  return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content')); },
        success: function (resp) { }
    });

    window.location.href= '/dashboard/latestLocation/'+selectedUserLocationValue;
}