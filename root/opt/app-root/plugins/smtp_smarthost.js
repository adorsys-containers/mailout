// based ony https://github.com/haraka/Haraka/blob/ff7646d879b1c21d0cfcd5f1d62eaf607cc452a8/plugins/queue/smtp_bridge.js

exports.register = function () {
    this.load_smtp_smarthost_ini();
};

exports.load_smtp_smarthost_ini = function () {
    const plugin = this;

    plugin.cfg = plugin.config.get('smtp_smarthost.ini', function () {
        plugin.load_smtp_smarthost_ini();
    });
};

// https://github.com/haraka/Haraka/blob/ff7646d879b1c21d0cfcd5f1d62eaf607cc452a8/docs/Outbound.md#the-get_mx-hook
exports.hook_get_mx = function (next, hmail, domain) {
    let priority = 10;
    if (this.cfg.main.priority) {
        priority = this.cfg.main.priority;
    }

    let authType = null;
    if (this.cfg.main.auth_type) {
        authType = this.cfg.main.auth_type;
    }

    let authUser = null;
    if (this.cfg.main.auth_user) {
        authUser = this.cfg.main.auth_user;
    }

    let authPass = null;
    if (this.cfg.main.auth_pass) {
        authPass = this.cfg.main.auth_pass;
    }

    let bindHelo = null;
    if (this.cfg.main.bind_helo) {
        bindHelo = this.cfg.main.bind_helo;
    }

    let port = null;
    if (this.cfg.main.port) {
        port = this.cfg.main.port;
    }

    return next(OK, {
        priority: priority,
        exchange: this.cfg.main.host,
        port: port,
        bind_helo: bindHelo,
        auth_type: authType,
        auth_user: authUser,
        auth_pass: authPass
    });
};
