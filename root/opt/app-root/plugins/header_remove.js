exports.register = function () {
    this.load_header_remove_ini();
};

exports.load_header_remove_ini = function () {
    const plugin = this;

    plugin.cfg = plugin.config.get('header_remove.ini', function () {
        plugin.load_header_remove_ini();
    });
};

exports.hook_queue_outbound = function (next, connection) {
    const plugin = this;

    const headers = plugin.cfg.main.headers.split(',');

    for (let i=0; i<headers.length; i++) {
        connection.transaction.remove_header(headers[i]);
    }

    next();
};
