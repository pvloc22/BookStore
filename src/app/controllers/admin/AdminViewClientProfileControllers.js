class AdminViewClientProfileControllers {
    AdminViewClientProfileGet(req, res) {
        res.render('AdminViewClientProfile', { layout: 'Admin_Layout.hbs' });
    }
}

module.exports = new AdminViewClientProfileControllers;