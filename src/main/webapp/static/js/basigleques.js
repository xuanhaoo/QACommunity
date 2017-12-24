layui.use(['laydate','table','laytpl'], function() {
    var table = layui.table;
    var laydate = layui.laydate;
    var laytpl = layui.laytpl;

    $("#search-brow").on('click', function() {
        $.ajax({
            url: '<%=path%>/admin/qaBackQues_getBrowForDate.action'
            , data: ""
            , dataType: 'json'
            // 返回成功的
            , success: function (data) {
                if (data.status == "0") {
                    layer.msg("删除失败!!", {
                        icon: 2,
                        timeout: 2000
                    }, function () {
                        location.reload();
                    });
                } else {
                    layer.msg("删除成功!", {
                        icon: 1,
                        timeout: 2000
                    }, function () {
                        location.reload();
                    });
                }
            }
        });
    });

});